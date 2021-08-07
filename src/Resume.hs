module Resume (header, body, spliter, ender) where

import TeX

basicInfo :: Resume
basicInfo =
  paragraph
    [ tex "name" "路遥柯" "Cycleke",
      pure "\\basicInfo{",
      pure $ "\\email{cycleke@gmail.com}" ++ period,
      pure $ "\\phone{188xxxx8163}" ++ period,
      pure $ "\\github[cycleke]{https://github.com/cycleke/}" ++ period,
      pure "\\homepage[blog.cycleke.com]{https://blog.cycleke.com}",
      pure "}"
    ]
  where
    period = "\\textperiodcentered\\"

education :: Resume
education =
  section
    "教育经历"
    "Education"
    [ peroidSecion
        (cen "哈尔滨工业大学" "Harbin Institute of Technology")
        (cen "哈尔滨" "Harbin")
        (cen "数据科学与大数据技术" "Data Science and Big Data Technology")
        (cen "本科在读， 预计 2022.06 毕业" "Undergraduate, Anticipated Graduation Date: 2022.06")
        (date "2018" "09" ~~ present)
        [ ritem
            ("平均学分绩：" ++ gpa ++ "，排名：" ++ rank)
            ("GPA: " ++ gpa ++ ", Rank: " ++ rank),
          ritem
            ( "部分课程成绩："
                ++ "形式语言与自动机（98.4），"
                ++ "概率论与数理统计（97），"
                ++ "数理逻辑（95），"
                ++ "代数与几何（95），"
                ++ "大数据计算基础（94），"
                ++ "计算机系统（93.6），"
                ++ "计算机网络（90.2）"
            )
            ( "Part of the course grades:"
                ++ "Formal Languages and Automata (98.4),"
                ++ "Probability Theory and Mathematical Statistics (97),"
                ++ "Mathematical Logic (95),"
                ++ "Algebra and Geometry (95),"
                ++ "Basics of Big Data Computing (94),"
                ++ "Computer System (93.6),"
                ++ "Computer Network (90.2)"
            )
        ]
    ]
  where
    gpa = "88.8428/100"
    rank = "10/35"

awards :: Resume
awards =
  section "获奖情况" "Awards" . pure $
    ritemize
      [ datedSection
          (cen "2019 ICPC 亚洲沈阳区域赛现场赛" "The 2019 ICPC Asia Shenyang On Site Regional Contest")
          (cen "金奖" "Gold Medal")
          $ date "2019" "11",
        datedSection
          (cen "第六届中国大学生程序设计竞赛（威海）" "2020 China Collegiate Programming Contest, Weihai Site")
          (cen "银奖" "Silver Medal")
          $ date "2020" "10",
        datedSection
          (cen "2020 ICPC 亚洲济南区域赛现场赛" "The 2020 ICPC Asia Jinan Regional Contest")
          (cen "银奖" "Silver Medal")
          $ date "2020" "12",
        datedSection
          (cen "2019 百度之星程序设计大赛全国 400 强" "2019 Baidu Astra Programming Competition Top 400")
          (cen "第 184 名" "184th")
          $ date "2019" "10",
        datedSection
          (cen "第十三届东北四省大学生程序设计竞赛" "The 13th Chinese Northeast Collegiate Programming Contest")
          (cen "一等奖" "First Prize")
          $ date "2019" "05",
        datedSection
          (cen "第十四届东北四省大学生程序设计竞赛" "The 14th Chinese Northeast Collegiate Programming Contest")
          (cen "一等奖" "First Prize")
          $ date "2020" "10",
        datedSection
          (cen "第十四届黑龙江省大学生程序设计竞赛" "The 14th Heilongjiang Provincial Collegiate Programming Contest")
          (cen "一等奖" "First Prize")
          $ date "2019" "05",
        datedSection
          (cen "第十五届黑龙江省大学生程序设计竞赛" "The 15th Heilongjiang Provincial Collegiate Programming Contest")
          (cen "一等奖" "First Prize")
          $ date "2020" "09",
        datedSection
          (cen "2020 CCF CCSP 竞赛" "2020 CCF Collegiate Computer Systems \& Programming Contest")
          (cen "金奖" "Gold Medal")
          $ date "2020" "10",
        datedSection
          (cen "2020 CSP 第二十次 CCF 计算机软件能力认证" "2020 The 20th CCF Certified Software Professional")
          (cen "364分 (前 1.07 \\%)" "364 points (top 1.07 \\%)")
          $ date "2020" "09"
      ]

