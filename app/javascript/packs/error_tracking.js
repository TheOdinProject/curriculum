import * as Sentry from '@sentry/browser';

const {
  SENTRY_DSN, currentUserLoggedIn, currentUserId, currentUserEmail,
} = window;

Sentry.init({
  dsn: SENTRY_DSN,
  environment: 'production',
  allowUrls: [
    /https?:\/\/(www\.)?theodinproject\.com/,
  ],
});

Sentry.configureScope((scope) => {
  if (currentUserLoggedIn) {
    scope.setUser({
      id: currentUserId,
      email: currentUserEmail,
    });
  }
});

window.Sentry = Sentry;
