import * as Sentry from '@sentry/browser';

const {
  SENTRY_DSN, currentUserLoggedIn, currentUserId, currentUserEmail,
} = window;

Sentry.init({ dsn: SENTRY_DSN, environment: 'production' });

Sentry.configureScope((scope) => {
  if (currentUserLoggedIn) {
    scope.setUser({
      id: currentUserId,
      email: currentUserEmail,
    });
  }
});

window.Sentry = Sentry;
