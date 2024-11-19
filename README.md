## My Neovim Config
Currently working on my neovim config.
![image](https://github.com/JasonGrace2282/nvim/assets/110117391/9d4b2572-56d2-4f3f-b266-b7ae514d7e5f)

#### Status
This config is mostly stable and ready for use.


### Installation:
```bash
curl -L https://raw.githubusercontent.com/JasonGrace2282/nvim/main/setup.sh | bash
```

If you would like to add projects (utilized by `code_runner.nvim`),
create a file at `lua/config/projects.lua`. You can then put the following there:
```lua
return {
  ["~/python/intel_2021_1"] = {
    name = "Intel Course 2021",
    description = "Simple python project",
    file_name = "POO/main.py"
  },
  ["~/deno/example"] = {
    name = "ExampleDeno",
    description = "Project with deno using other command",
    file_name = "http/main.ts",
    command = "deno run --allow-net"
  },
  ["~/cpp/example"] = {
    name = "ExampleCpp",
    description = "Project with make file",
    command = "make build && cd build/ && ./compiled_file"
  },
  ["~/private/.*terraform%-prod.-/.-"] = {
    name = "ExampleTerraform",
    description = "All Folders in ~/private containing \"terraform-prod\"",
    command = "terraform plan",
  },
},
```
See the [docs](https://github.com/CRAG666/code_runner.nvim?tab=readme-ov-file#lua-2) for more info.
