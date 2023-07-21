local wk = require("which-key")
wk.register({
    c = {
        name = "Code",
        gf = { "<cmd>Neogen func<Cr>", "Func Doc" },
        gc = { "<cmd>Neogen class<Cr>", "Class Doc" },
    },
}, { prefix = "<leader>" })
