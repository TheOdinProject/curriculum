const colors = require('tailwindcss/colors')


module.exports = {
  darkMode: 'class', // or 'media' or 'class'
  theme: {
    extend: {
      typography: (theme) => ({
        DEFAULT: {
          css: {
            color: '#334155',
            code: {
              color: theme('colors.pink'),
              backgroundColor: theme('colors.gray.100'),
              padding: '3px',
              'font-weight': 'normal',
              '&:before': {
                display: 'none',
              },
              '&:after': {
                display: 'none',
              },
            },
            h3: {
              width: 'fit-content',
              a: {
                color: '#0f172a',
                'text-decoration': 'none',
              },
            },
            details: {
              summary: {
                'font-size': '1.25rem',
                'margin-bottom': '1.25rem',
                'font-weight': '600',
              },
            }
          },
        },
      }),
      colors: {
        teal:  colors.teal,
        'blue-gray': colors.blueGray,
        transitionProperty: {
          'stroke-dashoffset': 'stroke-dashoffset'
        },
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
        'nav-link-read': 'rgba(74, 74, 74, 0.7)',
        'nav-link-unread': 'rgba(206, 151, 62, 0.7)',
        'notification': 'rgba(74, 74, 74, 0.7)',
        'notification-hover': 'rgba(0, 0, 0, 1)',
        'new-notification': 'rgba(206, 151, 62, 1)',
      },
      height: {
        '60v': '60vh',
      },
      margin: {
        '-25px': '-25px',
      },
      textColor: {
        primary: '#4a4a4a',
      },
      padding: {
        '2px': '2px',
      },
    },
  },
  purge: {
    content: [
      "./app/**/*.html.erb",
      "./app/components/*.html.erb",
      "./app/components/*.rb",
      "./app/javascript/components/**/*.jsx",
      "app/assets/images/icons/*svg",
    ],
    options: {
      safelist: ['lesson-note', 'lesson-content__panel', 'anchor-link', 'toc-item-active'],
    }
  },
  variants: {
    extend: {
      fontWeight: ['hover', 'focus'],
    },
  },
  corePlugins: {
    container: false,
  },
  plugins: [
    require('@tailwindcss/typography'),
  ],
}
