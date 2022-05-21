local ls = require("luasnip")

-- some shorthands...
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local r = ls.restore_node

local types = require("luasnip.util.types")

ls.config.set_config({
	history = true,
	-- Update more often, :h events for more info.
	updateevents = "TextChanged,TextChangedI",
	ext_opts = {
		[types.choiceNode] = {
			active = {
				virt_text = { { "choiceNode", "Comment" } },
			},
		},
	},
	-- treesitter-hl has 100, use something higher (default is 200).
	ext_base_prio = 300,
	-- minimal increase in priority.
	ext_prio_increase = 1,
	enable_autosnippets = true,
})

local function p1(args)
	return args[1]
end

local vfc = s("vfc", {
	t({ "import { VFC } from 'react';", "", "interface " }),
	f(p1, 1),
	t({ "Props {}", "", "" }),
	t("const "),
	i(1),
	t({ ": VFC<" }),
	f(p1, 1),
	t({ "Props> = (" }),
	i(2),
	t({ ") => { ", "\t" }),
	t({ "return " }),
	i(0, "null"),
	t({ ";" }),
	t({ "", "};", "", "export default " }),
	f(p1, 1),
	t({ ";" }),
})

local fc = s("fc", {
	t({ "import { FC } from 'react';", "", "interface " }),
	f(p1, 1),
	t({ "Props {}", "", "" }),
	t("const "),
	i(1),
	t({ ": FC<" }),
	f(p1, 1),
	t({ "Props> = ({" }),
	i(2),
	t({ "children }) => { ", "\t" }),
	t({ "return <>" }),
	i(0),
	t({ "{children}</>;" }),
	t({ "", "};", "", "export default " }),
	f(p1, 1),
	t({ ";" }),
})

local trycatch = s("trycatch", {
	t({ "try {", "" }),
	i(0),
	t({ "", "} catch (error) {", "// TODO handle exception", "}" }),
})

local afn = s("arrow", {
	t("const "),
	-- Placeholder/Insert.
	i(1),
	t({ " = (" }),
	i(2),
	t({ ") => { ", "\t" }),
	-- body
	i(0),
	t({ "", "};" }),
})

local aafn = s("asyncarrow", {
	t("const "),
	-- Placeholder/Insert.
	i(1),
	t({ " = async (" }),
	i(2),
	t({ ") => { ", "\t" }),
	-- body
	i(0),
	t({ "", "};" }),
})

local act = s("act", {
	t({ "await act(async () => {", "\t" }),
	i(0),
	t({ "", "});" }),
})

local actrender = s("actrender", {
	t({ "await act(async () => {", "\trender(" }),
	i(0),
	t({ ");", "});" }),
})

local describe = s("desc", {
	t("describe('"),
	i(1),
	t({ "', () => {", "" }),
	-- body
	i(0),
	t({ "", "})" }),
})

local it = s("it", {
	t("it('"),
	i(1),
	t({ "', async () => {", "" }),
	-- body
	i(0),
	t({ "", "})" }),
})

local before = s("before", {
	t({ "beforeEach(async () => {", "" }),
	-- body
	i(0),
	t({ "", "})" }),
})

local after = s("after", {
	t({ "afterEach(() => {", "" }),
	-- body
	i(0),
	t({ "", "})" }),
})

ls.cleanup()
ls.add_snippets("all", {
	afn,
	aafn,
	act,
	actrender,
	vfc,
	fc,
	trycatch,
	describe,
	before,
	after,
	it,
})
