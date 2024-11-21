# QuasysNvim  
### _NVChad Config for Python, Java, and C++_

---

## 🌟 Features  

- **📋 Dashboard**: NvDash for a clean starting view.  
- **💾 Session Management**: Easily resume work with SessionManager.  
- **✨ Auto-Formatting**: Integrated [conform.nvim](https://github.com/stevearc/conform.nvim):  
  - **Stylua** for Lua  
  - **clang-format** for C++  
  - **Ruff**, **Yapf**, **Black** for Python  
- **🔗 Git Integration**: Track changes with [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim).  
- **🚦 Linting**: Real-time code analysis via [nvim-lint](https://github.com/mfussenegger/nvim-lint):  
  - **Ruff**, **Mypy** for Python  
  - **Cpplint**, **Cppcheck** for C++  
- **💡 Inlay Hints**: Improve code clarity with [inlay-hints.nvim](https://github.com/simrat39/inlay-hints.nvim).  
- **📏 Indent Guides**: Enhanced readability with Indent-Blankline.  
- **🎨 UI Enhancements**: Smooth workflows via [dressing.nvim](https://github.com/stevearc/dressing.nvim).  
- **🌲 Treesitter**: Syntax highlighting and better code comprehension.  
- **📦 LSP Extensions**:  
  - **clangd_extensions** for C++  
  - **nvim-java** for Java  
- **⚙️ Preconfigured LSP**: Built with [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig):  
  - **Basedpyright**, **Ruff** for Python  
  - **Clangd** for C++  
- **📜 Undo History**: Persistent undo with `undodir`.  
- **🚀 Auto Build & Run**: Quickly compile and execute Python, Java, and C++ code.  

---

## 🛠️ Installation  

### Prerequisites  
Make sure the following tools are installed on your system:  
- **Node.js**  
- **LLVM**  
- **Cppcheck**  

### Steps  

1. Clone the repository:  
   ```bash
   cd ~/AppData/Local/
   git clone https://github.com/QuasyStellar/QuasysNvim.git nvim
   ```  

2. Launch Neovim:  
   ```bash
   nvim
   ```  
   Wait for [Lazy.nvim](https://github.com/folke/lazy.nvim) to install all plugins.  

3. Install dependencies:  
   ```bash
   :MasonInstallAll
   ```  

4. Restart Neovim:  
   ```bash
   :qa
   ```  

---

## ✅ TODO  

### 🔧 Improvements  
- [ ] Enhance documentation with examples for keybindings and custom commands.  
- [ ] Add screenshots showcasing the interface.  
- [ ] Optimize LSP configurations for large projects.  
