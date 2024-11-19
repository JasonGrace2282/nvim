local command = [[
ifrom manim import *

def main():
with tempconfig({"preview": True}):
Test().render()

<Backspace><Backspace>if __name__ == "__main__":
main()
<Esc>ggjA
class Test(Scene):
def construct(self):


<Esc>3kA<Tab><Tab>
]]

vim.keymap.set("n", "<Leader>mm", command, {})
