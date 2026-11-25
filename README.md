# homebrew-studio

Homebrew tap for the [studio kit](https://github.com/YuLiangGoh/studio-toolkit) (`sk`): local songs, 3D layouts,
anime paintings and looping videos on Apple Silicon Macs.

```sh
brew install yuliangoh/studio/studio-kit
sk          # first run: installs the kit into ~/studio/toolkit and checks this Mac
```

Later, `sk update` gets new versions of the kit; `brew upgrade studio-kit` updates only the small `sk` launcher.

The formula is named `studio-kit`, not `sk`, because homebrew-core's `sk` is skim (a fuzzy finder). Both install
an `sk` command, so they can't be installed together.

Releases: tag the toolkit `vX.Y.Z`, then set `tag` and `revision` in `Formula/studio-kit.rb`
(the source copy is `packaging/homebrew/studio-kit.rb` in the toolkit repo).
