#Dotfiles repo

Simple, just a collection of dotfiles that are useful to me. The dotfiles are in files/, to allow for easy copy from repo and keep separate from the .git or whatever else I might add later at the root.

No clever script to create/modify symlinks, or to sync files to repo. To keep your local copies up to date, just run *copy* from your home directory:
`mikescar@host:~ $ cp -Ruv .dotfiles/files/* .`

That's it. Maybe a clever script later if this becomes unwieldy.
