return {
  {
    type = "pwa-node",
    request = "launch",
    name = "Debug NodeJS application (start:debug)",
    program = "${file}",
    cwd = "${workspaceFolder}",
    runtimeExecutable = "npm",
    runtimeArgs = { "run", "start:debug" },
    sourceMaps = true,
    resolveSourceMapLocations = { "${workspaceFolder}/**", "!**/node_modules/**" },
    outFiles = { "${workspaceFolder}/dist/**/*.js" },
    skipFiles = { "<node_internals>/**", "node_modules/**" },
    console = "integratedTerminal",
  },
  {
    type = "pwa-node",
    request = "attach",
    name = "Attach to process",
    processId = require("dap.utils").pick_process,
    cwd = "${workspaceFolder}",
    sourceMaps = true,
  },
}
