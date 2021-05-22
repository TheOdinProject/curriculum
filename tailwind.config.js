module.exports = {
  purge: [],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  purge: {
    content: ["./app/**/*.html.erb"],
  },
  variants: {
    extend: {},
  },
  corePlugins: {
    container: false,
  },
  plugins: [],
}
