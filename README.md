My dotfile repo
###


To use:
###

	git clone --bare <git-repo-url> $HOME/.cfg

	alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

	config checkout

	config config --local status.showUntrackedFiles no


Move offending files to .config-backup
###
	mkdir -p .config-backup && \
	config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
	xargs -I{} mv {} .config-backup/{}A


Original setup guide
###

	https://developer.atlassian.com/blog/2016/02/best-way-to-store-dotfiles-git-bare-repo/
