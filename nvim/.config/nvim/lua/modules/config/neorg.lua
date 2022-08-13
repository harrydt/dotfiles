return function()
    require('neorg').setup {
        load = {
            ["core.defaults"] = {},
            ["core.norg.dirman"] = {
                config = {
                    workspaces = {
                        main = "~/neorg",
                        gtd = "~/neorg/gtd"
                    }
                }
            },
            ["core.norg.concealer"] = {},
            ["core.norg.qol.toc"] = {},
            ["core.norg.journal"] = {},
            ["core.gtd.base"] = {
                config = {
                    workspace = "gtd",
                },
            },
        },
    }
end