wxgIntership :: Resume
wxgIntership =
  peroidSecion
    (cen "腾讯" "Tencent")
    (cen "广州" "Guangzhou")
    (cen "微信事业群/技术架构部" "WXG/Technical Architecture Department")
    (cen "后台开发实习生" "Backend Developer Intern")
    (date "2021" "07" ~~ date "2021" "08")
    [ ritem "优化路由查询代码。" "Optimized routing query code.",
      ritem "学习 C++，Linux 编程相关知识。" "Learn C++, Linux programming related knowledge."
    ]

intership :: Resume
intership =
  section
    "实习经历"
    "Internship"
    [wxgIntership]

programLanguages :: Resume
programLanguages =
  paragraph
    [ itemTeX "编程语言" "Program Language",
      cn $ "了解 " ++ somehow ++ " 编程。",
      en $ "comfortable with " ++ somehow ++ "."
    ]
  where
    somehow = "C C++ Python"

algorithmDesign :: Resume
algorithmDesign =
  paragraph
    [ itemTeX "算法设计" "Algorithm Design",
      cn "参加学习了算法竞赛，熟悉常用的数据结构和算法，对算法研究感兴趣。",
      en "learned algorithm competition, familiar with some common data structures and algorithms with algorithm design capabilities."
    ]

devTools :: Resume
devTools =
  paragraph
    [ itemTeX "开发工具" "Development Tool",
      cn "能适应常用编辑器和操作系统，日常使用 Arch Linux，",
      cn "具有使用 git 团队协作工具的经验。",
      en "can adapt to common editors/OSs, usually use Arch Linux,",
      en "have experience with team collaboration tool git."
    ]

skills :: Resume
skills =
  section "技能专长" "Skills" . pure $
    itemize
      [ programLanguages,
        algorithmDesign,
        devTools
      ]

proxyServer :: Resume
proxyServer =
  paragraph
    [ datedSection
        (cen "简单 HTTP 代理服务器的设计与实现" "Simple HTTP Proxy Server")
        (cen "Python 网络编程" "Network Programming in Python")
        $ date "2020" "11",
      cen
        "{\\small 设计并实现一个基本 HTTP 代理服务器，并支持缓存功能、网站过滤、用户过滤和网站引导。}"
        "{\\small Designed and implemented a basic HTTP proxy server, which supports caching, website filtering, user filtering and website guidance.}"
    ]

memoryLinux :: Resume
memoryLinux =
  paragraph
    [ datedSection
        (cen "Linux 下内存管理" "Memory management under Linux")
        (cen "C 语言编程" "C Programming")
        $ date "2019" "12",
      cen
        "{\\small 使用 C 语言编写一个内存管理机制，通过链表使用内存的申请和释放回收。}"
        "{\\small Write a memory management mechanism in C that uses memory request and release reclamation through a chain table.}"
    ]

project :: Resume
project =
  section "个人项目" "Person Project" . pure $
    ritemize [proxyServer, memoryLinux]

miscellaneous :: Resume
miscellaneous =
  section "其他" "Miscellaneous" . pure $
    ritemize
      [ cen
          "获得两次人民奖学金，一次国家励志奖学金"
          "Won two People's Scholarships and one National Inspirational Scholarship"
      ]

body :: Resume
body =
  paragraph
    [ basicInfo,
      education,
      awards,
      intership,
      project,
      skills,
      miscellaneous
    ]

header :: Resume
header =
  paragraph
    [ pure "%!TEX program = xelatex",
      pure "\\documentclass[11pt]{article}",
      pure "\\usepackage[BoldFont,SlantFont]{xeCJK}",
      pure "\\xeCJKsetemboldenfactor{4}",
      pure "\\setCJKmainfont{Source Han Serif CN}",
      pure "\\setCJKmonofont{Source Han Serif CN}",
      pure "\\setCJKsansfont{Source Han Sans CN}",
      pure "\\input{format.cls}",
      pure "\\begin{document}"
    ]

spliter :: Resume
spliter = paragraph [pure "\\newpage"]

ender :: Resume
ender = paragraph [pure "\\end{document}"]
