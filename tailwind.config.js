module.exports = {
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        'nav-link-read': 'rgba(74, 74, 74, 0.7)',
        'nav-link-unread': 'rgba(206, 151, 62, 0.7)',
        'notification': 'rgba(74, 74, 74, 0.7)',
        'notification-hover': 'rgba(0, 0, 0, 1)',
        'new-notification': 'rgba(206, 151, 62, 1)',
      }
    }
  },
  purge: {
    content: [
      "./app/**/*.html.erb",
      "./app/components/*.html.erb",
      "app/assets/images/icons/*svg"
    ],
  },
  variants: {
    extend: {},
  },
  corePlugins: {
    container: false,
  },
  plugins: [],
}
