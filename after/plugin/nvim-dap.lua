local dap = require('dap')
dap.adapters.node2 = {
  type = 'executable',
  command = 'node',
  args = {os.getenv('HOME') .. '/dev/microsoft/vscode-node-debug2/out/src/nodeDebug.js'},
}
dap.configurations.javascript = {
  {
    name = 'Launch',
    type = 'node2',
    request = 'launch',
    program = '${file}',
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = 'inspector',
    console = 'integratedTerminal',
  },
  {
    -- For this to work you need to make sure the node process is started with the `--inspect` flag.
    name = 'Attach to process',
    type = 'node2',
    request = 'attach',
    processId = require'dap.utils'.pick_process,
  },
}

dap.configurations.go = {
  {
    type = "go", -- Which adapter to use
    name = "Debug", -- Human readable name
    request = "launch", -- Whether to "launch" or "attach" to program
    program = "${file}", -- The buffer you are focused on when running nvim-dap
  },
}


dap.adapters.go = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.stdpath("data") .. '/mason/bin/dlv',
    args = { "dap", "-l", "127.0.0.1:${port}" },
  },
}


dap.configurations.python = {
  {
    type = "python", -- Which adapter to use
    name = "Debug", -- Human readable name
    request = "launch", -- Whether to "launch" or "attach" to program
    module = "debugpy",
    program = "${file}", -- The buffer you are focused on when running nvim-dap
  },
}


dap.adapters.python = {
  type = 'executable';
  command = '/opt/homebrew/bin/python3';
  args = { '-m', 'debugpy.adapter' };
}
