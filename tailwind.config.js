module.exports = {
  darkMode: 'class', // or 'media' or 'class'
  theme: {
    extend: {
      colors: {
        'gold': {
          DEFAULT: '#CE973E',
          '50': '#F3E6D0',
          '100': '#EFDDC0',
          '200': '#E7CCA0',
          '300': '#DFBA7F',
          '400': '#D6A95F',
          '500': '#CE973E',
          '600': '#A9792B',
          '700': '#7C5920',
          '800': '#503914',
          '900': '#231909'
        },
        'odin-green': {
          DEFAULT: '#63BFC4',
          '50': '#E8F6F6',
          '100': '#D9F0F1',
          '200': '#BCE3E6',
          '300': '#9ED7DA',
          '400': '#81CBCF',
          '500': '#63BFC4',
          '600': '#42A8AD',
          '700': '#328085',
          '800': '#23595C',
          '900': '#133233',
        },
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
      "./app/components/*.rb",
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
