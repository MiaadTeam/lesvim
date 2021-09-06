local U = require("snippets.utils")

return {
	["for"] = U.match_indentation([[
for ${1:i}, ${2:v} in ipairs(${3:t}) do
	$0
end]]),
	-- ["for"] = [[
	-- for ${1:i}, ${2:v} in ipairs(${3:t}) do
	-- ${-1=line_indent()}	$0
	-- ${-1}end]];
	fori = U.match_indentation([[
for ${1:i} = ${2:1}, ${3:#t} do
	$0
end]]),
	forp = U.match_indentation([[
for ${1:k}, ${2:v} in pairs(${3:t}) do
	$0
end]]),
	-- func = [[function${1|test123}(${2|vim.trim})$0 end]];
	func = [[function${1|vim.trim(S.v):gsub("^%S"," %0")}(${2|vim.trim(S.v)})$0 end]],
	req = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require '$1']],
	luv = "local uv = require 'luv'",
	loc = "local $1 = $0",
	exp = "$1 = $1;",
	["local"] = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = ${1}]],
	prelude = U.match_indentation([[
local uv = require 'luv'
local format = string.format
local concat = table.concat
local insert = table.insert
]]),
}
