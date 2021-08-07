{-# LANGUAGE LambdaCase #-}

module TeX where

import Control.Monad
import Control.Monad.Reader
import Data.Functor

data Mode = Chinese | English
  deriving (Eq, Ord, Show)

type Resume = Reader Mode String

cen :: String -> String -> Resume
cen c e =
  ask <&> \case
    Chinese -> c
    _ -> e

en :: String -> Resume
en = cen []

cn :: String -> Resume
cn = flip cen []

paragraph :: [Resume] -> Resume
paragraph [] = pure []
paragraph (r : rs) = f <$> r <*> paragraph rs
  where
    f "" b = b
    f a "" = a
    f a b = a ++ "\n" ++ b

tex :: String -> String -> String -> Resume
tex n c e = do
  ce <- cen c e
  pure $ "\\" ++ n ++ "{" ++ ce ++ "}"

item :: String -> String -> Resume
item = tex "item"

ritem :: String -> String -> Resume
ritem = tex "resitem"

sec :: String -> String -> Resume
sec = tex "resheading"

url :: String -> String
url s = "\\url{" ++ s ++ "}"

href :: String -> String
href s = "\\href{" ++ s ++ "}"

github :: String -> Resume
github s = pure . url $ "https://github.com/" ++ s

section :: String -> String -> [Resume] -> Resume
section c e = paragraph . (sec c e :)

date :: String -> String -> Resume
date y m = cen (y ++ "." ++ m) (m ++ "/" ++ y)

present :: Resume
present = cen "至今" "Present"

itemTeX :: String -> String -> Resume
itemTeX c e =
  paragraph
    [ pure "\\item",
      (++ ":") <$> tex "textbf" c e
    ]

peroidSecion :: Resume -> Resume -> Resume -> Resume -> Resume -> [Resume] -> Resume
peroidSecion company city field job time desc = do
  co <- company
  ci <- city
  f <- field
  j <- job
  t <- time
  de <- paragraph desc
  pure $
    "\\ressubheading{" ++ co ++ "}{" ++ ci ++ "}{" ++ f ++ "}{" ++ j ++ "}{" ++ t ++ "}\n"
      ++ "{\\small\\begin{itemize}[parsep=0.25ex]\n"
      ++ de
      ++ "\n\\end{itemize}}"

datedSection :: Resume -> Resume -> Resume -> Resume
datedSection main sub time = do
  m <- main
  s <- sub
  t <- time
  pure $ "\\ressubsingleline{" ++ m ++ "}{" ++ s ++ "}{" ++ t ++ "}"

(~~) :: Resume -> Resume -> Resume
start ~~ end = do
  s <- start
  t <- end
  pure $ s ++ " -- " ++ t

itemize :: [Resume] -> Resume
itemize rs =
  paragraph $
    [pure "\\begin{itemize}[parsep=0.25ex,leftmargin=*]"]
      ++ rs
      ++ [pure "\\end{itemize}"]

ritemize :: [Resume] -> Resume
ritemize rs =
  paragraph $
    [pure "\\begin{itemize}[parsep=0.25ex,leftmargin=*]"]
      ++ map (fmap f) rs
      ++ [pure "\\end{itemize}"]
  where
    f = \case
      "" -> ""
      it -> "\\item " ++ it
