return {
  sourceName = 'black',
  command = 'black',
  args = { '%filepath' },
  doesWriteToFile = true,
  rootPatterns = {
    '.git',
    'pyproject.toml',
    'setup.py',
  },
}
