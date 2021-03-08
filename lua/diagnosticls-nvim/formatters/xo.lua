return {
  command = 'xo',
  args = { '--stdin', '--stdin-filename', '%filepath', '--fix' },
  rootPatterns = {
    '.git',
    '.eslintignore',
  }
}
