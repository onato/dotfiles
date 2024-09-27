return {
  "David-Kunz/gen.nvim",
  opts = {
    model = "mistral", -- The default model to use.
    debug = false      -- Prints errors and the command which is run.
  },
  config = function()
    require('gen').prompts['Fix_Code'] = {
      prompt =
      "You are a senior $filetype developer. Provide some tips for improving the following code just output the final text without additional quotes around it\n:$text",
    }
    require('gen').prompts['Explain'] = {
      prompt =
      "You are a senior $filetype developer. Explain the following code just output the final text without additional quotes around it\n:$text",
    }
  end
}
