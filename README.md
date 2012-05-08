#Dotfiles repo

Simple, just a collection of dotfiles that are useful to me. The dotfiles are in files/, to allow for easy copy from repo and keep separate from the .git or whatever else I might add later at the root.

No script to create/modify/remove symlinks, or to sync a file list. I've read too much this morning on ways to use git and bash to rip through dirs --all fun to mess around with in bash--but it's time to get some actual work done.

To keep your local copies up to date, just run *copy* from your home directory:

`mikescar@host:~ $ git clone git@github.com:mikescar/dotfiles.git

mikescar@host:~ $ cp -Ruv .dotfiles/files/* .`

That's it. Maybe a clever script later if this becomes unwieldy.
