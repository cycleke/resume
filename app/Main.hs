{-# LANGUAGE LambdaCase #-}
module Main where

import Control.Monad.Reader
import Resume
import System.Environment
import TeX (Mode (..), paragraph)

main :: IO ()
main = getArgs >>= \case
  ["zh"] -> f Chinese
  ["en"] -> f English
  ["bi"] -> g
  _ -> putStrLn $ unlines    [ "Usage: <program> MODE"
    , "MODE can be cn, en or bi"
    ]
  where
    f = putStrLn . runReader (paragraph [header, body, ender])
    g = do
      putStrLn $ runReader header Chinese
      putStrLn $ runReader body Chinese
      putStrLn $ runReader spliter Chinese
      putStrLn $ runReader body English
      putStrLn $ runReader ender Chinese
