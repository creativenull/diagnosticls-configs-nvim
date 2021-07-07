return {
  sourceName = 'gofumpt',
  command = 'gofumpt',
  args = { '%filepath' },
  rootPatterns = {
    'go.mod',
    '.git',
  },
}
