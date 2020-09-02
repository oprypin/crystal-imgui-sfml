# crystal-imgui-sfml

#### [Crystal][] bindings to [ImGui-SFML][]

Introduction
------------

This library makes it straightforward to  
&nbsp; use [Dear ImGui][imgui] (through its [crystal-imgui][] binding)  
&nbsp; with [SFML][] (through its [CrSFML][] binding).

**See the [example](example.cr).**

*crystal-imgui-sfml* does _not_ attempt to serve as a _wrapper_ for all of these, rather it's just the "glue",  
and so both [crystal-imgui][] and [CrSFML][] will still be explicit dependencies of your project.

That said, *crystal-imgui-sfml* _does_ take over some parts of the installation process from [crystal-imgui][].

Installation
------------

First, [install SFML](https://github.com/oprypin/crsfml#prerequisites).

Then add to your project's _shard.yml_ file:

```yaml
dependencies:
  crsfml:
    github: oprypin/crsfml
  imgui:
    github: oprypin/crystal-imgui
  imgui-sfml:
    github: oprypin/crystal-imgui-sfml
```

Resolve dependencies with [Shards][]:

```bash
shards install
```

During installation this will invoke `make` to build the C++ wrappers as object files. SFML headers are expected to be available in the default include path.

Try running the example:

```bash
crystal example.cr
```

### Custom SFML location

If SFML's headers and libraries are not in a path where the compiler would look by default, additional steps are needed.

Before building the extensions (`make`) you need to configure the include path:

```bash
export CXXFLAGS="-I/full/path/to/sfml/include"
export LIBRARY_PATH="/full/path/to/sfml/lib"
make
```

[More details at CrSFML](https://github.com/oprypin/crsfml#custom-sfml-location)

### crystal-imgui-sfml without Shards

It's also possible to use *crystal-imgui-sfml* outside of Shards, as with any library. One option is to directly create a symbolic link to *crystal-imgui-sfml* in your project's *lib* folder.

```bash
mkdir lib
ln -s /full/path/to/crsfml lib/crsfml
ln -s /full/path/to/crystal-imgui lib/imgui
ln -s /full/path/to/crystal-imgui-sfml lib/imgui-sfml
```

Note, though, that the C bindings inside the _crystal-imgui-sfml_ directory must be additionally built using `make`.  
Which, in turn, requires this repository to have been cloned with submodules:

```bash
git clone --recursive https://github.com/oprypin/crystal-imgui-sfml
```

Credits
-------

*crystal-imgui-sfml* was made by [Oleh Prypin][oprypin]. It uses and is based on [ImGui-SFML].

*crystal-imgui-sfml* is [licensed](LICENSE.md) under the terms and conditions of the *MIT* license.


[imgui-sfml]: https://github.com/eliasdaler/imgui-sfml
[imgui]: https://github.com/ocornut/imgui
[sfml]: https://www.sfml-dev.org/ "Simple and Fast Multimedia Library"
[crystal-imgui]: https://github.com/oprypin/crystal-imgui
[crsfml]: https://github.com/oprypin/crsfml

[crystal]: https://crystal-lang.org/
[shards]: https://github.com/crystal-lang/shards

[oprypin]: https://github.com/oprypin
