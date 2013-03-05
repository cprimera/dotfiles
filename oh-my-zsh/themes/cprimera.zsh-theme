function collapse_pwd {
	echo $(pwd | sed -e "s,^$HOME,~,")
}

function prompt_char {
	git branch >/dev/null 2>/dev/null && echo '±' && return
	svn info >/dev/null 2>/dev/null && echo 'Ƨ' && return
	echo '○'
}

function git_repo {
	echo `git remote -v | grep fetch | cut -d" " -f1 | cut -f2 | grep -o '\/[^\/]*$' | grep -o '^[^\.]*' | grep -o '[^\/]*'`
}

function git_status {
	if [ "`git status -s`" = "" ]; then
		echo "%{$fg_bold[green]%}✓"
	else
		echo "%{$fg_bold[yellow]%}✗"
	fi
}

function git_prompt {
	gp="$(git_prompt_short_sha)$(git_prompt_info)"
	if [ "x$gp" != "x" ]; then
		echo "-<%{$fg_bold[red]%}$(git_repo)%{$fg_no_bold[cyan]%}.%{$fg_bold[red]%}$(current_branch)%{$fg_no_bold[cyan]%}.$(git_status)%{$fg_no_bold[cyan]%}>"
	else
		echo ""
	fi
}

function svn_prompt {
	if [ $(in_svn) ]; then
		echo "-<%{$fg_bold[red]%}$(svn_get_repo_name)%{$fg_no_bold[cyan]%}.%{$fg_bold[red]%}$(svn_get_branch_name)$(svn_dirty)%{$fg_no_bold[cyan]%}>"
	else
		echo ""
	fi
}

function return_status {
	echo %(?.%{$fg_bold[green]%}.%{$fg_bold[yellow]%})%?
}

PROMPT='%{$fg_no_bold[cyan]%}<%{$fg_bold[green]%}%n%{$fg_no_bold[cyan]%}@%{$fg_bold[yellow]%}%m%{$fg_no_bold[cyan]%}>-<%{$fg_bold[cyan]%}$(prompt_char)%{$fg_no_bold[cyan]%}>$(git_prompt)$(svn_prompt)
%{$fg_no_bold[cyan]%}<%{$fg_bold[cyan]%}$(collapse_pwd)%{$fg_no_bold[cyan]%}>%{$reset_color%} '

RPROMPT='%{$fg_no_bold[cyan]%}[%(?.%{$fg_bold[green]%}.%{$fg_bold[yellow]%})%?%{$fg_no_bold[cyan]%}]%{$reset_color%}'


#PROMPT='%{$fg_bold[red]%}➜ %{$fg_bold[green]%}%p %{$fg[cyan]%}%c %{$fg_bold[blue]%}$(git_prompt_info)%{$fg_bold[blue]%} % %{$reset_color%}'

ZSH_THEME_GIT_PROMPT_PREFIX=""
ZSH_THEME_GIT_PROMPT_SUFFIX=""
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg_no_bold[cyan]%}.%{$fg_bold[yellow]%}✗%{$fg_no_bold[cyan]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg_no_bold[cyan]%}.%{$fg_bold[green]%}✓%{$fg_no_bold[cyan]%}"

ZSH_THEME_SVN_PROMPT_DIRTY="%{$fg_no_bold[cyan]%}.%{$fg_bold[yellow]%}✗%{$fg_no_bold[cyan]%}"
ZSH_THEME_SVN_PROMPT_CLEAN="%{$fg_no_bold[cyan]%}.%{$fg_bold[green]%}✓%{$fg_no_bold[cyan]%}"
