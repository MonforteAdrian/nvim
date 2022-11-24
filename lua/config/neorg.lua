require('neorg').setup{
  load = {
    ["core.defaults"] = {},
    ["core.highlights"] = {
      config = {
        highlights = {
          selection_window = {
              -- The + tells neorg to link to an existing hl
              -- You may also supply any arguments you would to :highlight here
              -- Example: ["heading"] = "gui=underline",
              heading = "+@annotation",
              arrow = "+@none",
              key = "+@namespace",
              keyname = "+@text.math",
              nestedkeyname = "+@string",
          },

          tags = {
              ranged_verbatim = {
                  begin = "+@keyword",

                  ["end"] = "+@keyword",

                  name = {
                      [""] = "+@none",
                      delimiter = "+@none",
                      word = "+@keyword",
                  },

                  parameters = "+@type",

                  document_meta = {
                      key = "+@field",
                      value = "+@string",
                      trailing = "+@repeat",
                      title = "+@text.title",
                      description = "+@label",
                      authors = "+@annotation",
                      categories = "+@keyword",
                      created = "+@float",
                      updated = "+@float",
                      version = "+@float",

                      object = {
                          bracket = "+@punctuation.bracket",
                      },

                      array = {
                          bracket = "+@punctuation.bracket",
                          value = "+@none",
                      },
                  },
              },

              carryover = {
                  begin = "+@label",

                  name = {
                      [""] = "+@none",
                      word = "+@label",
                      delimiter = "+@none",
                  },

                  parameters = "+@string",
              },

              comment = {
                  content = "+@comment",
              },
          },

          headings = {
              ["1"] = {
                  title = "+@attribute",
                  prefix = "+@attribute",
              },
              ["2"] = {
                  title = "+@label",
                  prefix = "+@label",
              },
              ["3"] = {
                  title = "+@text.math",
                  prefix = "+@text.math",
              },
              ["4"] = {
                  title = "+@string",
                  prefix = "+@string",
              },
              ["5"] = {
                  title = "+@label",
                  prefix = "+@label",
              },
              ["6"] = {
                  title = "+@text.math",
                  prefix = "+@text.math",
              },
          },

          error = "+@error",

          markers = {
              prefix = "+@label",
              title = "+@none",
          },

          definitions = {
              prefix = "+@punctuation.delimiter",
              suffix = "+@punctuation.delimiter",
              title = "+@text.strong",
              content = "+@text.emphasis",
          },

          footnotes = {
              prefix = "+@punctuation.delimiter",
              suffix = "+@punctuation.delimiter",
              title = "+@text.strong",
              content = "+@text.emphasis",
          },

          todo_items = {
              undone = {
                  ["1"] = { [""] = "+@punctuation.delimiter", content = "+@none" },
                  ["2"] = { [""] = "+@punctuation.delimiter", content = "+@none" },
                  ["3"] = { [""] = "+@punctuation.delimiter", content = "+@none" },
                  ["4"] = { [""] = "+@punctuation.delimiter", content = "+@none" },
                  ["5"] = { [""] = "+@punctuation.delimiter", content = "+@none" },
                  ["6"] = { [""] = "+@punctuation.delimiter", content = "+@none" },
              },
              pending = {
                  ["1"] = { [""] = "+@namespace", content = "+@none" },
                  ["2"] = { [""] = "+@namespace", content = "+@none" },
                  ["3"] = { [""] = "+@namespace", content = "+@none" },
                  ["4"] = { [""] = "+@namespace", content = "+@none" },
                  ["5"] = { [""] = "+@namespace", content = "+@none" },
                  ["6"] = { [""] = "+@namespace", content = "+@none" },
              },
              done = {
                  ["1"] = { [""] = "+@string", content = "+@none" },
                  ["2"] = { [""] = "+@string", content = "+@none" },
                  ["3"] = { [""] = "+@string", content = "+@none" },
                  ["4"] = { [""] = "+@string", content = "+@none" },
                  ["5"] = { [""] = "+@string", content = "+@none" },
                  ["6"] = { [""] = "+@string", content = "+@none" },
              },
              on_hold = {
                  ["1"] = { [""] = "+@text.note", content = "+@none" },
                  ["2"] = { [""] = "+@text.note", content = "+@none" },
                  ["3"] = { [""] = "+@text.note", content = "+@none" },
                  ["4"] = { [""] = "+@text.note", content = "+@none" },
                  ["5"] = { [""] = "+@text.note", content = "+@none" },
                  ["6"] = { [""] = "+@text.note", content = "+@none" },
              },
              cancelled = {
                  ["1"] = { [""] = "+Whitespace", content = "+@none" },
                  ["2"] = { [""] = "+Whitespace", content = "+@none" },
                  ["3"] = { [""] = "+Whitespace", content = "+@none" },
                  ["4"] = { [""] = "+Whitespace", content = "+@none" },
                  ["5"] = { [""] = "+Whitespace", content = "+@none" },
                  ["6"] = { [""] = "+Whitespace", content = "+@none" },
              },
              urgent = {
                  ["1"] = { [""] = "+@text.danger", content = "+@none" },
                  ["2"] = { [""] = "+@text.danger", content = "+@none" },
                  ["3"] = { [""] = "+@text.danger", content = "+@none" },
                  ["4"] = { [""] = "+@text.danger", content = "+@none" },
                  ["5"] = { [""] = "+@text.danger", content = "+@none" },
                  ["6"] = { [""] = "+@text.danger", content = "+@none" },
              },
              uncertain = {
                  ["1"] = { [""] = "+@boolean", content = "+@none" },
                  ["2"] = { [""] = "+@boolean", content = "+@none" },
                  ["3"] = { [""] = "+@boolean", content = "+@none" },
                  ["4"] = { [""] = "+@boolean", content = "+@none" },
                  ["5"] = { [""] = "+@boolean", content = "+@none" },
                  ["6"] = { [""] = "+@boolean", content = "+@none" },
              },
              recurring = {
                  ["1"] = { [""] = "+@repeat", content = "+@none" },
                  ["2"] = { [""] = "+@repeat", content = "+@none" },
                  ["3"] = { [""] = "+@repeat", content = "+@none" },
                  ["4"] = { [""] = "+@repeat", content = "+@none" },
                  ["5"] = { [""] = "+@repeat", content = "+@none" },
                  ["6"] = { [""] = "+@repeat", content = "+@none" },
              },
          },

          lists = {
              unordered = {
                  ["1"] = {
                      prefix = "+@punctuation.delimiter",
                      content = "+@none",
                  },
                  ["2"] = {
                      prefix = "+@punctuation.delimiter",
                      content = "+@none",
                  },
                  ["3"] = {
                      prefix = "+@punctuation.delimiter",
                      content = "+@none",
                  },
                  ["4"] = {
                      prefix = "+@punctuation.delimiter",
                      content = "+@none",
                  },
                  ["5"] = {
                      prefix = "+@punctuation.delimiter",
                      content = "+@none",
                  },
                  ["6"] = {
                      prefix = "+@punctuation.delimiter",
                      content = "+@none",
                  },
              },

              ordered = {
                  ["1"] = {
                      prefix = "+@repeat",
                      content = "+@none",
                  },
                  ["2"] = {
                      prefix = "+@repeat",
                      content = "+@none",
                  },
                  ["3"] = {
                      prefix = "+@repeat",
                      content = "+@none",
                  },
                  ["4"] = {
                      prefix = "+@repeat",
                      content = "+@none",
                  },
                  ["5"] = {
                      prefix = "+@repeat",
                      content = "+@none",
                  },
                  ["6"] = {
                      prefix = "+@repeat",
                      content = "+@none",
                  },
              },
          },

          quotes = {
              ["1"] = {
                  prefix = "+@punctuation.delimiter",
                  content = "+@punctuation.delimiter",
              },
              ["2"] = {
                  prefix = "+Blue",
                  content = "+Blue",
              },
              ["3"] = {
                  prefix = "+Yellow",
                  content = "+Yellow",
              },
              ["4"] = {
                  prefix = "+Red",
                  content = "+Red",
              },
              ["5"] = {
                  prefix = "+Green",
                  content = "+Green",
              },
              ["6"] = {
                  prefix = "+Brown",
                  content = "+Brown",
              },
          },

          anchors = {
              declaration = {
                  [""] = "+@text.reference",
                  delimiter = "+NonText",
              },
              definition = {
                  delimiter = "+NonText",
              },
          },

          insertions = {
              [""] = "cterm=bold gui=bold",
              prefix = "+@punctuation.delimiter",
              variable = {
                  name = "+@string",
                  value = "+@punctuation.delimiter",
              },
              item = "+@namespace",
              parameters = "+@comment",
          },

          links = {
              description = {
                  [""] = "+@text.uri",
                  delimiter = "+NonText",
              },

              file = {
                  [""] = "+@comment",
                  delimiter = "+NonText",
              },

              location = {
                  delimiter = "+NonText",

                  url = "+@text.uri",

                  generic = {
                      [""] = "+@type",
                      prefix = "+@type",
                  },

                  external_file = {
                      [""] = "+@label",
                      prefix = "+@label",
                  },

                  marker = {
                      [""] = "+@neorg.markers.title",
                      prefix = "+@neorg.markers.prefix",
                  },

                  definition = {
                      [""] = "+@neorg.definitions.title",
                      prefix = "+@neorg.definitions.prefix",
                  },

                  footnote = {
                      [""] = "+@neorg.footnotes.title",
                      prefix = "+@neorg.footnotes.prefix",
                  },

                  heading = {
                      ["1"] = {
                          [""] = "+@neorg.headings.1.title",
                          prefix = "+@neorg.headings.1.prefix",
                      },

                      ["2"] = {
                          [""] = "+@neorg.headings.2.title",
                          prefix = "+@neorg.headings.2.prefix",
                      },

                      ["3"] = {
                          [""] = "+@neorg.headings.3.title",
                          prefix = "+@neorg.headings.3.prefix",
                      },

                      ["4"] = {
                          [""] = "+@neorg.headings.4.title",
                          prefix = "+@neorg.headings.4.prefix",
                      },

                      ["5"] = {
                          [""] = "+@neorg.headings.5.title",
                          prefix = "+@neorg.headings.5.prefix",
                      },

                      ["6"] = {
                          [""] = "+@neorg.headings.6.title",
                          prefix = "+@neorg.headings.6.prefix",
                      },
                  },
              },
          },

          markup = {
              bold = {
                  [""] = "+@text.strong",
                  delimiter = "+NonText",
              },
              italic = {
                  [""] = "+@text.emphasis",
                  delimiter = "+NonText",
              },
              underline = {
                  [""] = "cterm=underline gui=underline",
                  delimiter = "+NonText",
              },
              strikethrough = {
                  [""] = "cterm=strikethrough gui=strikethrough",
                  delimiter = "+NonText",
              },
              spoiler = {
                  [""] = "+@text.danger",
                  delimiter = "+NonText",
              },
              subscript = {
                  [""] = "+@label",
                  delimiter = "+NonText",
              },
              superscript = {
                  [""] = "+@number",
                  delimiter = "+NonText",
              },
              variable = {
                  [""] = "+@neorg.insertions.variable.name",
                  delimiter = "+NonText",
              },
              verbatim = {
                  delimiter = "+NonText",
              },
              inline_comment = {
                  delimiter = "+NonText",
              },
              inline_math = {
                  [""] = "+@text.math",
                  delimiter = "+NonText",
              },
          },

          delimiters = {
              strong = "+@punctuation.delimiter",
              weak = "+@punctuation.delimiter",
              horizontal_line = "+@punctuation.delimiter",
          },

          modifiers = {
              trailing = "+NonText",
              link = "+NonText",
              escape = "+@type",
          },
      },

      -- Where and how to dim TS types
      dim = {
          tags = {
              ranged_verbatim = {
                  code_block = {
                      reference = "Normal",
                      percentage = 15,
                      affect = "background",
                  },
              },
          },

          markup = {
              verbatim = {
                  reference = "Normal",
                  percentage = 20,
              },

              inline_comment = {
                  reference = "Normal",
                  percentage = 40,
              },
          },
      },

      -- This can be one of four values: `false`, `"all"`, `"except_undone"` and `"cancelled"`.
      -- - When set to `false` the content of TODO items will not be coloured in any special way.
      -- - When set to `"all"` the content of TODO items will directly reflect the colour of the item's TODO box.
      -- - When set to `"except_undone"`, will have the same behaviour as `"all"` but will exclude undone TODO items.
      -- - When set to `"cancelled"` will only highlight the content of TODO items for cancelled tasks.
      --
      -- Default value: "cancelled".
      todo_items_match_color = "cancelled",
      },
    },
    ["core.norg.qol.toc"] = {},
    ["core.norg.concealer"] = {},
    ["core.norg.completion"] = {
      config = {
        engine = "nvim-cmp",
      },
    },
    ["core.integrations.nvim-cmp"] = {},
    ["core.integrations.treesitter"] = {},
    ["core.norg.dirman"] = {
      config = {
        workspaces = {
          wiki = "~/wiki", -- Format: <name_of_workspace> = <path_to_workspace_root>
          neorg_test = "~/test",
        },
        autochdir = true, -- Automatically change the directory to the current workspace's root every time
        index = "index.norg", -- The name of the main (root) .norg file
      }
    }
  }
}
