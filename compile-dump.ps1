scons compiledb=yes
[Console]::Out.Flush() 
start-sleep -seconds 1

./bin/godot.windows.editor.x86_64.exe --headless --dump-extension-api-with-docs
[Console]::Out.Flush() 
start-sleep -seconds 1

./bin/godot.windows.editor.x86_64.exe --headless --dump-gdextension-interface
[Console]::Out.Flush() 
start-sleep -seconds 1

cp gdextension_interface.h ../godot-api-export/gdextension_interface.h
cp extension_api.json ../godot-api-export/extension_api.json

cd ../godot-cpp
scons gdextension_dir="../godot-api-export" generate_bindings=yes build_library=no
cd ../godot
