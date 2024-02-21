default: mprocs

hugo:
  rm -rf ./public && hugo server --disableFastRender --renderToDisk

mprocs:
  mprocs "just hugo"
