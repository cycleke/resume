#!/bin/bash
#
# Created by cycleke at 2021/03/01
#

updatePDF() {
	echo "======generating LaTeX========"

	stack run -- zh >>latex/resume-zh.tex
	stack run -- en >>latex/resume-en.tex
	stack run -- bi >>latex/resume-bi.tex

	echo "======building pdf files======"

	make -C latex >>latex/make.log
	mv latex/*.pdf .
	make -C latex clean

	echo "====removing useless files===="

	rm -rf .git *~
	make -C latex clean-tex
}

updateGit() {
	echo "===initialize git repository=="

	git init
  git remote add origin git@github.com:cycleke/resume.git

	echo "======committing changes======"

	git add *
	git add .gitignore
	git commit -a -m "更新个人简历"

	echo "=====pushing, please wait====="

	git push --force origin HEAD
	git status
}

updatePDF
while getopts "g" arg; do
	case $arg in
	g)
		updateGit
		;;
	*) ;;
	esac
done
echo "========all tasks done========"
