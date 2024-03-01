scons compiledb=yes

./bin/godot.windows.editor.x86_64.exe --headless --dump-extension-api-with-docs
./bin/godot.windows.editor.x86_64.exe --headless --dump-gdextension-interface

cp gdextension_interface.h ../godot-api-export/gdextension_interface.h
[Console]::Out.Flush() 
cp extension_api.json ../godot-api-export/extension_api.json

cd ../godot-cpp
scons generate_bindings=yes build_library=no
cd ../godot
