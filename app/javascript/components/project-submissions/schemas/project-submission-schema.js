import * as yup from 'yup';

const schema = yup.object().shape({
  repo_url: yup.string()
    .trim()
    .required('Required')
    .matches(/^[http]{4}/, 'Url must start with http or https')
    .url('Must be a valid URL'),
  live_preview_url: yup.string()
    .trim()
    .matches(/^[http]{4}/, { message: 'Url must start with http or https', excludeEmptyString: true })
    .url('Must be a valid URL'),
});

export default schema;
