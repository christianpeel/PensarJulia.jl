using Documenter

makedocs(
  #format = :latex,
  format = :html,
  sitename = "Think Julia",
  authors = "Ben Lauwens with Allen B. Downey",
  pages = [
    hide("copyright.md"),
    "preface.md",
    "chap01.md",
    "chap02.md",
    "chap03.md",
    "chap04.md",
    "chap05.md",
    "chap06.md",
    "chap07.md",
    "chap08.md",
    "chap09.md",
    "chap10.md",
    "chap11.md",
    "chap12.md",
    "chap13.md",
    "chap14.md",
    "chap15.md",
    "chap16.md",
    "chap17.md",
    "chap18.md",
    "chap19.md",
    "chap20.md"
  ]
)

const dir = joinpath("build/images")
mkpath(dir)
using ThinkJulia
cd(makefigs, dir)

deploydocs(
  repo   = "github.com/BenLauwens/ThinkJulia.jl",
  target = "build",
  deps   = nothing,
  make   = nothing,
  julia  = "nightly",
  osname = "osx"
)

if "deploy" in ARGS
  fake_travis = "fake_travis.jl"
  if isfile(fake_travis)
    include(fake_travis)
  end
  deploydocs(
    repo = "github.com/BenLauwens/ThinkJulia.jl",
    target = "build",
    branch = "gh-pages",
    latest = "master",
    osname = "osx",
    julia  = "nightly",
    deps = nothing,
    make = nothing,
  )
end
