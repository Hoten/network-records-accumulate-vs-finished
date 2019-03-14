<!--
@license
Copyright 2018 Google Inc. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS-IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->
<!doctype html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1">
  <link rel="icon" href="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAIAAAD8GO2jAAADjklEQVR4AWI08P/HQEvAQrxSQKvlECfLFYXx75xCY2qmh89GbNvOMjb3v9jOOlxnFWxj206ebQ3b7q6q+z1rNagu8/zvPSZACAABpeUAA0miMgU7SA7JjCraFGwZwECOwvL75dWjsKgWBKtx0jvWo+vkBAFbACCkByMP6nMn48+AVgXB2fzSCwsv22/lMGlUhmJ0AE7BH8dyUUDbUEgN6RzJRSeaPxhdRYR0Inel+7Hd5lBiFpkMAxACc0394//9C4voFHDiAAGLpuOXebdfdHfctgwJKaZRLRKy6ItrSis6RBnVBgGtbHyKTEmJHQoEXoBCE5BCrDeA2ogMUIGDAKEBDEhUqwgMqBYDjW4DQzmuffVdqff42/ZQYYqVcMXGZsMPyCsH3lyJSetxvEaxAQXdjR1HjfwCdIS7lo2DZke26Qe+MXO12OWkGT0O6oE7vMGkMnkYw4aN1KQgMKExhXqswfiov4+a7MQ11XPnbr/5qpKlgACAAQj94Lu271bN9DUecQasIZlNzG72llRAAKJiAi+/BSHrSFjRvQhg3DEKEqJh08tsmLTx597+f6enr4cc2Zpk57pihfX24dW7RHcOLLUbJYhJSl0ErQCI9BVXH/XrO97QasuvQQSiECa0BrQCIIJp6X9T/r8QG6L71WYSqCoIIGo2BZDUBnS/D9EA9Nun1iYvbM0MFExIDQRoKFatc1Z6zrm5uWeObJotq0BGV9FuQBWq5a4Fw3PPz848rZHstZSuA5FWAFSMP2nOppOOGpl6qh9PCSg0IFyHKjSQyDNQHTru2t75NOEe0fsf246oAmFkI6vCdnWvbQFQFCKx8vCswV8TrDLiDLgH4Nr7RAtNsrC9d8sfk7b8ls4igdNy8CQKAISlsB0FjZfd3Lfp155tf8fKI4BxZZIj/oTdVEAIAcJFOCmzauHG71I7/rdreUAgAqpDP05fDARCAQQARwEIBQSVxq0FyaLvZZtevpHa8WHw8cft6cpxlq8eAJtIhnSbWDf951yx3y13OqUuu5qyGgkxCgGFh9cDihDGbTa6BqvT1lWmrav3bmt2ZMJ4mU6TGgIC4DBzcv/JqAau1WhzSt3x9Ixk/4Jk/8J4ZrrViFMA4W6A7+WK8xcVjvyrOmVD0FbAXokcT48r+xVqLKvuJYbmpNadnlp3mpufJHOe/GXktM+r09bT8kEdq9BRYAbGSgzP7ll82U71Mc+ZFooXgwAAAABJRU5ErkJggg==">
  <title>Lighthouse Report</title>
  <style>/**
 * @license
 * Copyright 2017 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

.lh-vars {
  --text-font-family: Roboto, Helvetica, Arial, sans-serif;
  --monospace-font-family: 'Menlo', 'dejavu sans mono', 'Consolas', 'Lucida Console', monospace;
  --body-background-color: #fff;
  --body-font-size: 14px;
  --body-line-height: 18px;
  --subheader-font-size: 14px;
  --subheader-line-height: 20px;
  --subheader-color: hsl(206, 6%, 25%);
  --header-bg-color: #f1f3f4;
  --header-font-size: 20px;
  --header-line-height: 24px;
  --title-font-size: 24px;
  --title-line-height: 28px;
  --caption-font-size: 12px;
  --caption-line-height: 16px;
  --default-padding: 12px;
  --section-padding: 16px;
  --section-indent: 16px;
  --audit-group-indent: 16px;
  --audit-item-gap: 5px;
  --audit-indent: 16px;
  --text-indent: 8px;
  --expandable-indent: 20px;
  --secondary-text-color: #565656;
  /*--accent-color: #3879d9;*/
  --fail-color: hsl(1, 73%, 45%);
  --average-color: hsl(31, 100%, 45%); /* md orange 800 */
  --pass-color: hsl(139, 70%, 30%);
  --informative-color: #0c50c7;
  --medium-75-gray: #757575;
  --medium-50-gray: hsl(210, 17%, 98%);
  --medium-100-gray: hsl(200, 12%, 95%);
  --warning-color: #ffab00; /* md amber a700 */
  --report-border-color: #ccc;
  --report-secondary-border-color: #ebebeb;
  --metric-timeline-rule-color: #b3b3b3;
  --display-value-gray: hsl(216, 5%, 39%);
  --report-width: calc(60 * var(--body-font-size));
  --report-min-width: 400px;
  /* Edge doesn't support calc(var(calc())) */
  --report-width-half: calc(30 * var(--body-font-size));
  --report-header-height: 161px;
  --report-header-color: #202124;
  --navitem-font-size: var(--body-font-size);
  --navitem-line-height: var(--body-line-height);
  --navitem-hpadding: var(--body-font-size);
  --navitem-vpadding: calc(var(--navitem-line-height) / 2);
  --lh-score-highlight-bg: hsla(0, 0%, 90%, 0.2);
  --lh-score-icon-background-size: 24px;
  --lh-group-icon-background-size: var(--lh-score-icon-background-size);
  --lh-score-margin: 12px;
  --lh-table-header-bg: #f8f9fa;
  --lh-table-higlight-bg: hsla(0, 0%, 75%, 0.1);
  --lh-sparkline-height: 5px;
  --lh-sparkline-thin-height: 3px;
  --lh-filmstrip-thumbnail-width: 60px;
  --lh-score-icon-width: calc(var(--body-font-size) / 14 * 16);
  --lh-category-score-width: calc(5 * var(--body-font-size));
  --lh-audit-vpadding: 8px;
  --lh-audit-index-width: 18px;
  --lh-audit-hgap: 12px;
  --lh-audit-group-vpadding: 8px;
  --lh-section-vpadding: 12px;
  --chevron-size: 12px;
  --circle-size: calc(3 * var(--header-font-size));

  --pass-icon-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48"><title>check</title><path fill="%23178239" d="M24 4C12.95 4 4 12.95 4 24c0 11.04 8.95 20 20 20 11.04 0 20-8.96 20-20 0-11.05-8.96-20-20-20zm-4 30L10 24l2.83-2.83L20 28.34l15.17-15.17L38 16 20 34z"/></svg>');
  --average-icon-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48"><title>info</title><path fill="%23E67700" d="M24 4C12.95 4 4 12.95 4 24s8.95 20 20 20 20-8.95 20-20S35.05 4 24 4zm2 30h-4V22h4v12zm0-16h-4v-4h4v4z"/></svg>');
  --fail-icon-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48"><title>warn</title><path fill="%23C7221F" d="M2 42h44L24 4 2 42zm24-6h-4v-4h4v4zm0-8h-4v-8h4v8z"/></svg>');

  --content-paste-icon-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"><path fill="%235E6268" d="M19 2h-4.18C14.4.84 13.3 0 12 0c-1.3 0-2.4.84-2.82 2H5c-1.1 0-2 .9-2 2v16c0 1.1.9 2 2 2h14c1.1 0 2-.9 2-2V4c0-1.1-.9-2-2-2zm-7 0c.55 0 1 .45 1 1s-.45 1-1 1-1-.45-1-1 .45-1 1-1zm7 18H5V4h2v3h10V4h2v16z"/><path d="M0 0h24v24H0z" fill="none"/></svg>');
  --av-timer-icon-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="%235E6268"><path d="M0 0h24v24H0z" fill="none"/><path d="M15 1H9v2h6V1zm-4 13h2V8h-2v6zm8.03-6.61l1.42-1.42c-.43-.51-.9-.99-1.41-1.41l-1.42 1.42A8.962 8.962 0 0 0 12 4c-4.97 0-9 4.03-9 9s4.02 9 9 9a8.994 8.994 0 0 0 7.03-14.61zM12 20c-3.87 0-7-3.13-7-7s3.13-7 7-7 7 3.13 7 7-3.13 7-7 7z"/></svg>');
  --photo-filter-icon-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48"><path fill="none" d="M0 0h48v48H0V0z"/><path d="M38.04 20v18H10V10h18V6H10.04c-2.2 0-4 1.8-4 4v28c0 2.2 1.8 4 4 4h28c2.2 0 4-1.8 4-4V20h-4zM34 20l1.88-4.12L40 14l-4.12-1.88L34 8l-1.88 4.12L28 14l4.12 1.88zm-7.5 1.5L24 16l-2.5 5.5L16 24l5.5 2.5L24 32l2.5-5.5L32 24z" fill="%235E6268"/></svg>');
  --visibility-icon-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48"><path d="M0 0h48v48H0z" fill="none"/><path d="M24 9C14 9 5.46 15.22 2 24c3.46 8.78 12 15 22 15 10.01 0 18.54-6.22 22-15-3.46-8.78-11.99-15-22-15zm0 25c-5.52 0-10-4.48-10-10s4.48-10 10-10 10 4.48 10 10-4.48 10-10 10zm0-16c-3.31 0-6 2.69-6 6s2.69 6 6 6 6-2.69 6-6-2.69-6-6-6z" fill="%235E6268"/></svg>');
  --check-circle-icon-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48"><path d="M0 0h48v48H0z" fill="none"/><path d="M24 4C12.95 4 4 12.95 4 24c0 11.04 8.95 20 20 20 11.04 0 20-8.96 20-20 0-11.05-8.96-20-20-20zm-4 30L10 24l2.83-2.83L20 28.34l15.17-15.17L38 16 20 34z" fill="%235E6268"/></svg>');
  --check-icon-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48"><path d="M0 0h48v48H0z" fill="none"/><path d="M18 32.34L9.66 24l-2.83 2.83L18 38l24-24-2.83-2.83z"/></svg>');

  --warning-icon-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 48 48"><title>warn</title><path fill="%235E6268" d="M2 42h44L24 4 2 42zm24-6h-4v-4h4v4zm0-8h-4v-8h4v8z"/></svg>');
  --search-icon-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="48" height="48"><path d="M31 28h-1.59l-.55-.55C30.82 25.18 32 22.23 32 19c0-7.18-5.82-13-13-13S6 11.82 6 19s5.82 13 13 13c3.23 0 6.18-1.18 8.45-3.13l.55.55V31l10 9.98L40.98 38 31 28zm-12 0a9 9 0 1 1 .001-18.001A9 9 0 0 1 19 28z" fill="%235E6268"/><path d="M0 0h48v48H0z" fill="none" /></svg>');
  --remove-circle-icon-url: url('data:image/svg+xml;utf8,<svg height="24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M0 0h24v24H0z" fill="none"/><path d="M7 11v2h10v-2H7zm5-9C6.48 2 2 6.48 2 12s4.48 10 10 10 10-4.48 10-10S17.52 2 12 2zm0 18c-4.41 0-8-3.59-8-8s3.59-8 8-8 8 3.59 8 8-3.59 8-8 8z" fill="%235E6268"/></svg>');

  --pwa-fast-reliable-gray-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><g fill="none" fill-rule="nonzero"><circle fill="%23DAE0E3" cx="12" cy="12" r="12"/><path d="M12.3 4l6.3 2.8V11c0 3.88-2.69 7.52-6.3 8.4C8.69 18.52 6 14.89 6 11V6.8L12.3 4zm-.56 12.88l3.3-5.79.04-.08c.05-.1.01-.29-.26-.29h-1.96l.56-3.92h-.56L9.6 12.52c0 .03.07-.12-.03.07-.11.2-.12.37.2.37h1.97l-.56 3.92h.56z" fill="%23FFF"/></g></svg>');
  --pwa-installable-gray-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><g fill="none" fill-rule="nonzero"><circle fill="%23DAE0E3" cx="12" cy="12" r="12"/><path d="M12 5a7 7 0 1 0 0 14 7 7 0 0 0 0-14zm3.5 7.7h-2.8v2.8h-1.4v-2.8H8.5v-1.4h2.8V8.5h1.4v2.8h2.8v1.4z" fill="%23FFF"/></g></svg>');
  --pwa-optimized-gray-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><g fill="none" fill-rule="evenodd"><rect fill="%23DAE0E3" width="24" height="24" rx="12"/><path fill="%23FFF" d="M12 15.07l3.6 2.18-.95-4.1 3.18-2.76-4.2-.36L12 6.17l-1.64 3.86-4.2.36 3.2 2.76-.96 4.1z"/><path d="M5 5h14v14H5z"/></g></svg>');

  --pwa-fast-reliable-color-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><g fill-rule="nonzero" fill="none"><circle fill="%23CCE3F6" cx="12" cy="12" r="12"/><path d="M12 4.3l6.3 2.8v4.2c0 3.88-2.69 7.52-6.3 8.4-3.61-.88-6.3-4.51-6.3-8.4V7.1L12 4.3zm-.56 12.88l3.3-5.79.04-.08c.05-.1.01-.29-.26-.29h-1.96l.56-3.92h-.56L9.3 12.82c0 .03.07-.12-.03.07-.11.2-.12.37.2.37h1.97l-.56 3.92h.56z" fill="%23304FFE"/></g></svg>');
  --pwa-installable-color-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><g fill-rule="nonzero" fill="none"><circle fill="%23D4ECD5" cx="12" cy="12" r="12"/><path d="M12 5a7 7 0 1 0 0 14 7 7 0 0 0 0-14zm3.5 7.7h-2.8v2.8h-1.4v-2.8H8.5v-1.4h2.8V8.5h1.4v2.8h2.8v1.4z" fill="%23009688"/></g></svg>');
  --pwa-optimized-color-url: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg"><g fill="none" fill-rule="evenodd"><rect fill="%23FCE4EC" width="24" height="24" rx="12"/><path d="M5 5h14v14H5z"/><path fill="%23EC3F7A" d="M12 15.07l3.6 2.18-.95-4.1 3.18-2.76-4.2-.36L12 6.17l-1.64 3.86-4.2.36 3.2 2.76-.96 4.1z"/></g></svg>');
}

.lh-vars.lh-devtools {
  --text-font-family: '.SFNSDisplay-Regular', 'Helvetica Neue', 'Lucida Grande', sans-serif;
  --monospace-font-family: 'Menlo', 'dejavu sans mono', 'Consolas', 'Lucida Console', monospace;
  --body-font-size: 12px;
  --body-line-height: 16px;
  --subheader-font-size: 14px;
  --subheader-line-height: 18px;
  --header-font-size: 16px;
  --header-line-height: 20px;
  --title-font-size: 20px;
  --title-line-height: 24px;
  --caption-font-size: 11px;
  --caption-line-height: 14px;
  --default-padding: 12px;
  --section-padding: 12px;
  --section-indent: 8px;
  --audit-group-indent: 16px;
  --audit-indent: 16px;
  --expandable-indent: 16px;

  --lh-audit-vpadding: 4px;
  --lh-audit-hgap: 12px;
  --lh-audit-group-vpadding: 12px;
  --lh-section-vpadding: 8px;
}

@keyframes fadeIn {
  0% { opacity: 0;}
  100% { opacity: 0.6;}
}

.lh-root * {
  box-sizing: border-box;
}

.lh-root {
  font-family: var(--text-font-family);
  font-size: var(--body-font-size);
  margin: 0;
  line-height: var(--body-line-height);
  background: var(--body-background-color);
  scroll-behavior: smooth;
}

.lh-root :focus {
    outline: -webkit-focus-ring-color auto 3px;
}
.lh-root summary:focus {
    outline: none;
    box-shadow: 0 0 0 1px hsl(217, 89%, 61%);
}

.lh-root [hidden] {
  display: none !important;
}

.lh-root details > summary {
  cursor: pointer;
}

.lh-audit-group a,
.lh-category-header__description a {
  color: #0c50c7;
}

.lh-audit__description {
  --inner-audit-left-padding: calc(var(--text-indent) + var(--lh-audit-index-width) + 2 * var(--audit-item-gap));
  --inner-audit-right-padding: calc(var(--text-indent) + 2px);
  padding-left: var(--inner-audit-left-padding);
  padding-right: var(--inner-audit-right-padding);
  padding-top: 8px;
  padding-bottom: 8px;
}

.lh-details {
  font-size: var(--body-font-size);
  margin-top: var(--default-padding);
  margin-bottom: var(--default-padding);
  /* whatever the .lh-details side margins are */
  width: 100%;
}

.lh-details.flex .lh-code {
  max-width: 70%;
}

/* Report header */

.report-icon {
  opacity: 0.7;
}
.report-icon:hover {
  opacity: 1;
}
.report-icon[disabled] {
  opacity: 0.3;
  pointer-events: none;
}

.report-icon--share {
  background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path fill="none" d="M0 0h24v24H0z"/><path d="M18 16.08c-.76 0-1.44.3-1.96.77L8.91 12.7c.05-.23.09-.46.09-.7s-.04-.47-.09-.7l7.05-4.11c.54.5 1.25.81 2.04.81 1.66 0 3-1.34 3-3s-1.34-3-3-3-3 1.34-3 3c0 .24.04.47.09.7L8.04 9.81C7.5 9.31 6.79 9 6 9c-1.66 0-3 1.34-3 3s1.34 3 3 3c.79 0 1.5-.31 2.04-.81l7.12 4.16c-.05.21-.08.43-.08.65 0 1.61 1.31 2.92 2.92 2.92 1.61 0 2.92-1.31 2.92-2.92s-1.31-2.92-2.92-2.92z"/></svg>');
}
.report-icon--print {
  background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"><path d="M19 8H5c-1.66 0-3 1.34-3 3v6h4v4h12v-4h4v-6c0-1.66-1.34-3-3-3zm-3 11H8v-5h8v5zm3-7c-.55 0-1-.45-1-1s.45-1 1-1 1 .45 1 1-.45 1-1 1zm-1-9H6v4h12V3z"/><path fill="none" d="M0 0h24v24H0z"/></svg>');
}
.report-icon--copy {
  background-image: url('data:image/svg+xml;utf8,<svg height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M0 0h24v24H0z" fill="none"/><path d="M16 1H4c-1.1 0-2 .9-2 2v14h2V3h12V1zm3 4H8c-1.1 0-2 .9-2 2v14c0 1.1.9 2 2 2h11c1.1 0 2-.9 2-2V7c0-1.1-.9-2-2-2zm0 16H8V7h11v14z"/></svg>');
}
.report-icon--open {
  background-image: url('data:image/svg+xml;utf8,<svg height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M0 0h24v24H0z" fill="none"/><path d="M19 4H5c-1.11 0-2 .9-2 2v12c0 1.1.89 2 2 2h4v-2H5V8h14v10h-4v2h4c1.1 0 2-.9 2-2V6c0-1.1-.89-2-2-2zm-7 6l-4 4h3v6h2v-6h3l-4-4z"/></svg>');
}
.report-icon--download {
  background-image: url('data:image/svg+xml;utf8,<svg height="24" viewBox="0 0 24 24" width="24" xmlns="http://www.w3.org/2000/svg"><path d="M19 9h-4V3H9v6H5l7 7 7-7zM5 18v2h14v-2H5z"/><path d="M0 0h24v24H0z" fill="none"/></svg>');
}

/* Node */
.lh-node {
  display: block;
  font-family: var(--monospace-font-family);
  word-break: break-word;
  color: hsl(174, 100%, 27%);
}
.lh-node:hover {
    background: hsl(0, 0%, 98%);
    border-radius: 2px;
}

/* Score */

.lh-audit__score-icon {
  margin-left: var(--lh-score-margin);
  width: var(--lh-score-icon-width);
  height: var(--lh-score-icon-width);
  background: none no-repeat center center / contain;
}

.lh-audit--pass .lh-audit__display-text {
  color: var(--pass-color);
}
.lh-audit--pass .lh-audit__score-icon {
  background-image: var(--pass-icon-url);
}

.lh-audit--average .lh-audit__display-text {
  color: var(--average-color);
}
.lh-audit--average .lh-audit__score-icon {
  background-image: var(--average-icon-url);
}

.lh-audit--fail .lh-audit__display-text {
  color: var(--fail-color);
}
.lh-audit--fail .lh-audit__score-icon {
  background-image: var(--fail-icon-url);
}

.lh-audit--informative .lh-audit__display-text {
  color: var(--display-value-gray);
}

.lh-audit--informative .lh-audit__score-icon,
.lh-audit--manual .lh-audit__score-icon {
  visibility: hidden;
}
.lh-audit--error .lh-audit__score-icon {
  display: none;
}

.lh-category-header__description,
.lh-audit__description   {
  color: var(--secondary-text-color);
}

.lh-category-header__description  {
  font-size: var(--body-font-size);
  margin: calc(var(--default-padding) / 2) 0 var(--default-padding);
}


.lh-audit__index,
.lh-audit__title,
.lh-audit__display-text,
.lh-audit__score-icon,
.lh-load-opportunity__sparkline,
.lh-chevron-container {
  margin: 0 var(--audit-item-gap);
}
.lh-audit__index {
  margin-left: 0;
}
.lh-chevron-container {
  margin-right: 0;
}


.lh-audit__header .lh-audit__index {
  width: var(--lh-audit-index-width);
}

.lh-audit__title {
  flex: 1;
}

/* Expandable Details (Audit Groups, Audits) */
.lh-audit__header {
  display: flex;
  padding: var(--lh-audit-vpadding) var(--text-indent);
}

.lh-audit--load-opportunity .lh-audit__header {
  display: block;
}

.lh-audit__header:hover {
  background-color: #F8F9FA;
}

/* Hide the expandable arrow icon, three ways: via the CSS Counter Styles spec, for webkit/blink browsers, hiding the polyfilled icon */
/* https://github.com/javan/details-element-polyfill/blob/master/src/details-element-polyfill/polyfill.sass */
.lh-audit-group > summary,
.lh-expandable-details > summary {
  list-style-type: none;
}
.lh-audit-group > summary::-webkit-details-marker,
.lh-expandable-details > summary::-webkit-details-marker {
  display: none;
}
.lh-audit-group > summary:before,
.lh-expandable-details > summary:before {
  display: none;
}


/* Perf Metric */

.lh-columns {
  display: flex;
  width: 100%;
}
@media screen and (max-width: 640px) {
  .lh-columns {
    flex-wrap: wrap;

  }
}

.lh-column {
  flex: 1;
}
.lh-column:first-of-type {
  margin-right: 24px;
}

@media screen and (max-width: 800px) {
  .lh-column:first-of-type {
    margin-right: 8px;
  }
}
@media screen and (max-width: 640px) {
  .lh-column {
    flex-basis: 100%;
  }
  .lh-column:first-of-type {
    margin-right: 0px;
  }
}


.lh-metric {
  border-bottom: 1px solid var(--report-secondary-border-color);
}

.lh-metric__innerwrap {
  display: flex;
  justify-content: space-between;
  padding: 8px var(--text-indent);
}

.lh-metric__details {
  order: -1;
}

.lh-metric__title {
  font-size: var(--body-font-size);
  line-height: var(--body-line-height);
  display: flex;
  white-space: nowrap;
}

.lh-metric__name {
  flex: 1;
}

.lh-metrics__disclaimer {
  color: var(--medium-75-gray);
  text-align: right;
  margin: var(--lh-section-vpadding) 0;
  padding: 0 var(--text-indent);
}

.lh-metric__description {
  color: var(--secondary-text-color);
}

.lh-metric__value {
  white-space: nowrap; /* No wrapping between metric value and the icon */
}


.lh-metric .lh-metric__value::after {
  content: '';
  width: var(--lh-score-icon-width);
  height: var(--lh-score-icon-width);
  background-size: contain;
  display: inline-block;
  vertical-align: text-bottom;
  margin-left: calc(var(--body-font-size) / 2);
}

.lh-metric--pass .lh-metric__value {
  color: var(--pass-color);
}
.lh-metric--pass .lh-metric__value::after {
  background: var(--pass-icon-url) no-repeat 50% 50%;
}


.lh-metric--average .lh-metric__value {
  color: var(--average-color);
  padding-left: 16px;
}
.lh-metric--average .lh-metric__value::after {
  background: var(--average-icon-url) no-repeat 50% 50%;
}


.lh-metric--fail .lh-metric__value {
  color: var(--fail-color);
}
.lh-metric--fail .lh-metric__value::after {
  background: var(--fail-icon-url) no-repeat 50% 50%;
}

.lh-metric--error .lh-metric__value,
.lh-metric--error .lh-metric__description {
  color: var(--fail-color);
}

/* Hide icon if there was an error */
.lh-metric--error .lh-metric__value::after {
  display: none;
}

/* Perf load opportunity */

.lh-load-opportunity__cols {
  display: flex;
  align-items: flex-start;
}

.lh-load-opportunity__header .lh-load-opportunity__col {
  background-color: var(--medium-50-gray);
  color: var(--medium-75-gray);
  text-align: center;
  display: unset;
  line-height: calc(2.3 * var(--body-font-size));
}

.lh-load-opportunity__col {
  display: flex;
  justify-content: space-between;
}

.lh-load-opportunity__col--one {
  flex: 5;
  margin-right: 2px;
}
.lh-load-opportunity__col--two {
  flex: 4;
}

.lh-audit--load-opportunity .lh-audit__display-text {
  text-align: right;
  flex: 0 0 calc(3 * var(--body-font-size));
}


/* Sparkline */

.lh-load-opportunity__sparkline {
  flex: 1;
  margin-top: calc((var(--body-line-height) - var(--lh-sparkline-height)) / 2);
}

.lh-sparkline {
  height: var(--lh-sparkline-height);
  width: 100%;
}

.lh-sparkline__bar {
  height: 100%;
  float: right;
}

.lh-audit--pass .lh-sparkline__bar {
  background: var(--pass-color);
}

.lh-audit--average .lh-sparkline__bar {
  background: var(--average-color);
}

.lh-audit--fail .lh-sparkline__bar {
  background: var(--fail-color);
}



/* Filmstrip */

.lh-filmstrip-container {
  padding: 0 var(--expandable-indent);
  /* smaller gap between metrics and filmstrip */
  margin: -8px auto 0 auto;
}

.lh-filmstrip {
  display: flex;
  flex-direction: row;
  justify-content: space-between;
  padding-bottom: var(--default-padding);
}

.lh-filmstrip__frame {
  text-align: right;
  position: relative;
}

.lh-filmstrip__thumbnail {
  border: 1px solid var(--report-secondary-border-color);
  max-height: 100px;
  max-width: 60px;
}

@media screen and (max-width: 750px) {
  .lh-filmstrip {
    flex-wrap: wrap;
    justify-content: left;
  }
  .lh-filmstrip__frame {
    margin: calc(var(--default-padding) / 3);
  }
}

/* Audit */

.lh-audit {
  border-bottom: 1px solid var(--report-secondary-border-color);
}

.lh-audit--error .lh-audit__display-text {
  color: var(--fail-color);
}

/* Audit Group */

.lh-audit-group {
  margin: var(--lh-audit-group-vpadding) 0;
}

.lh-audit-group__header {
  font-size: var(--subheader-font-size);
  line-height: var(--subheader-line-height);
  color: var(--subheader-color);
  flex: 1;
  font-weight: bold;
}

.lh-audit-group__header::before {
  /* By default, groups don't get an icon */
  content: none;
  width: calc(var(--subheader-font-size) / 14 * 24);
  height: calc(var(--subheader-font-size) / 14 * 24);
  margin-right: calc(var(--subheader-font-size) / 2);
  background: var(--medium-100-gray) none no-repeat center / 16px;
  display: inline-block;
  border-radius: 50%;
  vertical-align: middle;
}

.lh-clump--warning > summary .lh-audit-group__header::before {
  content: '';
  background-image: var(--warning-icon-url);
}
.lh-clump--manual > summary .lh-audit-group__header::before {
  content: '';
  background-image: var(--search-icon-url);
}
.lh-clump--passed > summary .lh-audit-group__header::before {
  content: '';
  background-image: var(--check-icon-url);
}
.lh-clump--notapplicable > summary .lh-audit-group__header::before {
  content: '';
  background-image: var(--remove-circle-icon-url);
}

.lh-audit-group--diagnostics .lh-audit-group__header::before {
  content: '';
  background-image: var(--content-paste-icon-url);
}
.lh-audit-group--load-opportunities .lh-audit-group__header::before {
  content: '';
  background-image: var(--photo-filter-icon-url);
}
.lh-audit-group--metrics .lh-audit-group__header::before {
  content: '';
  background-image: var(--av-timer-icon-url);
}

.lh-audit-group--pwa-fast-reliable .lh-audit-group__header::before {
  content: '';
  background-image: var(--pwa-fast-reliable-gray-url);
  background-size: var(--lh-group-icon-background-size);
}
.lh-audit-group--pwa-installable .lh-audit-group__header::before {
  content: '';
  background-image: var(--pwa-installable-gray-url);
  background-size: var(--lh-group-icon-background-size);
}
.lh-audit-group--pwa-optimized .lh-audit-group__header::before {
  content: '';
  background-image: var(--pwa-optimized-gray-url);
  background-size: var(--lh-group-icon-background-size);
}
.lh-audit-group--pwa-fast-reliable.lh-badged .lh-audit-group__header::before {
  background-image: var(--pwa-fast-reliable-color-url);
}
.lh-audit-group--pwa-installable.lh-badged .lh-audit-group__header::before {
  background-image: var(--pwa-installable-color-url);
}
.lh-audit-group--pwa-optimized.lh-badged .lh-audit-group__header::before {
  background-image: var(--pwa-optimized-color-url);
}

/* Removing too much whitespace */
.lh-audit-group--metrics {
  margin-top: calc(var(--circle-size)/2 * -1);
  border-bottom: none;
}
.lh-audit-group--metrics .lh-audit-group__summary {
  margin-top: 0;
  margin-bottom: 0;
}

.lh-audit-group__summary {
  display: flex;
  justify-content: space-between;
  padding-right: var(--text-indent);
  margin-top: calc(var(--section-padding) * 1.5);
  margin-bottom: var(--section-padding);
}

.lh-audit-group__itemcount {
  color: var(--display-value-gray);
  margin: 3px 10px 0;
}
.lh-audit-group__summary .lh-chevron {
  margin-top: calc((var(--body-line-height) - 5px) / 2);
}

.lh-audit-group__description {
  font-size: var(--body-font-size);
  color: var(--medium-75-gray);
  margin: 0 0 var(--lh-audit-group-vpadding);
}

.lh-clump > .lh-audit-group__description,
.lh-audit-group--diagnostics .lh-audit-group__description,
.lh-audit-group--load-opportunities .lh-audit-group__description,
.lh-audit-group--metrics .lh-audit-group__description,
.lh-audit-group--pwa-fast-reliable .lh-audit-group__description,
.lh-audit-group--pwa-installable .lh-audit-group__description,
.lh-audit-group--pwa-optimized .lh-audit-group__description {
  margin-top: var(--lh-audit-group-vpadding);
}

.lh-audit-explanation {
  margin: var(--lh-audit-vpadding) 0 calc(var(--lh-audit-vpadding) / 2);
  line-height: var(--caption-line-height);
}

.lh-audit--fail .lh-audit-explanation {
  color: var(--fail-color);
}

/* Report */

.lh-container {
  display: flex;
  max-width: var(--report-width);
  word-wrap: break-word;
  margin: 0 auto;
}

.lh-header-sticky {
  position: -webkit-sticky;
  position: sticky;
  top: 0;
  width: 100%;
  min-width: var(--report-min-width);
  z-index: 2;
  will-change: transform;
}
.lh-header-plain {
  margin-top: var(--section-padding);
}

.lh-list > div:not(:last-child) {
  padding-bottom: 20px;
}

.lh-header-container {
  display: block;
  margin: 0 auto;
  max-width: var(--report-width);
  position: relative;
  word-wrap: break-word;
}

.lh-report {
  background-color: #fff;
  min-width: var(--report-min-width);
}
@media screen {
  .lh-report {
    width: var(--report-width);
  }
}

.lh-exception {
  font-size: large;
}

.lh-code {
  white-space: normal;
  margin-top: 0;
  font-size: 85%;
  word-break: break-word;
}

.lh-warnings {
  --item-margin: calc(var(--body-line-height) / 6);
  border: 1px solid var(--average-color);
  border-radius: 4px;
  margin: var(--lh-audit-vpadding) 0;
  padding: calc(var(--lh-audit-vpadding) / 2) var(--lh-audit-vpadding);
}

.lh-warnings--toplevel {
  --item-margin: calc(var(--header-line-height) / 4);
  color: var(--secondary-text-color);
  margin: var(--section-padding);
  padding: var(--section-padding);
}
.lh-warnings ul {
  padding-left: calc(var(--section-padding) * 2);
  margin: 0;
}
.lh-warnings li {
  margin: var(--item-margin) 0;
}
.lh-warnings li:last-of-type {
  margin-bottom: 0;
}

.lh-scores-header {
  display: flex;
  justify-content: left;
  overflow-x: hidden;
  position: relative;
  padding: var(--section-indent) calc(var(--section-indent) / 2) calc(var(--section-indent) * 2);
}
.lh-scores-header__solo {
  padding: 0;
  border: 0;
}

.lh-scores-header .lh-gauge__wrapper,
.lh-scores-header .lh-gauge--pwa__wrapper {
  padding: 0 4px;
}

.lh-scores-header .lh-gauge--pwa__wrapper {
  border-left: 1px solid var(--report-secondary-border-color)
}

.lh-scorescale {
  color: var(--medium-75-gray);
  padding: 0 calc(var(--section-indent) * 1.5) 0;
  text-align: right;
  transform-origin: bottom right;
  will-change: opacity; /* opacity is changed on scroll */
}

.lh-scorescale-range {
  margin-left: 10px;
  white-space: nowrap;
}

.lh-scorescale-range::before {
  content: '';
  width: var(--body-font-size);
  height: calc(var(--body-font-size) * .60);
  border-radius: 4px;
  display: inline-block;
  margin: 0 5px;
}

.lh-scorescale-range--pass::before {
  background-color: var(--pass-color);
}

.lh-scorescale-range--average::before {
  background-color: var(--average-color);
}

.lh-scorescale-range--fail::before {
  background-color: var(--fail-color);
}

/* Hide category score gauages if it's a single category report */
.lh-header--solo-category .lh-scores-wrapper {
  display: none;
}


.lh-categories {
  width: 100%;
  overflow: hidden;
}

.lh-category {
  padding: var(--section-padding);
}

.lh-category:first-of-type {
  padding-top: calc(2 * var(--section-padding));
  border: none;
}

/* section hash link jump should preserve fixed header
   https://css-tricks.com/hash-tag-links-padding/
*/
.lh-category > .lh-permalink {
  margin-top: calc((var(--report-header-height) + var(--default-padding)) * -1);
  padding-bottom: calc(var(--report-header-height) + var(--default-padding));
  display: block;
  visibility: hidden;
}

.lh-category-header {
  font-size: var(--header-font-size);
  min-height: var(--circle-size);
  margin-bottom: var(--lh-section-vpadding);
}

.lh-category-header__title {
  line-height: 24px;
}

.lh-category-header .lh-score__gauge .lh-gauge__label {
  display: none;
}


.lh-category-header .lh-score__gauge {
  float: right;
}

.lh-category-header .lh-score__gauge {
  margin-left: var(--section-indent);
}

.lh-category-header .lh-audit__title {
  font-size: var(--header-font-size);
  line-height: var(--header-line-height);
}

#lh-log {
  position: fixed;
  background-color: #323232;
  color: #fff;
  min-height: 48px;
  min-width: 288px;
  padding: 16px 24px;
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.26);
  border-radius: 2px;
  margin: 12px;
  font-size: 14px;
  cursor: default;
  transition: transform 0.3s, opacity 0.3s;
  transform: translateY(100px);
  opacity: 0;
  -webkit-font-smoothing: antialiased;
  bottom: 0;
  left: 0;
  z-index: 3;
}

#lh-log.show {
  opacity: 1;
  transform: translateY(0);
}

/* 964 fits the min-width of the filmstrip */
@media screen and (max-width: 964px) {
  .lh-report {
    margin-left: 0;
    width: 100%;
  }
}

@media print {
  body {
    -webkit-print-color-adjust: exact; /* print background colors */
  }
  .lh-container {
    display: block;
  }
  .lh-report {
    margin-left: 0;
    padding-top: 0;
  }
  .lh-categories {
    margin-top: 0;
  }
}

.lh-table {
  --image-preview-size: 24px;
  border-collapse: collapse;
}

.lh-table thead {
  background: var(--lh-table-header-bg);
}
.lh-table thead th {
  color: var(--medium-75-gray);
  font-weight: normal;
  word-wrap: normal;
}

.lh-table tbody tr:nth-child(even) {
  background-color: var(--lh-table-higlight-bg);
}

.lh-table th,
.lh-table td {
  padding: 8px 6px;
}

/* Looks unnecessary, but mostly for keeping the <th>s left-aligned */
.lh-table-column--text,
.lh-table-column--url,
/* .lh-table-column--thumbnail, */
/* .lh-table-column--empty,*/
.lh-table-column--code,
.lh-table-column--node {
  text-align: left;
}

.lh-table-column--bytes,
.lh-table-column--timespanMs,
.lh-table-column--ms,
.lh-table-column--numeric {
  text-align: right;
}


.lh-table-column--thumbnail {
  width: calc(var(--image-preview-size) * 2);
}

.lh-table-column--url {
  min-width: 250px;
  white-space: nowrap;
}

/* Keep columns narrow if they follow the URL column */
/* 12% was determined to be a decent narrow width, but wide enough for column headings */
.lh-table-column--url + th.lh-table-column--bytes,
.lh-table-column--url + .lh-table-column--bytes + th.lh-table-column--bytes,
.lh-table-column--url + .lh-table-column--ms,
.lh-table-column--url + .lh-table-column--ms + th.lh-table-column--bytes,
.lh-table-column--url + .lh-table-column--bytes + th.lh-table-column--timespanMs {
  width: 12%;
}

.lh-text__url {
  overflow: hidden;
  text-overflow: ellipsis;
}

.lh-text__url:hover {
  text-decoration: underline dotted #999;
  text-decoration-skip-ink: auto;
}

.lh-text__url > .lh-text, .lh-text__url-host {
  display: inline-block;
}

.lh-text__url-host {
  margin-left: calc(var(--body-font-size) / 2);
  opacity: 0.6;
  font-size: 90%
}

.lh-thumbnail {
  height: var(--image-preview-size);
  width: var(--image-preview-size);
  object-fit: contain;
}

/* Chevron
   https://codepen.io/paulirish/pen/LmzEmK
 */
.lh-chevron {
  --chevron-angle: 42deg;
  /* Edge doesn't support transform: rotate(calc(...)), so we define it here */
  --chevron-angle-right: -42deg;
  width: var(--chevron-size);
  height: var(--chevron-size);
  margin-top: calc((var(--body-line-height) - 12px) / 2);
}

.lh-chevron__lines {
  transition: transform 0.4s;
  transform: translateY(var(--body-line-height));
}
.lh-chevron__line {
 stroke: var(--display-value-gray);
 stroke-width: var(--chevron-size);
 stroke-linecap: square;
 transform-origin: 50%;
 transform: rotate(var(--chevron-angle));
 transition: transform 300ms, stroke 300ms;
}

.lh-audit-group > summary > .lh-audit-group__summary > .lh-chevron .lh-chevron__line-right,
.lh-audit-group[open] > summary > .lh-audit-group__summary > .lh-chevron .lh-chevron__line-left,
.lh-audit > .lh-expandable-details .lh-chevron__line-right,
.lh-audit > .lh-expandable-details[open] .lh-chevron__line-left {
 transform: rotate(var(--chevron-angle-right));
}

.lh-audit-group[open] > summary > .lh-audit-group__summary > .lh-chevron .lh-chevron__line-right,
.lh-audit > .lh-expandable-details[open] .lh-chevron__line-right {
  transform: rotate(var(--chevron-angle));
}

.lh-audit-group[open] > summary > .lh-audit-group__summary > .lh-chevron .lh-chevron__lines,
.lh-audit > .lh-expandable-details[open] .lh-chevron__lines {
 transform: translateY(calc(var(--chevron-size) * -1));
}



/* Tooltip */
.tooltip-boundary {
  position: relative;
}

.tooltip {
  position: absolute;
  display: none; /* Don't retain these layers when not needed */
  opacity: 0;
  background: #ffffff;
  min-width: 246px;
  max-width: 275px;
  padding: 15px;
  border-radius: 5px;
  text-align: initial;
}
/* shrink tooltips to not be cutoff on left edge of narrow viewports
   45vw is chosen to be ~= width of the left column of metrics
*/
@media screen and (max-width: 535px) {
  .tooltip {
    min-width: 45vw;
    padding: 3vw;
  }
}

.tooltip-boundary:hover {
  background-color: #F8F9FA;
}

.tooltip-boundary:hover .tooltip {
  display: block;
  animation: fadeInTooltip 250ms;
  animation-fill-mode: forwards;
  animation-delay: 850ms;
  bottom: 100%;
  z-index: 1;
  will-change: opacity;
  right: 0;
  pointer-events: none;
}

.tooltip::before {
  content: "";
  border: solid transparent;
  border-bottom-color: #fff;
  border-width: 10px;
  position: absolute;
  bottom: -20px;
  right: 6px;
  transform: rotate(180deg);
  pointer-events: none;
}

@keyframes fadeInTooltip {
  0% { opacity: 0; }
  75% { opacity: 1; }
  100% { opacity: 1;  filter: drop-shadow(1px 0px 1px #aaa) drop-shadow(0px 2px 4px hsla(206, 6%, 25%, 0.15)); pointer-events: auto; }
}
</style>
</head>
<body class="lh-root lh-vars">
  <noscript>Lighthouse report requires JavaScript. Please enable.</noscript>
  <div hidden><!--
@license
Copyright 2018 Google Inc. All Rights Reserved.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS-IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
-->

<!-- Lighthouse run warnings -->
<template id="tmpl-lh-warnings--toplevel">
  <div class="lh-warnings lh-warnings--toplevel">
    <strong class="lh-warnings__msg"></strong>
    <ul></ul>
  </div>
</template>

<!-- Lighthouse score scale -->
<template id="tmpl-lh-scorescale">
  <div class="lh-scorescale">
    <span class="lh-scorescale-label"></span>
    <span class="lh-scorescale-range lh-scorescale-range--pass">90-100</span>
    <span class="lh-scorescale-range lh-scorescale-range--average">50-89</span>
    <span class="lh-scorescale-range lh-scorescale-range--fail">0-49</span>
  </div>
</template>

<!-- Toggle arrow chevron -->
<template id="tmpl-lh-chevron">
  <svg class="lh-chevron" title="See audits" xmlns="http://www.w3.org/2000/svg"  viewbox="0 0 100 100">
    <g class="lh-chevron__lines">
      <path class="lh-chevron__line lh-chevron__line-left" d="M10 50h40" stroke="#707173"></path>
      <path class="lh-chevron__line lh-chevron__line-right" d="M90 50H50" stroke="#707173"></path>
    </g>
  </svg>
</template>

<!-- Lighthouse category header -->
<template id="tmpl-lh-category-header">
  <div class="lh-category-header">
    <div class="lh-score__gauge"></div>
    <span class="lh-category-header__title"></span>
    <div class="lh-category-header__description"></div>
  </div>
</template>

<!-- Lighthouse clump -->
<template id="tmpl-lh-clump">
  <!-- TODO: group classes shouldn't be reused for clumps. -->
  <details class="lh-clump lh-audit-group">
    <summary>
      <div class="lh-audit-group__summary">
        <div class="lh-audit-group__header"></div>
        <div class="lh-audit-group__itemcount"></div>
        <div class=""></div>
      </div>
    </summary>
  </details>
</template>

<!-- Lighthouse audit -->
<template id="tmpl-lh-audit">
  <div class="lh-audit">
    <details class="lh-expandable-details">
      <summary>
        <div class="lh-audit__header lh-expandable-details__summary">
          <span class="lh-audit__index"></span>
          <span class="lh-audit__title"></span>
          <span class="lh-audit__display-text"></span>
          <div class="lh-audit__score-icon"></div>
          <div class="lh-chevron-container"></div>
        </div>
      </summary>
      <div class="lh-audit__description"></div>
    </details>
  </div>
</template>

<!-- Lighthouse perf metric -->
<template id="tmpl-lh-metric">
  <div class="lh-metric">
    <div class="lh-metric__innerwrap tooltip-boundary">
      <span class="lh-metric__title"></span>
      <div class="lh-metric__value"></div>
      <div class="lh-metric__description tooltip"></div>
    </div>
  </div>
</template>

<!-- Lighthouse perf opportunity -->
<template id="tmpl-lh-opportunity">
  <div class="lh-audit lh-audit--load-opportunity">
    <details class="lh-expandable-details">
        <summary>
          <div class="lh-audit__header lh-expandable-details__summary">
            <div class="lh-load-opportunity__cols">
              <div class="lh-load-opportunity__col lh-load-opportunity__col--one">
                <span class="lh-audit__index"></span>
                <div class="lh-audit__title"></div>
              </div>
              <div class="lh-load-opportunity__col lh-load-opportunity__col--two">
                <div class="lh-load-opportunity__sparkline">
                  <div class="lh-sparkline"><div class="lh-sparkline__bar"></div></div>
                </div>
                <div class="lh-audit__display-text"></div>
                <div class="lh-chevron-container" title="See resources"></div>
              </div>
            </div>
          </div>
        </summary>
      <div class="lh-audit__description"></div>
    </details>
  </div>
</template>


<!-- Lighthouse perf opportunity header -->
<template id="tmpl-lh-opportunity-header">
  <div class="lh-load-opportunity__header lh-load-opportunity__cols">
    <div class="lh-load-opportunity__col lh-load-opportunity__col--one"></div>
    <div class="lh-load-opportunity__col lh-load-opportunity__col--two"></div>
  </div>
</template>


<!-- Lighthouse score container -->
<template id="tmpl-lh-scores-wrapper">
  <style>
    .lh-scores-wrapper__background,
    .lh-scores-wrapper__shadow {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background: white;
      border-radius: 8px;
    }
    .lh-scores-wrapper__shadow {
      border-radius: 0;
      box-shadow: rgba(0, 0, 0, 0.2) 0px 3px 0px -2px
    }
    .lh-scores-container {
      padding-bottom: calc(var(--section-indent) / 2);
      position: relative;
      width: 100%;
    }
  </style>
  <div class="lh-scores-wrapper">
    <div class="lh-scores-container">
      <div class="lh-scores-wrapper__background"></div>
      <div class="lh-scores-wrapper__shadow"></div>
    </div>
  </div>
</template>


<!-- Lighthouse header -->
<template id="tmpl-lh-heading">
  <style>
    :root {
      --report-header-overlap-top: 30px;
    }
    .lh-header-bg {
      background-color: var(--header-bg-color);
      height: var(--report-header-height);
      left: 0;
      position: absolute;
      top: 0;
      width: 100%;
      will-change: transform;
      contain: strict;
    }
    .lh-lighthouse {
      position: absolute;
      bottom: -4px;
      right: 0;
      opacity: 1;
      transform-origin: bottom right;
      will-change: transform, opacity;
    }
    .lh-header {
      width: 100%;
      height: var(--report-header-height);
      max-width: 100%; /* support text-overflow on url */
      position: relative;
    }
    .lh-metadata {
      flex: 1 1 0;
      padding: calc(var(--section-padding) / 2);
      padding-left: var(--section-indent);
      line-height: 20px;
      color: var(--report-header-color);
      z-index: 1;
      position: relative;
      max-width: 60%;
    }
    .lh-metadata__results {
      text-overflow: ellipsis;
      white-space: nowrap;
      overflow: hidden;
    }
    .lh-metadata__url {
      color: currentColor;
    }
    .lh-scores-wrapper {
      margin-top: -30px;
    }
    .lh-scores-wrapper__shadow {
      opacity: 0;
    }
    .lh-scores-wrapper__background,
    .lh-scores-wrapper__shadow {
      box-shadow: 0 1px 3px 1px rgba(0, 0, 0, 0.1);
      border-radius: 8px;
      will-change: opacity, transform;
      transform-origin: top;
    }

    .lh-product-info, .lh-toolbar__metadata {
      align-items: center;
      white-space: nowrap;
      color: #5F6369;
      display: flex;
      font-size: calc(var(--body-font-size) * 0.9);
      margin-left: var(--section-indent);
      opacity: 0;
      transform: translateY(-50%);
      will-change: opacity;
    }
    .lh-product-info__icon {
      height: 20px;
      margin-right: var(--default-padding);
    }
    .lh-toolbar {
      height: 50px;
      position: absolute;
      top: 25px;
      will-change: transform;
      display: flex;
      width: calc(100% - 70px);  /* give room for export */
    }
    .lh-toolbar__metadata {
      overflow: hidden;
      text-overflow: ellipsis;
      width: 100%;
    }
    .lh-toolbar__url {
      color: currentColor;
      display: block;
      white-space: nowrap;
      margin-right: 2px;
    }
    .lh-export {
      position: absolute;
      right: var(--section-indent);
      transform: translateY(0);
      top: calc(var(--section-padding) / 2);
      will-change: transform;
      z-index: 2;
    }
    .lh-export__button {
      background-color: #fff;
      border: 1px solid #dadada;
      border-radius: 2px;
      cursor: pointer;
      outline: none;
      height: 32px;
      width: 48px;
      background-repeat: no-repeat;
      background-size: 20px;
      background-position: 50% 50%;
      will-change: transform;
    }
    .lh-export__button:focus,
    .lh-export__button.active {
      box-shadow: 1px 1px 3px #ccc;
    }
    .lh-export__button.active + .lh-export__dropdown {
      opacity: 1;
      clip: rect(0, 164px, 200px, 0);
    }
    .lh-export__dropdown {
      position: absolute;
      background-color: #fff;
      border: 1px solid var(--report-border-color);
      border-radius: 3px;
      padding: calc(var(--default-padding) / 2) 0;
      cursor: pointer;
      top: 36px;
      right: 0;
      box-shadow: 1px 1px 3px #ccc;
      min-width: 125px;
      clip: rect(0, 164px, 0, 0);
      opacity: 0;
      transition: all 200ms cubic-bezier(0,0,0.2,1);
    }
    .lh-export__dropdown a {
      display: block;
      color: currentColor;
      text-decoration: none;
      white-space: nowrap;
      padding: 0 12px;
      line-height: 2;
    }
    .lh-export__dropdown a:hover,
    .lh-export__dropdown a:focus {
      background-color: #efefef;
      outline: none;
    }
    .lh-export__dropdown .report-icon {
      cursor: pointer;
      background-repeat: no-repeat;
      background-position: 8px 50%;
      background-size: 18px;
      background-color: transparent;
      text-indent: 18px;
    }
    /* copy icon needs slight adjustments to look great */
    .lh-export__dropdown .report-icon--copy {
      background-size: 16px;
      background-position: 9px 50%;
    }
    /* save-as-gist option hidden in report */
    .lh-export__dropdown .lh-export--gist {
      display: none;
    }
    .lh-config {
      color: var(--secondary-text-color);
    }
    .lh-config__timestamp {
      font-size: var(--caption-font-size);
      display: block;
    }
    a.lh-config__emulation {
      color: inherit;
      text-decoration: none;
    }
    @media screen and (max-width: 964px) {
      .lh-export__dropdown {
        right: 0;
        left: initial;
      }
    }
    @media print {
      .lh-header {
        position: static;
        margin-left: 0;
      }
    }
/*
    TODO: Enable animating the clouds
    .lh-lighthouse__clouds {
      animation: panacross 30s linear infinite;
      animation-play-state: paused;
    }
    @keyframes panacross {
      0% { transform: translateX(0px); }
      77% { transform: translateX(-680px); }
      77.0001% { transform: translateX(195px); }
      100% { transform: translateX(0px); }
    } */

    .score100 .lh-header-bg {
      background-color: hsl(234, 64%, 19%);
    }
    .score100 .lh-metadata, .score100 .lh-toolbar__metadata, .score100 .lh-product-info {
      color: #fff;
    }
    .score100 .lh-config {
      color: #eee;
    }

    /* CSS Fireworks. Originally by Eddie Lin
       https://codepen.io/paulirish/pen/yEVMbP
    */
    .pyro {
      display: none;
    }
    .score100 .pyro {
      display: block;
    }
    .score100 .lh-lighthouse stop:first-child {
      stop-color: hsla(200, 12%, 95%, 0);
    }
    .score100 .lh-lighthouse stop:last-child {
      stop-color: hsla(65, 81%, 76%, 1);
    }

    .pyro > .before, .pyro > .after {
      position: absolute;
      width: 5px;
      height: 5px;
      border-radius: 2.5px;
      box-shadow: 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff, 0 0 #fff;
      animation: 1s bang ease-out infinite backwards,  1s gravity ease-in infinite backwards,  5s position linear infinite backwards;
      animation-delay: 1s, 1s, 1s;
    }

    .pyro > .after {
      animation-delay: 2.25s, 2.25s, 2.25s;
      animation-duration: 1.25s, 1.25s, 6.25s;
    }
    .fireworks-paused .pyro > div {
      animation-play-state: paused;
    }

    @keyframes bang {
      to {
        box-shadow: -70px -115.67px #47ebbc, -28px -99.67px #eb47a4, 58px -31.67px #7eeb47, 13px -141.67px #eb47c5, -19px 6.33px #7347eb, -2px -74.67px #ebd247, 24px -151.67px #eb47e0, 57px -138.67px #b4eb47, -51px -104.67px #479eeb, 62px 8.33px #ebcf47, -93px 0.33px #d547eb, -16px -118.67px #47bfeb, 53px -84.67px #47eb83, 66px -57.67px #eb47bf, -93px -65.67px #91eb47, 30px -13.67px #86eb47, -2px -59.67px #83eb47, -44px 1.33px #eb47eb, 61px -58.67px #47eb73, 5px -22.67px #47e8eb, -66px -28.67px #ebe247, 42px -123.67px #eb5547, -75px 26.33px #7beb47, 15px -52.67px #a147eb, 36px -51.67px #eb8347, -38px -12.67px #eb5547, -46px -59.67px #47eb81, 78px -114.67px #eb47ba, 15px -156.67px #eb47bf, -36px 1.33px #eb4783, -72px -86.67px #eba147, 31px -46.67px #ebe247, -68px 29.33px #47e2eb, -55px 19.33px #ebe047, -56px 27.33px #4776eb, -13px -91.67px #eb5547, -47px -138.67px #47ebc7, -18px -96.67px #eb47ac, 11px -88.67px #4783eb, -67px -28.67px #47baeb, 53px 10.33px #ba47eb, 11px 19.33px #5247eb, -5px -11.67px #eb4791, -68px -4.67px #47eba7, 95px -37.67px #eb478b, -67px -162.67px #eb5d47, -54px -120.67px #eb6847, 49px -12.67px #ebe047, 88px 8.33px #47ebda, 97px 33.33px #eb8147, 6px -71.67px #ebbc47;
      }
    }
    @keyframes gravity {
      to {
        transform: translateY(80px);
        opacity: 0;
      }
    }
    @keyframes position {
      0%, 19.9% {
        margin-top: 4%;
        margin-left: 47%;
      }
      20%, 39.9% {
        margin-top: 7%;
        margin-left: 30%;
      }
      40%, 59.9% {
        margin-top: 6%;
        margin-left: 70%;
      }
      60%, 79.9% {
        margin-top: 3%;
        margin-left: 20%;
      }
      80%, 99.9% {
        margin-top: 3%;
        margin-left: 80%;
      }
    }
  </style>
  <div class="lh-header-bg">
    <div class="pyro">
      <div class="before"></div>
      <div class="after"></div>
    </div>
  </div>
  

  <div class="lh-header-container">
    <div class="lh-header">
      <div class="lh-lighthouse">
        <svg width="217" height="148" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
          <defs>
            <mask id="a" x="-56" y="-54" width="284" height="202" maskUnits="userSpaceOnUse">
              <path d="M-56-54h284v202H-56z" fill="#fff"></path>
            </mask>
            <linearGradient id="b" x1="-525.16" y1="560.08" x2="-524.23" y2="560.08" gradientTransform="matrix(91 0 0 -77 47797 43181)" gradientUnits="userSpaceOnUse">
              <stop offset="0" stop-color="#FFFFFF00"/>
              <stop offset="1" stop-color="#FFFFFF"/>
            </linearGradient>
          </defs>
          <g mask="url(#a)">
            <!-- lighthouse building elements -->
            <path d="M95 47h24v2H95z" fill="#ec5548"/>
            <path d="M95 59h24v7H95z" fill="#ec5548"/>
            <path d="M97.63 66h19.74l2.63 47H95z" fill="#fff"/>
            <path d="M107 38a10 10 0 0 1 10 10v1H97v-1a10 10 0 0 1 10-10zM96.77 82.23l21-10.7.63 11.87-22.31 11.87zM95 110.8L119.1 98l.9 14H95z" fill="#ec5548"/>
            <path d="M0 148a177.58 177.58 0 0 1 217 0z" fill="#e8eaed"/>
            <!-- lighthouse beam elements -->
            <path d="M98 49h18v11H98z" fill="#fbc21b"/>
            <path d="M103 49a5 5 0 0 1 5 5 5 5 0 0 1-5 5 5 5 0 0 1-5-5 5 5 0 0 1 5-5z" fill="#fef0c8"/>
            <path d="M7 16l91 33.18v10L7 93z" fill="url(#b)"/>
          </g>
          <g mask="url(#a)" class="lh-lighthouse__clouds">
            <path d="M60 .19A9.77 9.77 0 0 1 61.93 0a9.44 9.44 0 0 1 9.24 7.83A7.24 7.24 0 0 1 79 14.45v.73A7.37 7.37 0 0 1 76.2 21h-31a7.44 7.44 0 0 1-1.2-4.09 7.31 7.31 0 0 1 7.26-7.36 6.84 6.84 0 0 1 1.28.1v-.11A9.51 9.51 0 0 1 60 .19m79.78 22.31h-17.9a4.37 4.37 0 0 1-.63-2.25 4.2 4.2 0 0 1 4.16-4.25 4.37 4.37 0 0 1 .72.06V16a5.35 5.35 0 0 1 10.64-1h.33a4.2 4.2 0 0 1 4.15 4.25 4.29 4.29 0 0 1-1.47 3.25zM163 62h-24.15a5.1 5.1 0 0 1-.85-2.81 5.65 5.65 0 0 1 6.59-5.19v-.08a7.07 7.07 0 0 1 7.24-6.92 7.15 7.15 0 0 1 7.17 5.64h.44a5.46 5.46 0 0 1 5.6 5.32A5.19 5.19 0 0 1 163 62z" fill="#fff"/>
          </g>
        </svg>
      </div>

      <div class="lh-metadata">
        <div class="lh-metadata__results"><a href="" class="lh-metadata__url" target="_blank" rel="noopener"></a></div>
        <div class="lh-config">
          <span class="lh-config__timestamp"></span>
          <a href="#runtime-settings" class="lh-config__emulation"></a>
        </div>
      </div>
    </div>

    <div class="lh-scores-wrapper-placeholder"></div>

    <div class="lh-toolbar">
      <div class="lh-product-info">
        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACAAAAAgCAIAAAD8GO2jAAADjklEQVR4AWI08P/HQEvAQrxSQKvlECfLFYXx75xCY2qmh89GbNvOMjb3v9jOOlxnFWxj206ebQ3b7q6q+z1rNagu8/zvPSZACAABpeUAA0miMgU7SA7JjCraFGwZwECOwvL75dWjsKgWBKtx0jvWo+vkBAFbACCkByMP6nMn48+AVgXB2fzSCwsv22/lMGlUhmJ0AE7BH8dyUUDbUEgN6RzJRSeaPxhdRYR0Inel+7Hd5lBiFpkMAxACc0394//9C4voFHDiAAGLpuOXebdfdHfctgwJKaZRLRKy6ItrSis6RBnVBgGtbHyKTEmJHQoEXoBCE5BCrDeA2ogMUIGDAKEBDEhUqwgMqBYDjW4DQzmuffVdqff42/ZQYYqVcMXGZsMPyCsH3lyJSetxvEaxAQXdjR1HjfwCdIS7lo2DZke26Qe+MXO12OWkGT0O6oE7vMGkMnkYw4aN1KQgMKExhXqswfiov4+a7MQ11XPnbr/5qpKlgACAAQj94Lu271bN9DUecQasIZlNzG72llRAAKJiAi+/BSHrSFjRvQhg3DEKEqJh08tsmLTx597+f6enr4cc2Zpk57pihfX24dW7RHcOLLUbJYhJSl0ErQCI9BVXH/XrO97QasuvQQSiECa0BrQCIIJp6X9T/r8QG6L71WYSqCoIIGo2BZDUBnS/D9EA9Nun1iYvbM0MFExIDQRoKFatc1Z6zrm5uWeObJotq0BGV9FuQBWq5a4Fw3PPz848rZHstZSuA5FWAFSMP2nOppOOGpl6qh9PCSg0IFyHKjSQyDNQHTru2t75NOEe0fsf246oAmFkI6vCdnWvbQFQFCKx8vCswV8TrDLiDLgH4Nr7RAtNsrC9d8sfk7b8ls4igdNy8CQKAISlsB0FjZfd3Lfp155tf8fKI4BxZZIj/oTdVEAIAcJFOCmzauHG71I7/rdreUAgAqpDP05fDARCAQQARwEIBQSVxq0FyaLvZZtevpHa8WHw8cft6cpxlq8eAJtIhnSbWDf951yx3y13OqUuu5qyGgkxCgGFh9cDihDGbTa6BqvT1lWmrav3bmt2ZMJ4mU6TGgIC4DBzcv/JqAau1WhzSt3x9Ixk/4Jk/8J4ZrrViFMA4W6A7+WK8xcVjvyrOmVD0FbAXokcT48r+xVqLKvuJYbmpNadnlp3mpufJHOe/GXktM+r09bT8kEdq9BRYAbGSgzP7ll82U71Mc+ZFooXgwAAAABJRU5ErkJggg==" alt="" class="lh-product-info__icon" />
        <span class="lh-product-info__name">Lighthouse</span>&nbsp;
        <span class="lh-product-info__version"></span>
      </div>

      <div class="lh-toolbar__metadata">
        <a href="" class="lh-toolbar__url" target="_blank" rel="noopener"></a>
        <span class="lh-toggle-arrow" title="See report's runtime settings"></span>
      </div>
    </div>

    <div class="lh-export">
      <button class="report-icon report-icon--share lh-export__button" title="Export report"></button>
      <div class="lh-export__dropdown">
        <!-- TODO(i18n): localize export dropdown -->
        <a href="#" class="report-icon report-icon--print" data-action="print-summary">Print Summary</a>
        <a href="#" class="report-icon report-icon--print" data-action="print-expanded">Print Expanded</a>
        <a href="#" class="report-icon report-icon--copy" data-action="copy">Copy JSON</a>
        <a href="#" class="report-icon report-icon--download" data-action="save-html">Save as HTML</a>
        <a href="#" class="report-icon report-icon--download" data-action="save-json">Save as JSON</a>
        <a href="#" class="report-icon report-icon--open lh-export--viewer" data-action="open-viewer">Open in Viewer</a>
        <a href="#" class="report-icon report-icon--open lh-export--gist" data-action="save-gist">Save as Gist</a>
      </div>
    </div>
</template>


<!-- Lighthouse footer -->
<template id="tmpl-lh-footer">
  <style>
    .lh-footer {
      background-color: var(--header-bg-color);
      border-top: 1px solid var(--report-secondary-border-color);
      padding: var(--section-indent) calc(var(--default-padding) * 2);
    }
    .lh-footer .lh-generated {
      text-align: center;
      border-top: 1px solid var(--report-border-color);
      padding-top: var(--default-padding);
    }
    .lh-env {
      padding: var(--default-padding) 0;
    }
    .lh-env__items {
      padding-left: 16px;
    }
    span.lh-env__name {
      font-weight: bold;
      color: var(--secondary-text-color);
    }
    span.lh-env__description {
      font-family: var(--monospace-font-family);
      font-size: var(--caption-font-size);
      padding-left: 5px;
    }
  </style>
  <footer class="lh-footer">
    <!-- TODO(i18n): localize runtime settings -->
    <div class="lh-env">
      <div class="lh-env__title">Runtime settings</div>
      <ul class="lh-env__items">
        <template id="tmpl-lh-env__items">
          <li class="lh-env__item">
            <span class="lh-env__name"></span>
            <span class="lh-env__description"></span>
          </li>
        </template>
      </ul>
    </div>

    <div class="lh-generated">
      Generated by <b>Lighthouse</b> <span class="lh-footer__version"></span> |
      <a href="https://github.com/GoogleChrome/Lighthouse/issues" target="_blank" rel="noopener">File an issue</a>
    </div>
  </footer>
</template>

<!-- Lighthouse score gauge -->
<template id="tmpl-lh-gauge">
  <style>
    .lh-gauge__wrapper {
      --circle-size-half: calc(var(--circle-size) / 2);
      --circle-background: hsl(216, 12%, 92%);
      --circle-border-width: 9;
      --inset-size: calc(var(--circle-size) - 2 * var(--circle-border-width));
      --transition-length: 1s;
    }

    .lh-gauge__wrapper--pass,
    .lh-gauge__wrapper--pass .lh-gauge {
      --circle-color: var(--pass-color);
      color: var(--circle-color);
    }

    .lh-gauge__wrapper--average,
    .lh-gauge__wrapper--average .lh-gauge {
      --circle-color: var(--average-color);
      color: var(--circle-color);
    }

    .lh-gauge__wrapper--fail,
    .lh-gauge__wrapper--fail .lh-gauge {
      --circle-color: var(--fail-color);
      color: var(--circle-color);
    }

    .lh-gauge {
        max-width: 360px;
        max-height: 360px;
        stroke-linecap: round;
        width: var(--circle-size);
        height: var(--circle-size);
    }

    .lh-gauge-base {
        fill: none;
        stroke: var(--circle-background);
        stroke-width: var(--circle-border-width);
    }
    .lh-gauge-arc {
        fill: none;
        stroke: var(--circle-color);
        stroke-width: var(--circle-border-width);
        animation: load-gauge var(--transition-length) ease forwards;
        animation-delay: 250ms;
    }

    @keyframes load-gauge {
      from { stroke-dasharray: 0 329; }
    }

    .lh-gauge__percentage {
      --spacer: calc((var(--circle-size) - var(--inset-size)) / 2);
      width: 100%;
      height: var(--inset-size);
      position: absolute;
      border-radius: inherit;
      font-size: var(--header-font-size);
      line-height: var(--header-font-size);
      text-align: center;
      top: calc(var(--circle-size) / 3);
    }

    .lh-gauge__wrapper {
      display: inline-flex;
      align-items: center;
      flex-direction: column;
      text-decoration: none;
      flex: 1;
      min-width: auto;
      position: relative;

      /* Contain the layout style paint & layers during animation*/
      contain: content;
      will-change: opacity; /* Only using for layer promotion */
    }

    .lh-gauge__label {
      font-size: var(--body-font-size);
      line-height: var(--body-line-height);
      margin-top: calc(0.5 * var(--body-line-height));
      text-align: center;
      color: black;
    }

  </style>
  <a href="#" class="lh-gauge__wrapper">
    <svg viewBox="0 0 120 120" class="lh-gauge" fill="none" stroke-width="2">
      <circle class="lh-gauge-base" r="53" cx="60" cy="60"></circle>
      <circle class="lh-gauge-arc" transform="rotate(-90 60 60)" stroke-dasharray="0 329" stroke-dashoffset="0" r="53" cx="60" cy="60"></circle>
    </svg>
    <div class="lh-gauge__percentage"></div>
    <div class="lh-gauge__label"></div>
  </a>
</template>


<!-- Lighthouse PWA badge gauge -->
<template id="tmpl-lh-gauge--pwa">
  <style>
    .lh-gauge--pwa__wrapper {
      display: inline-flex;
      align-items: center;
      flex-direction: column;
      text-decoration: none;
      flex: 1;
      min-width: auto;
      position: relative;
    }
    .lh-gauge--pwa {
      width: var(--circle-size);
      height: var(--circle-size);
    }
    .lh-gauge--pwa .lh-gauge--pwa__component {
      display: none;
    }
    .lh-gauge--pwa__wrapper:not(.lh-badged--all) .lh-gauge--pwa__logo > path {
      /* Gray logo unless everything is passing. */
      fill: #B0B0B0;
    }

    /* No passing groups. */
    .lh-gauge--pwa__wrapper:not([class*='lh-badged--']) .lh-gauge--pwa__na-line {
      display: inline;
    }
    /* Just optimized. Same n/a line as no passing groups. */
    .lh-gauge--pwa__wrapper.lh-badged--pwa-optimized .lh-gauge--pwa__na-line {
      display: inline;
    }

    /* Just fast and reliable. */
    .lh-gauge--pwa__wrapper.lh-badged--pwa-fast-reliable:not(.lh-badged--pwa-installable) .lh-gauge--pwa__fast-reliable-badge {
      display: inline;
    }

    /* Just installable. */
    .lh-gauge--pwa__wrapper.lh-badged--pwa-installable:not(.lh-badged--pwa-fast-reliable) .lh-gauge--pwa__installable-badge {
      display: inline;
    }

    /* Fast and reliable and installable. */
    .lh-gauge--pwa__wrapper.lh-badged--pwa-fast-reliable.lh-badged--pwa-installable .lh-gauge--pwa__fast-reliable-installable-badges {
      display: inline;
    }

    /* All passing groups. */
    .lh-gauge--pwa__wrapper.lh-badged--all .lh-gauge--pwa__check-circle {
      display: inline;
    }

    .lh-gauge__label {
      font-size: var(--body-font-size);
      line-height: var(--body-line-height);
      margin-top: calc(0.5 * var(--body-line-height));
      text-align: center;
      color: black;
    }
  </style>

  <a href="#" class="lh-gauge--pwa__wrapper">
    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 60 60" class="lh-gauge--pwa">
      <defs>
        <linearGradient id="lh-gauge--pwa__bg-disk__gradient" x1="50%" y1="2.15%" x2="50%" y2="97.645%">
          <stop stop-color="#F1F3F4" offset="0%"></stop>
          <stop stop-color="#DEE6EA" offset="100%"></stop>
        </linearGradient>
        <linearGradient id="lh-gauge--pwa__check-circle__gradient" x1="50%" y1="0%" x2="50%" y2="100%">
          <stop stop-color="#00C852" offset="0%"></stop>
          <stop stop-color="#009688" offset="100%"></stop>
        </linearGradient>
        <linearGradient id="lh-gauge--pwa__installable__shadow-gradient" x1="76.056%" x2="24.111%" y1="82.995%" y2="24.735%">
          <stop stop-color="#A5D6A7" offset="0%"></stop>
          <stop stop-color="#80CBC4" offset="100%"></stop>
        </linearGradient>
        <linearGradient id="lh-gauge--pwa__fast-reliable__shadow-gradient" x1="76.056%" y1="82.995%" x2="25.678%" y2="26.493%">
          <stop stop-color="#64B5F6" offset="0%"></stop>
          <stop stop-color="#2979FF" offset="100%"></stop>
        </linearGradient>

        <g id="lh-gauge--pwa__fast-reliable-badge">
          <circle fill="#FFFFFF" cx="10" cy="10" r="10"></circle>
          <path fill="#304FFE" d="M10 3.58l5.25 2.34v3.5c0 3.23-2.24 6.26-5.25 7-3.01-.74-5.25-3.77-5.25-7v-3.5L10 3.58zm-.47 10.74l2.76-4.83.03-.07c.04-.08 0-.24-.22-.24h-1.64l.47-3.26h-.47l-2.7 4.77c-.02.01.05-.1-.04.05-.09.16-.1.31.18.31h1.63l-.47 3.27h.47z"/>
        </g>
        <g id="lh-gauge--pwa__installable-badge">
          <circle fill="#FFFFFF" cx="10" cy="10" r="10"></circle>
          <path fill="#009688" d="M10 4.167A5.835 5.835 0 0 0 4.167 10 5.835 5.835 0 0 0 10 15.833 5.835 5.835 0 0 0 15.833 10 5.835 5.835 0 0 0 10 4.167zm2.917 6.416h-2.334v2.334H9.417v-2.334H7.083V9.417h2.334V7.083h1.166v2.334h2.334v1.166z"/>
        </g>
      </defs>

      <g stroke="none" fill-rule="nonzero">
        <!-- Background and PWA logo (color by default) -->
        <circle fill="url(#lh-gauge--pwa__bg-disk__gradient)" cx="30" cy="30" r="30"></circle>
        <g class="lh-gauge--pwa__logo">
          <path fill="#3D3D3D" d="M35.66 19.39l.7-1.75h2L37.4 15 38.6 12l3.4 9h-2.51l-.58-1.61z"/>
          <path fill="#304FFE" d="M33.52 21l3.65-9h-2.42l-2.5 5.82L30.5 12h-1.86l-1.9 5.82-1.35-2.65-1.21 3.72L25.4 21h2.38l1.72-5.2 1.64 5.2z"/>
          <path fill="#3D3D3D" fill-rule="nonzero" d="M20.3 17.91h1.48c.45 0 .85-.05 1.2-.15l.39-1.18 1.07-3.3a2.64 2.64 0 0 0-.28-.37c-.55-.6-1.36-.91-2.42-.91H18v9h2.3V17.9zm1.96-3.84c.22.22.33.5.33.87 0 .36-.1.65-.29.87-.2.23-.59.35-1.15.35h-.86v-2.41h.87c.52 0 .89.1 1.1.32z"/>
        </g>

        <!-- No badges. -->
        <rect class="lh-gauge--pwa__component lh-gauge--pwa__na-line" fill="#FFFFFF" x="20" y="32" width="20" height="4" rx="2"></rect>

        <!-- Just fast and reliable. -->
        <g class="lh-gauge--pwa__component lh-gauge--pwa__fast-reliable-badge" transform="translate(20, 29)">
          <path fill="url(#lh-gauge--pwa__fast-reliable__shadow-gradient)" d="M33.63 19.49A30 30 0 0 1 16.2 30.36L3 17.14 17.14 3l16.49 16.49z"/>
          <use xlink:href="#lh-gauge--pwa__fast-reliable-badge" />
        </g>

        <!-- Just installable. -->
        <g class="lh-gauge--pwa__component lh-gauge--pwa__installable-badge" transform="translate(20, 29)">
          <path fill="url(#lh-gauge--pwa__installable__shadow-gradient)" d="M33.629 19.487c-4.272 5.453-10.391 9.39-17.415 10.869L3 17.142 17.142 3 33.63 19.487z"/>
          <use xlink:href="#lh-gauge--pwa__installable-badge" />
        </g>

        <!-- Fast and reliable and installable. -->
        <g class="lh-gauge--pwa__component lh-gauge--pwa__fast-reliable-installable-badges">
          <g transform="translate(8, 29)"> <!-- fast and reliable -->
            <path fill="url(#lh-gauge--pwa__fast-reliable__shadow-gradient)" d="M16.321 30.463L3 17.143 17.142 3l22.365 22.365A29.864 29.864 0 0 1 22 31c-1.942 0-3.84-.184-5.679-.537z"/>
            <use xlink:href="#lh-gauge--pwa__fast-reliable-badge" />
          </g>
          <g transform="translate(32, 29)"> <!-- installable -->
            <path fill="url(#lh-gauge--pwa__installable__shadow-gradient)" d="M25.982 11.84a30.107 30.107 0 0 1-13.08 15.203L3 17.143 17.142 3l8.84 8.84z"/>
            <use xlink:href="#lh-gauge--pwa__installable-badge" />
          </g>
        </g>

        <!-- Full PWA. -->
        <g class="lh-gauge--pwa__component lh-gauge--pwa__check-circle" transform="translate(18, 28)">
          <circle fill="#FFFFFF" cx="12" cy="12" r="12"></circle>
          <path fill="url(#lh-gauge--pwa__check-circle__gradient)" d="M12 2a10 10 0 1 0 0 20 10 10 0 0 0 0-20zm-2 15l-5-5 1.41-1.41L10 14.17l7.59-7.59L19 8l-9 9z"></path>
        </g>
      </g>
    </svg>

    <div class="lh-gauge__label"></div>
  </a>
</template>

<!-- Lighthouse crtiical request chains component -->
<template id="tmpl-lh-crc">
  <div class="lh-crc-container">
    <style>
      .lh-crc .tree-marker {
        width: 12px;
        height: 26px;
        display: block;
        float: left;
        background-position: top left;
      }
      .lh-crc .horiz-down {
        background: url('data:image/svg+xml;utf8,<svg width="16" height="26" viewBox="0 0 16 26" xmlns="http://www.w3.org/2000/svg"><g fill="%23D8D8D8" fill-rule="evenodd"><path d="M16 12v2H-2v-2z"/><path d="M9 12v14H7V12z"/></g></svg>');
      }
      .lh-crc .right {
        background: url('data:image/svg+xml;utf8,<svg width="16" height="26" viewBox="0 0 16 26" xmlns="http://www.w3.org/2000/svg"><path d="M16 12v2H0v-2z" fill="%23D8D8D8" fill-rule="evenodd"/></svg>');
      }
      .lh-crc .up-right {
        background: url('data:image/svg+xml;utf8,<svg width="16" height="26" viewBox="0 0 16 26" xmlns="http://www.w3.org/2000/svg"><path d="M7 0h2v14H7zm2 12h7v2H9z" fill="%23D8D8D8" fill-rule="evenodd"/></svg>');
      }
      .lh-crc .vert-right {
        background: url('data:image/svg+xml;utf8,<svg width="16" height="26" viewBox="0 0 16 26" xmlns="http://www.w3.org/2000/svg"><path d="M7 0h2v27H7zm2 12h7v2H9z" fill="%23D8D8D8" fill-rule="evenodd"/></svg>');
      }
      .lh-crc .vert {
        background: url('data:image/svg+xml;utf8,<svg width="16" height="26" viewBox="0 0 16 26" xmlns="http://www.w3.org/2000/svg"><path d="M7 0h2v26H7z" fill="%23D8D8D8" fill-rule="evenodd"/></svg>');
      }
      .lh-crc .crc-tree {
        font-size: 14px;
        width: 100%;
        overflow-x: auto;
      }
      .lh-crc .crc-node {
        height: 26px;
        line-height: 26px;
        white-space: nowrap;
      }
      .lh-crc .crc-node__tree-value {
        margin-left: 10px;
      }
      .lh-crc .crc-node__chain-duration {
        font-weight: 700;
      }
      .lh-crc .crc-node__tree-hostname {
        color: #595959;
      }
      .lh-crc .crc-initial-nav {
        color: #595959;
        font-style: italic;
      }
      .lh-crc__summary-value {
        margin-bottom: 10px;
      }
    </style>
    <div>
      <div class="lh-crc__summary-value">
        <span class="lh-crc__longest_duration_label"></span> <b class="lh-crc__longest_duration"></b>
      </div>
    </div>
    <div class="lh-crc">
      <div class="crc-initial-nav"></div>
      <!-- stamp for each chain -->
      <template id="tmpl-lh-crc__chains">
        <div class="crc-node">
          <span class="crc-node__tree-marker">

          </span>
          <span class="crc-node__tree-value">
            <span class="crc-node__tree-file"><!-- fill me: node.request.url.file --></span>
            <span class="crc-node__tree-hostname">(<!-- fill me: node.request.url.host -->)</span>

          </span>
        </div>
      </template>
    </div>
  </div>
</template>


<!-- Lighthouse snippet component -->
<template id="tmpl-lh-snippet">
    <div class="lh-snippet">
      <style>
          :root {
            --snippet-highlight-light: #fbf1f2;
            --snippet-highlight-dark: #ffd6d8;
          }
          
         .lh-snippet__header {
          position: relative;
          overflow: hidden;
          padding: 10px;
          border-bottom: none;
          color: var(--subheader-color);
          background: var(--medium-50-gray);
          border: 1px solid var(--report-secondary-border-color);
        }
        .lh-snippet__title {
          font-weight: bold;
          float: left;
        }
        .lh-snippet__node {
          float: left;
          margin-left: 4px;
        }
        .lh-snippet__toggle-expand {
          padding: 1px 7px;
          margin-top: -1px;
          margin-right: -7px;
          float: right;
          background: transparent;
          border: none;
          cursor: pointer;
          font-size: 14px;
          color: #0c50c7;
        }

        .lh-snippet__snippet {
          overflow: auto;
          border: 1px solid var(--report-secondary-border-color);
        }
        /* Container needed so that all children grow to the width of the scroll container */
        .lh-snippet__snippet-inner {
          display: inline-block;
          min-width: 100%;
        }

        .lh-snippet:not(.lh-snippet--expanded) .lh-snippet__show-if-expanded {
          display: none;
        }
        .lh-snippet.lh-snippet--expanded .lh-snippet__show-if-collapsed {
          display: none;
        }

        .lh-snippet__line {
          background: white;
          white-space: pre;
          display: flex;
        }        
        .lh-snippet__line:not(.lh-snippet__line--message):first-child {
          padding-top: 4px;
        }
        .lh-snippet__line:not(.lh-snippet__line--message):last-child {
          padding-bottom: 4px;
        }
        .lh-snippet__line--content-highlighted {
          background: var(--snippet-highlight-dark);
        }
        .lh-snippet__line--message {
          background: var(--snippet-highlight-light);
        }
        .lh-snippet__line--message .lh-snippet__line-number {
          padding-top: 10px;
          padding-bottom: 10px;
        }
        .lh-snippet__line--message code {
          padding: 10px;
          padding-left: 5px;
          color: var(--fail-color);
          font-family: var(--text-font-family);
        }
        .lh-snippet__line--message code {
          white-space: normal;
        }
        .lh-snippet__line-icon {
          padding-top: 10px;
          display: none;
        }
        .lh-snippet__line--message .lh-snippet__line-icon {
          display: block;
        }
        .lh-snippet__line-icon:before {
          content: "";
          display: inline-block;
          vertical-align: middle;
          margin-right: 4px;
          width: var(--lh-score-icon-width);
          height: var(--lh-score-icon-width);
          background-image: var(--fail-icon-url);
        }
        .lh-snippet__line-number {
          flex-shrink: 0;
          width: 40px;
          text-align: right;
          font-family: monospace;
          padding-right: 5px;
          margin-right: 5px;
          color: var(--medium-75-gray);
          user-select: none;
        }
      </style>
      <template id="tmpl-lh-snippet__header">
        <div class="lh-snippet__header">
          <div class="lh-snippet__title"></div>
          <div class="lh-snippet__node"></div>
          <button class="lh-snippet__toggle-expand">
            <span class="lh-snippet__btn-label-collapse lh-snippet__show-if-expanded"></span>
            <span class="lh-snippet__btn-label-expand lh-snippet__show-if-collapsed"></span>
          </button>
        </div>
      </template>
      <template id="tmpl-lh-snippet__content">
        <div class="lh-snippet__snippet">
          <div class="lh-snippet__snippet-inner"></div>
        </div>
      </template>
      <template id="tmpl-lh-snippet__line">
          <div class="lh-snippet__line">
            <div class="lh-snippet__line-number"></div>
            <div class="lh-snippet__line-icon"></div>
            <code></code>
          </div>
        </template>   
    </div>
  </template>
  
</div>

  <main><!-- report populated here --></main>

  <div id="lh-log"></div>

  <script>/**
 * @license
 * Copyright 2017 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

/* globals self URL */

const ELLIPSIS = '\u2026';
const NBSP = '\xa0';
const PASS_THRESHOLD = 0.9;

const RATINGS = {
  PASS: {label: 'pass', minScore: PASS_THRESHOLD},
  AVERAGE: {label: 'average', minScore: 0.5},
  FAIL: {label: 'fail'},
  ERROR: {label: 'error'},
};

class Util {
  static get PASS_THRESHOLD() {
    return PASS_THRESHOLD;
  }

  static get MS_DISPLAY_VALUE() {
    return `%10d${NBSP}ms`;
  }

  /**
   * Returns a new LHR that's reshaped for slightly better ergonomics within the report rendereer.
   * Also, sets up the localized UI strings used within renderer and number/date formatting
   * The LHR passed in is not mutated.
   * TODO(team): we all agree the LHR shape change is technical debt we should fix
   * @param {LH.Result} result
   * @return {LH.ReportResult}
   */
  static prepareReportResult(result) {
    // If any mutations happen to the report within the renderers, we want the original object untouched
    const clone = /** @type {LH.ReportResult} */ (JSON.parse(JSON.stringify(result)));

    // If LHR is older (≤3.0.3), it has no locale setting. Set default.
    if (!clone.configSettings.locale) {
      clone.configSettings.locale = 'en';
    }
    Util.setNumberDateLocale(clone.configSettings.locale);
    if (clone.i18n && clone.i18n.rendererFormattedStrings) {
      Util.updateAllUIStrings(clone.i18n.rendererFormattedStrings);
    }

    if (typeof clone.categories !== 'object') throw new Error('No categories provided.');
    clone.reportCategories = Object.values(clone.categories);

    // Turn 'not-applicable' and 'not_applicable' into 'notApplicable' to support old reports.
    // TODO: remove when underscore/hyphen proto issue is resolved. See #6371, #6201, #6783.
    for (const audit of Object.values(clone.audits)) {
      // @ts-ignore tsc rightly flags that this value shouldn't occur.
      // eslint-disable-next-line max-len
      if (audit.scoreDisplayMode === 'not_applicable' || audit.scoreDisplayMode === 'not-applicable') {
        audit.scoreDisplayMode = 'notApplicable';
      }
    }

    // For convenience, smoosh all AuditResults into their auditDfn (which has just weight & group)
    for (const category of clone.reportCategories) {
      category.auditRefs.forEach(auditMeta => {
        const result = clone.audits[auditMeta.id];
        auditMeta.result = result;
      });
    }

    return clone;
  }


  /**
   * @param {LH.I18NRendererStrings} rendererFormattedStrings
   */
  static updateAllUIStrings(rendererFormattedStrings) {
    // TODO(i18n): don't mutate these here but on the LHR and pass that around everywhere
    for (const [key, value] of Object.entries(rendererFormattedStrings)) {
      Util.UIStrings[key] = value;
    }
  }

  /**
   * @param {string|Array<string|number>=} displayValue
   * @return {string}
   */
  static formatDisplayValue(displayValue) {
    if (typeof displayValue === 'string') return displayValue;
    if (!displayValue) return '';

    const replacementRegex = /%([0-9]*(\.[0-9]+)?d|s)/;
    const template = /** @type {string} */ (displayValue[0]);
    if (typeof template !== 'string') {
      // First value should always be the format string, but we don't want to fail to build
      // a report, return a placeholder.
      return 'UNKNOWN';
    }

    let output = template;
    for (const replacement of displayValue.slice(1)) {
      if (!replacementRegex.test(output)) {
        // eslint-disable-next-line no-console
        console.warn('Too many replacements given');
        break;
      }

      output = output.replace(replacementRegex, match => {
        const granularity = Number(match.match(/[0-9.]+/)) || 1;
        return match === '%s' ?
          replacement.toLocaleString() :
          (Math.round(Number(replacement) / granularity) * granularity).toLocaleString();
      });
    }

    if (replacementRegex.test(output)) {
      // eslint-disable-next-line no-console
      console.warn('Not enough replacements given');
    }

    return output;
  }

  /**
   * Used to determine if the "passed" for the purposes of showing up in the "failed" or "passed"
   * sections of the report.
   *
   * @param {{score: (number|null), scoreDisplayMode: string}} audit
   * @return {boolean}
   */
  static showAsPassed(audit) {
    switch (audit.scoreDisplayMode) {
      case 'manual':
      case 'notApplicable':
        return true;
      case 'error':
      case 'informative':
        return false;
      case 'numeric':
      case 'binary':
      default:
        return Number(audit.score) >= RATINGS.PASS.minScore;
    }
  }

  /**
   * Convert a score to a rating label.
   * @param {number|null} score
   * @param {string=} scoreDisplayMode
   * @return {string}
   */
  static calculateRating(score, scoreDisplayMode) {
    // Handle edge cases first, manual and not applicable receive 'pass', errored audits receive 'error'
    if (scoreDisplayMode === 'manual' || scoreDisplayMode === 'notApplicable') {
      return RATINGS.PASS.label;
    } else if (scoreDisplayMode === 'error') {
      return RATINGS.ERROR.label;
    } else if (score === null) {
      return RATINGS.FAIL.label;
    }

    // At this point, we're rating a standard binary/numeric audit
    let rating = RATINGS.FAIL.label;
    if (score >= RATINGS.PASS.minScore) {
      rating = RATINGS.PASS.label;
    } else if (score >= RATINGS.AVERAGE.minScore) {
      rating = RATINGS.AVERAGE.label;
    }
    return rating;
  }

  /**
   * Format number.
   * @param {number} number
   * @param {number=} granularity Number of decimal places to include. Defaults to 0.1.
   * @return {string}
   */
  static formatNumber(number, granularity = 0.1) {
    const coarseValue = Math.round(number / granularity) * granularity;
    return coarseValue.toLocaleString(Util.numberDateLocale);
  }

  /**
   * @param {number} size
   * @param {number=} granularity Controls how coarse the displayed value is, defaults to .01
   * @return {string}
   */
  static formatBytesToKB(size, granularity = 0.1) {
    const kbs = (Math.round(size / 1024 / granularity) * granularity)
      .toLocaleString(Util.numberDateLocale);
    return `${kbs}${NBSP}KB`;
  }

  /**
   * @param {number} ms
   * @param {number=} granularity Controls how coarse the displayed value is, defaults to 10
   * @return {string}
   */
  static formatMilliseconds(ms, granularity = 10) {
    const coarseTime = Math.round(ms / granularity) * granularity;
    return `${coarseTime.toLocaleString(Util.numberDateLocale)}${NBSP}ms`;
  }

  /**
   * @param {number} ms
   * @param {number=} granularity Controls how coarse the displayed value is, defaults to 0.1
   * @return {string}
   */
  static formatSeconds(ms, granularity = 0.1) {
    const coarseTime = Math.round(ms / 1000 / granularity) * granularity;
    return `${coarseTime.toLocaleString(Util.numberDateLocale)}${NBSP}s`;
  }

  /**
   * Format time.
   * @param {string} date
   * @return {string}
   */
  static formatDateTime(date) {
    /** @type {Intl.DateTimeFormatOptions} */
    const options = {
      month: 'short', day: 'numeric', year: 'numeric',
      hour: 'numeric', minute: 'numeric', timeZoneName: 'short',
    };
    let formatter = new Intl.DateTimeFormat(Util.numberDateLocale, options);

    // Force UTC if runtime timezone could not be detected.
    // See https://github.com/GoogleChrome/lighthouse/issues/1056
    const tz = formatter.resolvedOptions().timeZone;
    if (!tz || tz.toLowerCase() === 'etc/unknown') {
      options.timeZone = 'UTC';
      formatter = new Intl.DateTimeFormat(Util.numberDateLocale, options);
    }
    return formatter.format(new Date(date));
  }
  /**
   * Converts a time in milliseconds into a duration string, i.e. `1d 2h 13m 52s`
   * @param {number} timeInMilliseconds
   * @return {string}
   */
  static formatDuration(timeInMilliseconds) {
    let timeInSeconds = timeInMilliseconds / 1000;
    if (Math.round(timeInSeconds) === 0) {
      return 'None';
    }

    /** @type {Array<string>} */
    const parts = [];
    const unitLabels = /** @type {Object<string, number>} */ ({
      d: 60 * 60 * 24,
      h: 60 * 60,
      m: 60,
      s: 1,
    });

    Object.keys(unitLabels).forEach(label => {
      const unit = unitLabels[label];
      const numberOfUnits = Math.floor(timeInSeconds / unit);
      if (numberOfUnits > 0) {
        timeInSeconds -= numberOfUnits * unit;
        parts.push(`${numberOfUnits}\xa0${label}`);
      }
    });

    return parts.join(' ');
  }

  /**
   * @param {URL} parsedUrl
   * @param {{numPathParts?: number, preserveQuery?: boolean, preserveHost?: boolean}=} options
   * @return {string}
   */
  static getURLDisplayName(parsedUrl, options) {
    // Closure optional properties aren't optional in tsc, so fallback needs undefined  values.
    options = options || {numPathParts: undefined, preserveQuery: undefined,
      preserveHost: undefined};
    const numPathParts = options.numPathParts !== undefined ? options.numPathParts : 2;
    const preserveQuery = options.preserveQuery !== undefined ? options.preserveQuery : true;
    const preserveHost = options.preserveHost || false;

    let name;

    if (parsedUrl.protocol === 'about:' || parsedUrl.protocol === 'data:') {
      // Handle 'about:*' and 'data:*' URLs specially since they have no path.
      name = parsedUrl.href;
    } else {
      name = parsedUrl.pathname;
      const parts = name.split('/').filter(part => part.length);
      if (numPathParts && parts.length > numPathParts) {
        name = ELLIPSIS + parts.slice(-1 * numPathParts).join('/');
      }

      if (preserveHost) {
        name = `${parsedUrl.host}/${name.replace(/^\//, '')}`;
      }
      if (preserveQuery) {
        name = `${name}${parsedUrl.search}`;
      }
    }

    const MAX_LENGTH = 64;
    // Always elide hexadecimal hash
    name = name.replace(/([a-f0-9]{7})[a-f0-9]{13}[a-f0-9]*/g, `$1${ELLIPSIS}`);
    // Also elide other hash-like mixed-case strings
    name = name.replace(/([a-zA-Z0-9-_]{9})(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z0-9-_]{10,}/g,
      `$1${ELLIPSIS}`);
    // Also elide long number sequences
    name = name.replace(/(\d{3})\d{6,}/g, `$1${ELLIPSIS}`);
    // Merge any adjacent ellipses
    name = name.replace(/\u2026+/g, ELLIPSIS);

    // Elide query params first
    if (name.length > MAX_LENGTH && name.includes('?')) {
      // Try to leave the first query parameter intact
      name = name.replace(/\?([^=]*)(=)?.*/, `?$1$2${ELLIPSIS}`);

      // Remove it all if it's still too long
      if (name.length > MAX_LENGTH) {
        name = name.replace(/\?.*/, `?${ELLIPSIS}`);
      }
    }

    // Elide too long names next
    if (name.length > MAX_LENGTH) {
      const dotIndex = name.lastIndexOf('.');
      if (dotIndex >= 0) {
        name = name.slice(0, MAX_LENGTH - 1 - (name.length - dotIndex)) +
          // Show file extension
          `${ELLIPSIS}${name.slice(dotIndex)}`;
      } else {
        name = name.slice(0, MAX_LENGTH - 1) + ELLIPSIS;
      }
    }

    return name;
  }

  /**
   * Split a URL into a file, hostname and origin for easy display.
   * @param {string} url
   * @return {{file: string, hostname: string, origin: string}}
   */
  static parseURL(url) {
    const parsedUrl = new URL(url);
    return {
      file: Util.getURLDisplayName(parsedUrl),
      hostname: parsedUrl.hostname,
      origin: parsedUrl.origin,
    };
  }

  /**
   * @param {LH.Config.Settings} settings
   * @return {Array<{name: string, description: string}>}
   */
  static getEnvironmentDisplayValues(settings) {
    const emulationDesc = Util.getEmulationDescriptions(settings);

    return [
      {
        name: 'Device',
        description: emulationDesc.deviceEmulation,
      },
      {
        name: 'Network throttling',
        description: emulationDesc.networkThrottling,
      },
      {
        name: 'CPU throttling',
        description: emulationDesc.cpuThrottling,
      },
    ];
  }

  /**
   * @param {LH.Config.Settings} settings
   * @return {{deviceEmulation: string, networkThrottling: string, cpuThrottling: string, summary: string}}
   */
  static getEmulationDescriptions(settings) {
    let cpuThrottling;
    let networkThrottling;
    let summary;

    const throttling = settings.throttling;

    switch (settings.throttlingMethod) {
      case 'provided':
        cpuThrottling = 'Provided by environment';
        networkThrottling = 'Provided by environment';
        summary = 'No throttling applied';
        break;
      case 'devtools': {
        const {cpuSlowdownMultiplier, requestLatencyMs} = throttling;
        cpuThrottling = `${Util.formatNumber(cpuSlowdownMultiplier)}x slowdown (DevTools)`;
        networkThrottling = `${Util.formatNumber(requestLatencyMs)}${NBSP}ms HTTP RTT, ` +
          `${Util.formatNumber(throttling.downloadThroughputKbps)}${NBSP}Kbps down, ` +
          `${Util.formatNumber(throttling.uploadThroughputKbps)}${NBSP}Kbps up (DevTools)`;
        summary = 'Throttled Slow 4G network';
        break;
      }
      case 'simulate': {
        const {cpuSlowdownMultiplier, rttMs, throughputKbps} = throttling;
        cpuThrottling = `${Util.formatNumber(cpuSlowdownMultiplier)}x slowdown (Simulated)`;
        networkThrottling = `${Util.formatNumber(rttMs)}${NBSP}ms TCP RTT, ` +
          `${Util.formatNumber(throughputKbps)}${NBSP}Kbps throughput (Simulated)`;
        summary = 'Simulated Slow 4G network';
        break;
      }
      default:
        cpuThrottling = 'Unknown';
        networkThrottling = 'Unknown';
        summary = 'Unknown';
    }

    let deviceEmulation = 'No emulation';
    if (!settings.disableDeviceEmulation) {
      if (settings.emulatedFormFactor === 'mobile') deviceEmulation = 'Emulated Nexus 5X';
      if (settings.emulatedFormFactor === 'desktop') deviceEmulation = 'Emulated Desktop';
    }

    return {
      deviceEmulation,
      cpuThrottling,
      networkThrottling,
      summary: `${deviceEmulation}, ${summary}`,
    };
  }

  /**
   * Set the locale to be used for Util's number and date formatting functions.
   * @param {LH.Locale} locale
   */
  static setNumberDateLocale(locale) {
    Util.numberDateLocale = locale;

    // When testing, use a locale with more exciting numeric formatting
    if (Util.numberDateLocale === 'en-XA') Util.numberDateLocale = 'de';
  }

  /**
   * Returns only lines that are near a message, or the first few lines if there are
   * no line messages.
   * @param {LH.Audit.Details.SnippetValue['lines']} lines
   * @param {LH.Audit.Details.SnippetValue['lineMessages']} lineMessages
   * @param {number} surroundingLineCount Number of lines to include before and after
   * the message. If this is e.g. 2 this function might return 5 lines.
   */
  static filterRelevantLines(lines, lineMessages, surroundingLineCount) {
    if (lineMessages.length === 0) {
      // no lines with messages, just return the first bunch of lines
      return lines.slice(0, surroundingLineCount * 2 + 1);
    }

    const minGapSize = 3;
    const lineNumbersToKeep = new Set();
    // Sort messages so we can check lineNumbersToKeep to see how big the gap to
    // the previous line is.
    lineMessages = lineMessages.sort((a, b) => (a.lineNumber || 0) - (b.lineNumber || 0));
    lineMessages.forEach(({lineNumber}) => {
      let firstSurroundingLineNumber = lineNumber - surroundingLineCount;
      let lastSurroundingLineNumber = lineNumber + surroundingLineCount;

      while (firstSurroundingLineNumber < 1) {
        // make sure we still show (surroundingLineCount * 2 + 1) lines in total
        firstSurroundingLineNumber++;
        lastSurroundingLineNumber++;
      }
      // If only a few lines would be omitted normally then we prefer to include
      // extra lines to avoid the tiny gap
      if (lineNumbersToKeep.has(firstSurroundingLineNumber - minGapSize - 1)) {
        firstSurroundingLineNumber -= minGapSize;
      }
      for (let i = firstSurroundingLineNumber; i <= lastSurroundingLineNumber; i++) {
        const surroundingLineNumber = i;
        lineNumbersToKeep.add(surroundingLineNumber);
      }
    });

    return lines.filter(line => lineNumbersToKeep.has(line.lineNumber));
  }
}

/**
 * This value is updated on each run to the locale of the report
 * @type {LH.Locale}
 */
Util.numberDateLocale = 'en';

/**
 * Report-renderer-specific strings.
 * @type {LH.I18NRendererStrings}
 */
Util.UIStrings = {
  /** Disclaimer shown to users below the metric values (First Contentful Paint, Time to Interactive, etc) to warn them that the numbers they see will likely change slightly the next time they run Lighthouse. */
  varianceDisclaimer: 'Values are estimated and may vary.',
  /** Column heading label for the listing of opportunity audits. Each audit title represents an opportunity. There are only 2 columns, so no strict character limit.  */
  opportunityResourceColumnLabel: 'Opportunity',
  /** Column heading label for the estimated page load savings of opportunity audits. Estimated Savings is the total amount of time (in seconds) that Lighthouse computed could be reduced from the total page load time, if the suggested action is taken. There are only 2 columns, so no strict character limit. */
  opportunitySavingsColumnLabel: 'Estimated Savings',

  /** An error string displayed next to a particular audit when it has errored, but not provided any specific error message. */
  errorMissingAuditInfo: 'Report error: no audit information',
  /** A label, shown next to an audit title or metric title, indicating that there was an error computing it. The user can hover on the label to reveal a tooltip with the extended error message. Translation should be short (< 20 characters). */
  errorLabel: 'Error!',
  /** This label is shown above a bulleted list of warnings. It is shown directly below an audit that produced warnings. Warnings describe situations the user should be aware of, as Lighthouse was unable to complete all the work required on this audit. For example, The 'Unable to decode image (biglogo.jpg)' warning may show up below an image encoding audit. */
  warningHeader: 'Warnings: ',
  /** The tooltip text on an expandable chevron icon. Clicking the icon expands a section to reveal a list of audit results that was hidden by default. */
  auditGroupExpandTooltip: 'Show audits',
  /** Section heading shown above a list of passed audits that contain warnings. Audits under this section do not negatively impact the score, but Lighthouse has generated some potentially actionable suggestions that should be reviewed. This section is expanded by default and displays after the failing audits. */
  warningAuditsGroupTitle: 'Passed audits but with warnings',
  /** Section heading shown above a list of audits that are passing. 'Passed' here refers to a passing grade. This section is collapsed by default, as the user should be focusing on the failed audits instead. Users can click this heading to reveal the list. */
  passedAuditsGroupTitle: 'Passed audits',
  /** Section heading shown above a list of audits that do not apply to the page. For example, if an audit is 'Are images optimized?', but the page has no images on it, the audit will be marked as not applicable. This is neither passing or failing. This section is collapsed by default, as the user should be focusing on the failed audits instead. Users can click this heading to reveal the list. */
  notApplicableAuditsGroupTitle: 'Not applicable',
  /** Section heading shown above a list of audits that were not computed by Lighthouse. They serve as a list of suggestions for the user to go and manually check. For example, Lighthouse can't automate testing cross-browser compatibility, so that is listed within this section, so the user is reminded to test it themselves. This section is collapsed by default, as the user should be focusing on the failed audits instead. Users can click this heading to reveal the list. */
  manualAuditsGroupTitle: 'Additional items to manually check',

  /** Label shown preceding any important warnings that may have invalidated the entire report. For example, if the user has Chrome extensions installed, they may add enough performance overhead that Lighthouse's performance metrics are unreliable. If shown, this will be displayed at the top of the report UI. */
  toplevelWarningsMessage: 'There were issues affecting this run of Lighthouse:',
  /** Label preceding a pictorial explanation of the scoring scale: 0-50 is red (bad), 50-90 is orange (ok), 90-100 is green (good). These colors are used throughout the report to provide context for how good/bad a particular result is. */
  scorescaleLabel: 'Score scale:',

  /** String of text shown in a graphical representation of the flow of network requests for the web page. This label represents the initial network request that fetches an HTML page. This navigation may be redirected (eg. Initial navigation to http://example.com redirects to https://www.example.com). */
  crcInitialNavigation: 'Initial Navigation',
  /** Label of value shown in the summary of critical request chains. Refers to the total amount of time (milliseconds) of the longest critical path chain/sequence of network requests. Example value: 2310 ms */
  crcLongestDurationLabel: 'Maximum critical path latency:',

  /** Label for button that shows all lines of the snippet when clicked */
  snippetExpandButtonLabel: 'Expand snippet',
  /** Label for button that only shows a few lines of the snippet when clicked */
  snippetCollapseButtonLabel: 'Collapse snippet',

  /** Explanation shown to users below performance results to inform them that the test was done with a 4G network connection and to warn them that the numbers they see will likely change slightly the next time they run Lighthouse. 'Lighthouse' becomes link text to additional documentation. */
  lsPerformanceCategoryDescription: '[Lighthouse](https://developers.google.com/web/tools/lighthouse/) analysis of the current page on an emulated mobile network. Values are estimated and may vary.',
  /** Title of the lab data section of the Performance category. Within this section are various speed metrics which quantify the pageload performance into values presented in seconds and milliseconds. "Lab" is an abbreviated form of "laboratory", and refers to the fact that the data is from a controlled test of a website, not measurements from real users visiting that site.  */
  labDataTitle: 'Lab Data',
};

if (typeof module !== 'undefined' && module.exports) {
  module.exports = Util;
} else {
  self.Util = Util;
}
;
/**
 * @license
 * Copyright 2017 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

/* globals URL self */

/** @typedef {HTMLElementTagNameMap & {[id: string]: HTMLElement}} HTMLElmentByTagName */

class DOM {
  /**
   * @param {Document} document
   */
  constructor(document) {
    /** @type {Document} */
    this._document = document;
  }

  /**
   * @template {string} T
   * @param {T} name
   * @param {string=} className
   * @param {Object<string, (string|undefined)>=} attrs Attribute key/val pairs.
   *     Note: if an attribute key has an undefined value, this method does not
   *     set the attribute on the node.
   * @return {HTMLElmentByTagName[T]}
   */
  createElement(name, className, attrs = {}) {
    const element = this._document.createElement(name);
    if (className) {
      element.className = className;
    }
    Object.keys(attrs).forEach(key => {
      const value = attrs[key];
      if (typeof value !== 'undefined') {
        element.setAttribute(key, value);
      }
    });
    return element;
  }

  /**
   * @return {DocumentFragment}
   */
  createFragment() {
    return this._document.createDocumentFragment();
  }

  /**
   * @template {string} T
   * @param {Element} parentElem
   * @param {T} elementName
   * @param {string=} className
   * @param {Object<string, (string|undefined)>=} attrs Attribute key/val pairs.
   *     Note: if an attribute key has an undefined value, this method does not
   *     set the attribute on the node.
   * @return {HTMLElmentByTagName[T]}
   */
  createChildOf(parentElem, elementName, className, attrs) {
    const element = this.createElement(elementName, className, attrs);
    parentElem.appendChild(element);
    return element;
  }

  /**
   * @param {string} selector
   * @param {ParentNode} context
   * @return {DocumentFragment} A clone of the template content.
   * @throws {Error}
   */
  cloneTemplate(selector, context) {
    const template = /** @type {?HTMLTemplateElement} */ (context.querySelector(selector));
    if (!template) {
      throw new Error(`Template not found: template${selector}`);
    }

    const clone = this._document.importNode(template.content, true);

    // Prevent duplicate styles in the DOM. After a template has been stamped
    // for the first time, remove the clone's styles so they're not re-added.
    if (template.hasAttribute('data-stamped')) {
      this.findAll('style', clone).forEach(style => style.remove());
    }
    template.setAttribute('data-stamped', 'true');

    return clone;
  }

  /**
   * Resets the "stamped" state of the templates.
   */
  resetTemplates() {
    this.findAll('template[data-stamped]', this._document).forEach(t => {
      t.removeAttribute('data-stamped');
    });
  }

  /**
   * @param {string} text
   * @return {Element}
   */
  convertMarkdownLinkSnippets(text) {
    const element = this.createElement('span');

    // Split on markdown links (e.g. [some link](https://...)).
    const parts = text.split(/\[([^\]]*?)\]\((https?:\/\/.*?)\)/g);

    while (parts.length) {
      // Pop off the same number of elements as there are capture groups.
      const [preambleText, linkText, linkHref] = parts.splice(0, 3);
      element.appendChild(this._document.createTextNode(preambleText));

      // Append link if there are any.
      if (linkText && linkHref) {
        const a = this.createElement('a');
        a.rel = 'noopener';
        a.target = '_blank';
        a.textContent = linkText;
        a.href = (new URL(linkHref)).href;
        element.appendChild(a);
      }
    }

    return element;
  }

  /**
   * @param {string} text
   * @return {Element}
   */
  convertMarkdownCodeSnippets(text) {
    const element = this.createElement('span');

    const parts = text.split(/`(.*?)`/g); // Split on markdown code slashes
    while (parts.length) {
      // Pop off the same number of elements as there are capture groups.
      const [preambleText, codeText] = parts.splice(0, 2);
      element.appendChild(this._document.createTextNode(preambleText));
      if (codeText) {
        const pre = this.createElement('code');
        pre.textContent = codeText;
        element.appendChild(pre);
      }
    }

    return element;
  }

  /**
   * @return {Document}
   */
  document() {
    return this._document;
  }

  /**
   * TODO(paulirish): import and conditionally apply the DevTools frontend subclasses instead of this
   * @return {boolean}
   */
  isDevTools() {
    return !!this._document.querySelector('.lh-devtools');
  }

  /**
   * Guaranteed context.querySelector. Always returns an element or throws if
   * nothing matches query.
   * @param {string} query
   * @param {ParentNode} context
   * @return {HTMLElement}
   */
  find(query, context) {
    /** @type {?HTMLElement} */
    const result = context.querySelector(query);
    if (result === null) {
      throw new Error(`query ${query} not found`);
    }
    return result;
  }

  /**
   * Helper for context.querySelectorAll. Returns an Array instead of a NodeList.
   * @param {string} query
   * @param {ParentNode} context
   * @return {Array<HTMLElement>}
   */
  findAll(query, context) {
    return Array.from(context.querySelectorAll(query));
  }
}

if (typeof module !== 'undefined' && module.exports) {
  module.exports = DOM;
} else {
  self.DOM = DOM;
}
;
/*
Details Element Polyfill 2.2.0
Copyright © 2018 Javan Makhmali
 */
(function() {
  "use strict";
  var element = document.createElement("details");
  element.innerHTML = "<summary>a\u003c/summary>b";
  element.setAttribute("style", "position: absolute; left: -9999px");
  var support = {
    open: "open" in element && elementExpands(),
    toggle: "ontoggle" in element
  };
  function elementExpands() {
    (document.body || document.documentElement).appendChild(element);
    var closedHeight = element.offsetHeight;
    element.open = true;
    var openedHeight = element.offsetHeight;
    element.parentNode.removeChild(element);
    return closedHeight != openedHeight;
  }
  var styles = '\ndetails, summary {\n  display: block;\n}\ndetails:not([open]) > *:not(summary) {\n  display: none;\n}\ndetails > summary::before {\n  content: "►";\n  padding-right: 0.3rem;\n  font-size: 0.6rem;\n  cursor: default;\n}\ndetails[open] > summary::before {\n  content: "▼";\n}\n';
  var _ref = [], forEach = _ref.forEach, slice = _ref.slice;
  if (!support.open) {
    polyfillStyles();
    polyfillProperties();
    polyfillToggle();
    polyfillAccessibility();
  }
  if (support.open && !support.toggle) {
    polyfillToggleEvent();
  }
  function polyfillStyles() {
    document.head.insertAdjacentHTML("afterbegin", "<style>" + styles + "\u003c/style>");
  }
  function polyfillProperties() {
    var prototype = document.createElement("details").constructor.prototype;
    var setAttribute = prototype.setAttribute, removeAttribute = prototype.removeAttribute;
    var open = Object.getOwnPropertyDescriptor(prototype, "open");
    Object.defineProperties(prototype, {
      open: {
        get: function get() {
          if (this.tagName == "DETAILS") {
            return this.hasAttribute("open");
          } else {
            if (open && open.get) {
              return open.get.call(this);
            }
          }
        },
        set: function set(value) {
          if (this.tagName == "DETAILS") {
            return value ? this.setAttribute("open", "") : this.removeAttribute("open");
          } else {
            if (open && open.set) {
              return open.set.call(this, value);
            }
          }
        }
      },
      setAttribute: {
        value: function value(name, _value) {
          var _this = this;
          var call = function call() {
            return setAttribute.call(_this, name, _value);
          };
          if (name == "open" && this.tagName == "DETAILS") {
            var wasOpen = this.hasAttribute("open");
            var result = call();
            if (!wasOpen) {
              var summary = this.querySelector("summary");
              if (summary) summary.setAttribute("aria-expanded", true);
              triggerToggle(this);
            }
            return result;
          }
          return call();
        }
      },
      removeAttribute: {
        value: function value(name) {
          var _this2 = this;
          var call = function call() {
            return removeAttribute.call(_this2, name);
          };
          if (name == "open" && this.tagName == "DETAILS") {
            var wasOpen = this.hasAttribute("open");
            var result = call();
            if (wasOpen) {
              var summary = this.querySelector("summary");
              if (summary) summary.setAttribute("aria-expanded", false);
              triggerToggle(this);
            }
            return result;
          }
          return call();
        }
      }
    });
  }
  function polyfillToggle() {
    onTogglingTrigger(function(element) {
      element.hasAttribute("open") ? element.removeAttribute("open") : element.setAttribute("open", "");
    });
  }
  function polyfillToggleEvent() {
    if (window.MutationObserver) {
      new MutationObserver(function(mutations) {
        forEach.call(mutations, function(mutation) {
          var target = mutation.target, attributeName = mutation.attributeName;
          if (target.tagName == "DETAILS" && attributeName == "open") {
            triggerToggle(toggle);
          }
        });
      }).observe(document.documentElement, {
        attributes: true,
        subtree: true
      });
    } else {
      onTogglingTrigger(function(element) {
        var wasOpen = element.getAttribute("open");
        setTimeout(function() {
          var isOpen = element.getAttribute("open");
          if (wasOpen != isOpen) {
            triggerToggle(element);
          }
        }, 1);
      });
    }
  }
  function polyfillAccessibility() {
    setAccessibilityAttributes(document);
    if (window.MutationObserver) {
      new MutationObserver(function(mutations) {
        forEach.call(mutations, function(mutation) {
          forEach.call(mutation.addedNodes, setAccessibilityAttributes);
        });
      }).observe(document.documentElement, {
        subtree: true,
        childList: true
      });
    } else {
      document.addEventListener("DOMNodeInserted", function(event) {
        setAccessibilityAttributes(event.target);
      });
    }
  }
  function setAccessibilityAttributes(root) {
    findElementsWithTagName(root, "SUMMARY").forEach(function(summary) {
      var details = findClosestElementWithTagName(summary, "DETAILS");
      summary.setAttribute("aria-expanded", details.hasAttribute("open"));
      if (!summary.hasAttribute("tabindex")) summary.setAttribute("tabindex", "0");
      if (!summary.hasAttribute("role")) summary.setAttribute("role", "button");
    });
  }
  function eventIsSignificant(event) {
    return !(event.defaultPrevented || event.ctrlKey || event.metaKey || event.shiftKey || event.target.isContentEditable);
  }
  function onTogglingTrigger(callback) {
    addEventListener("click", function(event) {
      if (eventIsSignificant(event)) {
        if (event.which <= 1) {
          var element = findClosestElementWithTagName(event.target, "SUMMARY");
          if (element && element.parentNode && element.parentNode.tagName == "DETAILS") {
            callback(element.parentNode);
          }
        }
      }
    }, false);
    addEventListener("keydown", function(event) {
      if (eventIsSignificant(event)) {
        if (event.keyCode == 13 || event.keyCode == 32) {
          var element = findClosestElementWithTagName(event.target, "SUMMARY");
          if (element && element.parentNode && element.parentNode.tagName == "DETAILS") {
            callback(element.parentNode);
            event.preventDefault();
          }
        }
      }
    }, false);
  }
  function triggerToggle(element) {
    var event = document.createEvent("Event");
    event.initEvent("toggle", true, false);
    element.dispatchEvent(event);
  }
  function findElementsWithTagName(root, tagName) {
    return (root.tagName == tagName ? [ root ] : []).concat(typeof root.getElementsByTagName == "function" ? slice.call(root.getElementsByTagName(tagName)) : []);
  }
  function findClosestElementWithTagName(element, tagName) {
    if (typeof element.closest == "function") {
      return element.closest(tagName);
    } else {
      while (element) {
        if (element.tagName == tagName) {
          return element;
        } else {
          element = element.parentNode;
        }
      }
    }
  }
})();
;
/**
 * @license
 * Copyright 2017 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

/* globals self CriticalRequestChainRenderer SnippetRenderer Util URL */

/** @typedef {import('./dom.js')} DOM */

const URL_PREFIXES = ['http://', 'https://', 'data:'];

class DetailsRenderer {
  /**
   * @param {DOM} dom
   */
  constructor(dom) {
    /** @type {DOM} */
    this._dom = dom;
    /** @type {ParentNode} */
    this._templateContext; // eslint-disable-line no-unused-expressions
  }

  /**
   * @param {ParentNode} context
   */
  setTemplateContext(context) {
    this._templateContext = context;
  }

  /**
   * @param {LH.Audit.Details} details
   * @return {Element|null}
   */
  render(details) {
    switch (details.type) {
      case 'filmstrip':
        return this._renderFilmstrip(details);
      case 'list':
        return this._renderList(details);
      case 'table':
        return this._renderTable(details);
      case 'criticalrequestchain':
        return CriticalRequestChainRenderer.render(this._dom, this._templateContext, details);
      case 'opportunity':
        return this._renderTable(details);

      // Internal-only details, not for rendering.
      case 'screenshot':
      case 'diagnostic':
        return null;
      // Fallback for old LHRs, where no type meant don't render.
      case undefined:
        return null;

      default: {
        // @ts-ignore tsc thinks this unreachable, but ts-ignore for error message just in case.
        const detailsType = details.type;
        throw new Error(`Unknown type: ${detailsType}`);
      }
    }
  }

  /**
   * @param {{value: number, granularity?: number}} details
   * @return {Element}
   */
  _renderBytes(details) {
    // TODO: handle displayUnit once we have something other than 'kb'
    const value = Util.formatBytesToKB(details.value, details.granularity);
    return this._renderText(value);
  }

  /**
   * @param {{value: number, granularity?: number, displayUnit?: string}} details
   * @return {Element}
   */
  _renderMilliseconds(details) {
    let value = Util.formatMilliseconds(details.value, details.granularity);
    if (details.displayUnit === 'duration') {
      value = Util.formatDuration(details.value);
    }

    return this._renderText(value);
  }

  /**
   * @param {string} text
   * @return {HTMLElement}
   */
  _renderTextURL(text) {
    const url = text;

    let displayedPath;
    let displayedHost;
    let title;
    try {
      const parsed = Util.parseURL(url);
      displayedPath = parsed.file === '/' ? parsed.origin : parsed.file;
      displayedHost = parsed.file === '/' ? '' : `(${parsed.hostname})`;
      title = url;
    } catch (e) {
      displayedPath = url;
    }

    const element = this._dom.createElement('div', 'lh-text__url');
    element.appendChild(this._renderText(displayedPath));

    if (displayedHost) {
      const hostElem = this._renderText(displayedHost);
      hostElem.classList.add('lh-text__url-host');
      element.appendChild(hostElem);
    }

    if (title) element.title = url;
    return element;
  }

  /**
   * @param {LH.Audit.Details.LinkValue} details
   * @return {Element}
   */
  _renderLink(details) {
    const allowedProtocols = ['https:', 'http:'];
    const url = new URL(details.url);
    if (!allowedProtocols.includes(url.protocol)) {
      // Fall back to just the link text if protocol not allowed.
      return this._renderText(details.text);
    }

    const a = this._dom.createElement('a');
    a.rel = 'noopener';
    a.target = '_blank';
    a.textContent = details.text;
    a.href = url.href;

    return a;
  }

  /**
   * @param {string} text
   * @return {Element}
   */
  _renderText(text) {
    const element = this._dom.createElement('div', 'lh-text');
    element.textContent = text;
    return element;
  }

  /**
   * @param {string} text
   * @return {Element}
   */
  _renderNumeric(text) {
    const element = this._dom.createElement('div', 'lh-numeric');
    element.textContent = text;
    return element;
  }

  /**
   * Create small thumbnail with scaled down image asset.
   * @param {string} details
   * @return {Element}
   */
  _renderThumbnail(details) {
    const element = this._dom.createElement('img', 'lh-thumbnail');
    const strValue = details;
    element.src = strValue;
    element.title = strValue;
    element.alt = '';
    return element;
  }

  /**
   * Render a details item value for embedding in a table. Renders the value
   * based on the heading's valueType, unless the value itself has a `type`
   * property to override it.
   * @param {LH.Audit.Details.TableItem[string] | LH.Audit.Details.OpportunityItem[string]} value
   * @param {LH.Audit.Details.OpportunityColumnHeading} heading
   * @return {Element|null}
   */
  _renderTableValue(value, heading) {
    if (typeof value === 'undefined' || value === null) {
      return null;
    }

    // First deal with the possible object forms of value.
    if (typeof value === 'object') {
      // The value's type overrides the heading's for this column.
      switch (value.type) {
        case 'code': {
          return this._renderCode(value.value);
        }
        case 'link': {
          return this._renderLink(value);
        }
        case 'node': {
          return this.renderNode(value);
        }
        case 'url': {
          return this._renderTextURL(value.value);
        }
        default: {
          throw new Error(`Unknown valueType: ${value.type}`);
        }
      }
    }

    // Next, deal with primitives.
    switch (heading.valueType) {
      case 'bytes': {
        const numValue = Number(value);
        return this._renderBytes({value: numValue, granularity: 1});
      }
      case 'code': {
        const strValue = String(value);
        return this._renderCode(strValue);
      }
      case 'ms': {
        const msValue = {
          value: Number(value),
          granularity: heading.granularity,
          displayUnit: heading.displayUnit,
        };
        return this._renderMilliseconds(msValue);
      }
      case 'numeric': {
        const strValue = String(value);
        return this._renderNumeric(strValue);
      }
      case 'text': {
        const strValue = String(value);
        return this._renderText(strValue);
      }
      case 'thumbnail': {
        const strValue = String(value);
        return this._renderThumbnail(strValue);
      }
      case 'timespanMs': {
        const numValue = Number(value);
        return this._renderMilliseconds({value: numValue});
      }
      case 'url': {
        const strValue = String(value);
        if (URL_PREFIXES.some(prefix => strValue.startsWith(prefix))) {
          return this._renderTextURL(strValue);
        } else {
          // Fall back to <pre> rendering if not actually a URL.
          return this._renderCode(strValue);
        }
      }
      default: {
        throw new Error(`Unknown valueType: ${heading.valueType}`);
      }
    }
  }

  /**
   * Get the headings of a table-like details object, converted into the
   * OpportunityColumnHeading type until we have all details use the same
   * heading format.
   * @param {LH.Audit.Details.Table|LH.Audit.Details.Opportunity} tableLike
   * @return {Array<LH.Audit.Details.OpportunityColumnHeading>} header
   */
  _getCanonicalizedTableHeadings(tableLike) {
    if (tableLike.type === 'opportunity') {
      return tableLike.headings;
    }

    return tableLike.headings.map(heading => {
      return {
        key: heading.key,
        label: heading.text,
        valueType: heading.itemType,
        displayUnit: heading.displayUnit,
        granularity: heading.granularity,
      };
    });
  }

  /**
   * @param {LH.Audit.Details.Table|LH.Audit.Details.Opportunity} details
   * @return {Element}
   */
  _renderTable(details) {
    if (!details.items.length) return this._dom.createElement('span');

    const tableElem = this._dom.createElement('table', 'lh-table');
    const theadElem = this._dom.createChildOf(tableElem, 'thead');
    const theadTrElem = this._dom.createChildOf(theadElem, 'tr');

    const headings = this._getCanonicalizedTableHeadings(details);

    for (const heading of headings) {
      const valueType = heading.valueType || 'text';
      const classes = `lh-table-column--${valueType}`;
      const labelEl = this._dom.createElement('div', 'lh-text');
      labelEl.textContent = heading.label;
      this._dom.createChildOf(theadTrElem, 'th', classes).appendChild(labelEl);
    }

    const tbodyElem = this._dom.createChildOf(tableElem, 'tbody');
    for (const row of details.items) {
      const rowElem = this._dom.createChildOf(tbodyElem, 'tr');
      for (const heading of headings) {
        const value = row[heading.key];
        const valueElement = this._renderTableValue(value, heading);

        if (valueElement) {
          const classes = `lh-table-column--${heading.valueType}`;
          this._dom.createChildOf(rowElem, 'td', classes).appendChild(valueElement);
        } else {
          this._dom.createChildOf(rowElem, 'td', 'lh-table-column--empty');
        }
      }
    }
    return tableElem;
  }

  /**
   * @param {LH.Audit.Details.List} details
   * @returns {Element}
   */
  _renderList(details) {
    const listContainer = this._dom.createElement('div', 'lh-list');

    details.items.forEach(item => {
      const snippetEl = SnippetRenderer.render(this._dom, this._templateContext, item, this);
      listContainer.appendChild(snippetEl);
    });

    return listContainer;
  }

  /**
   * @param {LH.Audit.Details.NodeValue} item
   * @return {Element}
   * @protected
   */
  renderNode(item) {
    const element = this._dom.createElement('span', 'lh-node');
    if (item.snippet) {
      element.textContent = item.snippet;
    }
    if (item.selector) {
      element.title = item.selector;
    }
    if (item.path) element.setAttribute('data-path', item.path);
    if (item.selector) element.setAttribute('data-selector', item.selector);
    if (item.snippet) element.setAttribute('data-snippet', item.snippet);
    return element;
  }

  /**
   * @param {LH.Audit.Details.Filmstrip} details
   * @return {Element}
   */
  _renderFilmstrip(details) {
    const filmstripEl = this._dom.createElement('div', 'lh-filmstrip');

    for (const thumbnail of details.items) {
      const frameEl = this._dom.createChildOf(filmstripEl, 'div', 'lh-filmstrip__frame');
      this._dom.createChildOf(frameEl, 'img', 'lh-filmstrip__thumbnail', {
        src: `data:image/jpeg;base64,${thumbnail.data}`,
        alt: `Screenshot`,
      });
    }
    return filmstripEl;
  }

  /**
   * @param {string} text
   * @return {Element}
   */
  _renderCode(text) {
    const pre = this._dom.createElement('pre', 'lh-code');
    pre.textContent = text;
    return pre;
  }
}

if (typeof module !== 'undefined' && module.exports) {
  module.exports = DetailsRenderer;
} else {
  self.DetailsRenderer = DetailsRenderer;
}
;
/**
 * @license
 * Copyright 2017 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

/**
 * @fileoverview This file contains helpers for constructing and rendering the
 * critical request chains network tree.
 */

/* globals self Util */

/** @typedef {import('./dom.js')} DOM */

class CriticalRequestChainRenderer {
  /**
   * Create render context for critical-request-chain tree display.
   * @param {LH.Audit.SimpleCriticalRequestNode} tree
   * @return {{tree: LH.Audit.SimpleCriticalRequestNode, startTime: number, transferSize: number}}
   */
  static initTree(tree) {
    let startTime = 0;
    const rootNodes = Object.keys(tree);
    if (rootNodes.length > 0) {
      const node = tree[rootNodes[0]];
      startTime = node.request.startTime;
    }

    return {tree, startTime, transferSize: 0};
  }

  /**
   * Helper to create context for each critical-request-chain node based on its
   * parent. Calculates if this node is the last child, whether it has any
   * children itself and what the tree looks like all the way back up to the root,
   * so the tree markers can be drawn correctly.
   * @param {LH.Audit.SimpleCriticalRequestNode} parent
   * @param {string} id
   * @param {number} startTime
   * @param {number} transferSize
   * @param {Array<boolean>=} treeMarkers
   * @param {boolean=} parentIsLastChild
   * @return {CRCSegment}
   */
  static createSegment(parent, id, startTime, transferSize, treeMarkers, parentIsLastChild) {
    const node = parent[id];
    const siblings = Object.keys(parent);
    const isLastChild = siblings.indexOf(id) === (siblings.length - 1);
    const hasChildren = !!node.children && Object.keys(node.children).length > 0;

    // Copy the tree markers so that we don't change by reference.
    const newTreeMarkers = Array.isArray(treeMarkers) ? treeMarkers.slice(0) : [];

    // Add on the new entry.
    if (typeof parentIsLastChild !== 'undefined') {
      newTreeMarkers.push(!parentIsLastChild);
    }

    return {
      node,
      isLastChild,
      hasChildren,
      startTime,
      transferSize: transferSize + node.request.transferSize,
      treeMarkers: newTreeMarkers,
    };
  }

  /**
   * Creates the DOM for a tree segment.
   * @param {DOM} dom
   * @param {DocumentFragment} tmpl
   * @param {CRCSegment} segment
   * @return {Node}
   */
  static createChainNode(dom, tmpl, segment) {
    const chainsEl = dom.cloneTemplate('#tmpl-lh-crc__chains', tmpl);

    // Hovering over request shows full URL.
    dom.find('.crc-node', chainsEl).setAttribute('title', segment.node.request.url);

    const treeMarkeEl = dom.find('.crc-node__tree-marker', chainsEl);

    // Construct lines and add spacers for sub requests.
    segment.treeMarkers.forEach(separator => {
      if (separator) {
        treeMarkeEl.appendChild(dom.createElement('span', 'tree-marker vert'));
        treeMarkeEl.appendChild(dom.createElement('span', 'tree-marker'));
      } else {
        treeMarkeEl.appendChild(dom.createElement('span', 'tree-marker'));
        treeMarkeEl.appendChild(dom.createElement('span', 'tree-marker'));
      }
    });

    if (segment.isLastChild) {
      treeMarkeEl.appendChild(dom.createElement('span', 'tree-marker up-right'));
      treeMarkeEl.appendChild(dom.createElement('span', 'tree-marker right'));
    } else {
      treeMarkeEl.appendChild(dom.createElement('span', 'tree-marker vert-right'));
      treeMarkeEl.appendChild(dom.createElement('span', 'tree-marker right'));
    }

    if (segment.hasChildren) {
      treeMarkeEl.appendChild(dom.createElement('span', 'tree-marker horiz-down'));
    } else {
      treeMarkeEl.appendChild(dom.createElement('span', 'tree-marker right'));
    }

    // Fill in url, host, and request size information.
    const {file, hostname} = Util.parseURL(segment.node.request.url);
    const treevalEl = dom.find('.crc-node__tree-value', chainsEl);
    dom.find('.crc-node__tree-file', treevalEl).textContent = `${file}`;
    dom.find('.crc-node__tree-hostname', treevalEl).textContent = hostname ? `(${hostname})` : '';

    if (!segment.hasChildren) {
      const {startTime, endTime, transferSize} = segment.node.request;
      const span = dom.createElement('span', 'crc-node__chain-duration');
      span.textContent = ' - ' + Util.formatMilliseconds((endTime - startTime) * 1000) + ', ';
      const span2 = dom.createElement('span', 'crc-node__chain-duration');
      span2.textContent = Util.formatBytesToKB(transferSize, 0.01);

      treevalEl.appendChild(span);
      treevalEl.appendChild(span2);
    }

    return chainsEl;
  }

  /**
   * Recursively builds a tree from segments.
   * @param {DOM} dom
   * @param {DocumentFragment} tmpl
   * @param {CRCSegment} segment
   * @param {Element} elem Parent element.
   * @param {LH.Audit.Details.CriticalRequestChain} details
   */
  static buildTree(dom, tmpl, segment, elem, details) {
    elem.appendChild(CriticalRequestChainRenderer.createChainNode(dom, tmpl, segment));
    if (segment.node.children) {
      for (const key of Object.keys(segment.node.children)) {
        const childSegment = CriticalRequestChainRenderer.createSegment(segment.node.children, key,
          segment.startTime, segment.transferSize, segment.treeMarkers, segment.isLastChild);
        CriticalRequestChainRenderer.buildTree(dom, tmpl, childSegment, elem, details);
      }
    }
  }

  /**
   * @param {DOM} dom
   * @param {ParentNode} templateContext
   * @param {LH.Audit.Details.CriticalRequestChain} details
   * @return {Element}
   */
  static render(dom, templateContext, details) {
    const tmpl = dom.cloneTemplate('#tmpl-lh-crc', templateContext);
    const containerEl = dom.find('.lh-crc', tmpl);

    // Fill in top summary.
    dom.find('.crc-initial-nav', tmpl).textContent = Util.UIStrings.crcInitialNavigation;
    dom.find('.lh-crc__longest_duration_label', tmpl).textContent =
        Util.UIStrings.crcLongestDurationLabel;
    dom.find('.lh-crc__longest_duration', tmpl).textContent =
        Util.formatMilliseconds(details.longestChain.duration);

    // Construct visual tree.
    const root = CriticalRequestChainRenderer.initTree(details.chains);
    for (const key of Object.keys(root.tree)) {
      const segment = CriticalRequestChainRenderer.createSegment(root.tree, key,
          root.startTime, root.transferSize);
      CriticalRequestChainRenderer.buildTree(dom, tmpl, segment, containerEl, details);
    }

    return dom.find('.lh-crc-container', tmpl);
  }
}

// Allow Node require()'ing.
if (typeof module !== 'undefined' && module.exports) {
  module.exports = CriticalRequestChainRenderer;
} else {
  self.CriticalRequestChainRenderer = CriticalRequestChainRenderer;
}

/** @typedef {{
      node: LH.Audit.SimpleCriticalRequestNode[string],
      isLastChild: boolean,
      hasChildren: boolean,
      startTime: number,
      transferSize: number,
      treeMarkers: Array<boolean>
  }} CRCSegment
 */
;
/**
 * @license Copyright 2019 Google Inc. All Rights Reserved.
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
 */
'use strict';

/* globals self, Util */

/** @typedef {import('./details-renderer')} DetailsRenderer */

/** @enum {number} */
const LineVisibility = {
  /** Show regardless of whether the snippet is collapsed or expanded */
  ALWAYS: 0,
  WHEN_COLLAPSED: 1,
  WHEN_EXPANDED: 2,
};

/** @enum {number} */
const LineContentType = {
  /** A line of content */
  CONTENT_NORMAL: 0,
  /** A line of content that's emphasized by setting the CSS background color */
  CONTENT_HIGHLIGHTED: 1,
  /** Use when some lines are hidden, shows the "..." placeholder */
  PLACEHOLDER: 2,
  /** A message about a line of content or the snippet in general */
  MESSAGE: 3,
};

/** @typedef {{
    content: string;
    lineNumber: string | number;
    contentType: LineContentType;
    truncated?: boolean;
    visibility?: LineVisibility;
}} LineDetails */

const classNamesByContentType = {
  [LineContentType.CONTENT_NORMAL]: ['lh-snippet__line--content'],
  [LineContentType.CONTENT_HIGHLIGHTED]: [
    'lh-snippet__line--content',
    'lh-snippet__line--content-highlighted',
  ],
  [LineContentType.PLACEHOLDER]: ['lh-snippet__line--placeholder'],
  [LineContentType.MESSAGE]: ['lh-snippet__line--message'],
};

/**
 * @param {LH.Audit.Details.SnippetValue['lines']} lines
 * @param {number} lineNumber
 * @return {{line?: LH.Audit.Details.SnippetValue['lines'][0], previousLine?: LH.Audit.Details.SnippetValue['lines'][0]}}
 */
function getLineAndPreviousLine(lines, lineNumber) {
  return {
    line: lines.find(l => l.lineNumber === lineNumber),
    previousLine: lines.find(l => l.lineNumber === lineNumber - 1),
  };
}

/**
 * @param {LH.Audit.Details.SnippetValue["lineMessages"]} messages
 * @param {number} lineNumber
 */
function getMessagesForLineNumber(messages, lineNumber) {
  return messages.filter(h => h.lineNumber === lineNumber);
}

/**
 * @param {LH.Audit.Details.SnippetValue} details
 * @returns {LH.Audit.Details.SnippetValue['lines']}
 */
function getLinesWhenCollapsed(details) {
  const SURROUNDING_LINES_TO_SHOW_WHEN_COLLAPSED = 2;
  return Util.filterRelevantLines(
    details.lines,
    details.lineMessages,
    SURROUNDING_LINES_TO_SHOW_WHEN_COLLAPSED
  );
}

/**
 * Render snippet of text with line numbers and annotations.
 * By default we only show a few lines around each annotation and the user
 * can click "Expand snippet" to show more.
 * Content lines with annotations are highlighted.
 */
class SnippetRenderer {
  /**
   * @param {DOM} dom
   * @param {DocumentFragment} tmpl
   * @param {LH.Audit.Details.SnippetValue} details
   * @param {DetailsRenderer} detailsRenderer
   * @param {function} toggleExpandedFn
   * @return {DocumentFragment}
   */
  static renderHeader(dom, tmpl, details, detailsRenderer, toggleExpandedFn) {
    const linesWhenCollapsed = getLinesWhenCollapsed(details);
    const canExpand = linesWhenCollapsed.length < details.lines.length;

    const header = dom.cloneTemplate('#tmpl-lh-snippet__header', tmpl);
    dom.find('.lh-snippet__title', header).textContent = details.title;

    const {
      snippetCollapseButtonLabel,
      snippetExpandButtonLabel,
    } = Util.UIStrings;
    dom.find(
      '.lh-snippet__btn-label-collapse',
      header
    ).textContent = snippetCollapseButtonLabel;
    dom.find(
      '.lh-snippet__btn-label-expand',
      header
    ).textContent = snippetExpandButtonLabel;

    const toggleExpandButton = dom.find('.lh-snippet__toggle-expand', header);
    // If we're already showing all the available lines of the snippet, we don't need an
    // expand/collapse button and can remove it from the DOM.
    // If we leave the button in though, wire up the click listener to toggle visibility!
    if (!canExpand) {
      toggleExpandButton.remove();
    } else {
      toggleExpandButton.addEventListener('click', () => toggleExpandedFn());
    }

    // We only show the source node of the snippet in DevTools because then the user can
    // access the full element detail. Just being able to see the outer HTML isn't very useful.
    if (details.node && dom.isDevTools()) {
      const nodeContainer = dom.find('.lh-snippet__node', header);
      nodeContainer.appendChild(detailsRenderer.renderNode(details.node));
    }

    return header;
  }

  /**
   * Renders a line (text content, message, or placeholder) as a DOM element.
   * @param {DOM} dom
   * @param {DocumentFragment} tmpl
   * @param {LineDetails} lineDetails
   * @return {Element}
   */
  static renderSnippetLine(
      dom,
      tmpl,
      {content, lineNumber, truncated, contentType, visibility}
  ) {
    const clonedTemplate = dom.cloneTemplate('#tmpl-lh-snippet__line', tmpl);
    const contentLine = dom.find('.lh-snippet__line', clonedTemplate);
    const {classList} = contentLine;

    classNamesByContentType[contentType].forEach(typeClass =>
      classList.add(typeClass)
    );

    if (visibility === LineVisibility.WHEN_COLLAPSED) {
      classList.add('lh-snippet__show-if-collapsed');
    } else if (visibility === LineVisibility.WHEN_EXPANDED) {
      classList.add('lh-snippet__show-if-expanded');
    }

    const lineContent = content + (truncated ? '…' : '');
    const lineContentEl = dom.find('.lh-snippet__line code', contentLine);
    if (contentType === LineContentType.MESSAGE) {
      lineContentEl.appendChild(dom.convertMarkdownLinkSnippets(lineContent));
    } else {
      lineContentEl.textContent = lineContent;
    }

    dom.find(
      '.lh-snippet__line-number',
      contentLine
    ).textContent = lineNumber.toString();

    return contentLine;
  }

  /**
   * @param {DOM} dom
   * @param {DocumentFragment} tmpl
   * @param {{message: string}} message
   * @return {Element}
   */
  static renderMessage(dom, tmpl, message) {
    return SnippetRenderer.renderSnippetLine(dom, tmpl, {
      lineNumber: ' ',
      content: message.message,
      contentType: LineContentType.MESSAGE,
    });
  }

  /**
   * @param {DOM} dom
   * @param {DocumentFragment} tmpl
   * @param {LineVisibility} visibility
   * @return {Element}
   */
  static renderOmittedLinesPlaceholder(dom, tmpl, visibility) {
    return SnippetRenderer.renderSnippetLine(dom, tmpl, {
      lineNumber: '…',
      content: '',
      visibility,
      contentType: LineContentType.PLACEHOLDER,
    });
  }

  /**
   * @param {DOM} dom
   * @param {DocumentFragment} tmpl
   * @param {LH.Audit.Details.SnippetValue} details
   * @return {DocumentFragment}
   */
  static renderSnippetContent(dom, tmpl, details) {
    const template = dom.cloneTemplate('#tmpl-lh-snippet__content', tmpl);
    const snippetEl = dom.find('.lh-snippet__snippet-inner', template);

    // First render messages that don't belong to specific lines
    details.generalMessages.forEach(m =>
      snippetEl.append(SnippetRenderer.renderMessage(dom, tmpl, m))
    );
    // Then render the lines and their messages, as well as placeholders where lines are omitted
    snippetEl.append(SnippetRenderer.renderSnippetLines(dom, tmpl, details));

    return template;
  }

  /**
   * @param {DOM} dom
   * @param {DocumentFragment} tmpl
   * @param {LH.Audit.Details.SnippetValue} details
   * @returns {DocumentFragment}
   */
  static renderSnippetLines(dom, tmpl, details) {
    const {lineMessages, generalMessages, lineCount, lines} = details;
    const linesWhenCollapsed = getLinesWhenCollapsed(details);
    const hasOnlyGeneralMessages =
      generalMessages.length > 0 && lineMessages.length === 0;

    const lineContainer = dom.createFragment();

    // When a line is not shown in the collapsed state we try to see if we also need an
    // omitted lines placeholder for the expanded state, rather than rendering two separate
    // placeholders.
    let hasPendingOmittedLinesPlaceholderForCollapsedState = false;

    for (let lineNumber = 1; lineNumber <= lineCount; lineNumber++) {
      const {line, previousLine} = getLineAndPreviousLine(lines, lineNumber);
      const {
        line: lineWhenCollapsed,
        previousLine: previousLineWhenCollapsed,
      } = getLineAndPreviousLine(linesWhenCollapsed, lineNumber);

      const showLineWhenCollapsed = !!lineWhenCollapsed;
      const showPreviousLineWhenCollapsed = !!previousLineWhenCollapsed;

      // If we went from showing lines in the collapsed state to not showing them
      // we need to render a placeholder
      if (showPreviousLineWhenCollapsed && !showLineWhenCollapsed) {
        hasPendingOmittedLinesPlaceholderForCollapsedState = true;
      }
      // If we are back to lines being visible in the collapsed and the placeholder
      // hasn't been rendered yet then render it now
      if (
        showLineWhenCollapsed &&
        hasPendingOmittedLinesPlaceholderForCollapsedState
      ) {
        lineContainer.append(
          SnippetRenderer.renderOmittedLinesPlaceholder(
            dom,
            tmpl,
            LineVisibility.WHEN_COLLAPSED
          )
        );
        hasPendingOmittedLinesPlaceholderForCollapsedState = false;
      }

      // Render omitted lines placeholder if we have not already rendered one for this gap
      const isFirstOmittedLineWhenExpanded = !line && !!previousLine;
      const isFirstLineOverallAndIsOmittedWhenExpanded =
        !line && lineNumber === 1;
      if (
        isFirstOmittedLineWhenExpanded ||
        isFirstLineOverallAndIsOmittedWhenExpanded
      ) {
        // In the collapsed state we don't show omitted lines placeholders around
        // the edges of the snippet
        const hasRenderedAllLinesVisibleWhenCollapsed = !linesWhenCollapsed.some(
          l => l.lineNumber > lineNumber
        );
        const onlyShowWhenExpanded =
          hasRenderedAllLinesVisibleWhenCollapsed || lineNumber === 1;
        lineContainer.append(
          SnippetRenderer.renderOmittedLinesPlaceholder(
            dom,
            tmpl,
            onlyShowWhenExpanded
              ? LineVisibility.WHEN_EXPANDED
              : LineVisibility.ALWAYS
          )
        );
        hasPendingOmittedLinesPlaceholderForCollapsedState = false;
      }

      if (!line) {
        // Can't render the line if we don't know its content (instead we've rendered a placeholder)
        continue;
      }

      // Now render the line and any messages
      const messages = getMessagesForLineNumber(lineMessages, lineNumber);
      const highlightLine = messages.length > 0 || hasOnlyGeneralMessages;
      const contentLineDetails = Object.assign({}, line, {
        contentType: highlightLine
          ? LineContentType.CONTENT_HIGHLIGHTED
          : LineContentType.CONTENT_NORMAL,
        visibility: lineWhenCollapsed
          ? LineVisibility.ALWAYS
          : LineVisibility.WHEN_EXPANDED,
      });
      lineContainer.append(
        SnippetRenderer.renderSnippetLine(dom, tmpl, contentLineDetails)
      );

      messages.forEach(message => {
        lineContainer.append(SnippetRenderer.renderMessage(dom, tmpl, message));
      });
    }

    return lineContainer;
  }

  /**
   * @param {DOM} dom
   * @param {ParentNode} templateContext
   * @param {LH.Audit.Details.SnippetValue} details
   * @param {DetailsRenderer} detailsRenderer
   * @return {Element}
   */
  static render(dom, templateContext, details, detailsRenderer) {
    const tmpl = dom.cloneTemplate('#tmpl-lh-snippet', templateContext);
    const snippetEl = dom.find('.lh-snippet', tmpl);

    const header = SnippetRenderer.renderHeader(
      dom,
      tmpl,
      details,
      detailsRenderer,
      () => snippetEl.classList.toggle('lh-snippet--expanded')
    );
    const content = SnippetRenderer.renderSnippetContent(dom, tmpl, details);
    snippetEl.append(header, content);

    return snippetEl;
  }
}

// Allow Node require()'ing.
if (typeof module !== 'undefined' && module.exports) {
  module.exports = SnippetRenderer;
} else {
  self.SnippetRenderer = SnippetRenderer;
}
;
/**
 * @license Copyright 2017 Google Inc. All Rights Reserved.
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at http://www.apache.org/licenses/LICENSE-2.0
 * Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
 */
'use strict';

/* global URL */

/**
 * @fileoverview
 * @suppress {reportUnknownTypes}
 */

/**
 * Generate a filenamePrefix of hostname_YYYY-MM-DD_HH-MM-SS
 * Date/time uses the local timezone, however Node has unreliable ICU
 * support, so we must construct a YYYY-MM-DD date format manually. :/
 * @param {{finalUrl: string, fetchTime: string}} lhr
 * @return {string}
 */
function getFilenamePrefix(lhr) {
  const hostname = new (getUrlConstructor())(lhr.finalUrl).hostname;
  const date = (lhr.fetchTime && new Date(lhr.fetchTime)) || new Date();

  const timeStr = date.toLocaleTimeString('en-US', {hour12: false});
  const dateParts = date.toLocaleDateString('en-US', {
    year: 'numeric', month: '2-digit', day: '2-digit',
  }).split('/');
  // @ts-ignore - parts exists
  dateParts.unshift(dateParts.pop());
  const dateStr = dateParts.join('-');

  const filenamePrefix = `${hostname}_${dateStr}_${timeStr}`;
  // replace characters that are unfriendly to filenames
  return filenamePrefix.replace(/[/?<>\\:*|":]/g, '-');
}

function getUrlConstructor() {
  if (typeof module !== 'undefined' && module.exports) {
    return require('./url-shim');
  } else {
    return URL;
  }
}

// don't attempt to export in the browser.
if (typeof module !== 'undefined' && module.exports) {
  module.exports = {getFilenamePrefix};
}
;
/**
 * @license
 * Copyright 2017 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

/**
 * Logs messages via a UI butter.
 */
class Logger {
  /**
   * @param {Element} element
   */
  constructor(element) {
    /** @type {Element} */
    this.el = element;
    this._id = undefined;
  }

  /**
   * Shows a butter bar.
   * @param {string} msg The message to show.
   * @param {boolean=} autoHide True to hide the message after a duration.
   *     Default is true.
   */
  log(msg, autoHide = true) {
    this._id && clearTimeout(this._id);

    this.el.textContent = msg;
    this.el.classList.add('show');
    if (autoHide) {
      this._id = setTimeout(_ => {
        this.el.classList.remove('show');
      }, 7000);
    }
  }

  /**
   * @param {string} msg
   */
  warn(msg) {
    this.log('Warning: ' + msg);
  }

  /**
   * @param {string} msg
   */
  error(msg) {
    this.log(msg);

    // Rethrow to make sure it's auditable as an error, but in a setTimeout so page
    // recovers gracefully and user can try loading a report again.
    setTimeout(_ => {
      throw new Error(msg);
    }, 0);
  }

  /**
   * Explicitly hides the butter bar.
   */
  hide() {
    this._id && clearTimeout(this._id);
    this.el.classList.remove('show');
  }
}

if (typeof module !== 'undefined' && module.exports) {
  module.exports = Logger;
}
;
/**
 * @license
 * Copyright 2017 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

/**
 * @fileoverview Adds export button, print, and other dynamic functionality to
 * the report.
 */

/* globals self URL Blob CustomEvent getFilenamePrefix window */

/** @typedef {import('./dom.js')} DOM */

class ReportUIFeatures {
  /**
   * @param {DOM} dom
   */
  constructor(dom) {
    /** @type {LH.Result} */
    this.json; // eslint-disable-line no-unused-expressions
    /** @type {DOM} */
    this._dom = dom;
    /** @type {Document} */
    this._document = this._dom.document();
    /** @type {boolean} */
    this._copyAttempt = false;
    /** @type {HTMLElement} */
    this.exportButton; // eslint-disable-line no-unused-expressions
    /** @type {HTMLElement} */
    this.headerSticky; // eslint-disable-line no-unused-expressions
    /** @type {HTMLElement} */
    this.headerBackground; // eslint-disable-line no-unused-expressions
    /** @type {HTMLElement} */
    this.headerContent; // eslint-disable-line no-unused-expressions
    /** @type {HTMLElement} */
    this.lighthouseIcon; // eslint-disable-line no-unused-expressions
    /** @type {!HTMLElement} */
    this.scoresWrapperBg; // eslint-disable-line no-unused-expressions
    /** @type {!HTMLElement} */
    this.productInfo; // eslint-disable-line no-unused-expressions
    /** @type {HTMLElement} */
    this.toolbar; // eslint-disable-line no-unused-expressions
    /** @type {HTMLElement} */
    this.toolbarMetadata; // eslint-disable-line no-unused-expressions
    /** @type {HTMLElement} */
    this.env; // eslint-disable-line no-unused-expressions
    /** @type {number} */
    this.headerOverlap = 0;
    /** @type {number} */
    this.headerHeight = 0;
    /** @type {number} */
    this.latestKnownScrollY = 0;
    /** @type {boolean} */
    this.isAnimatingHeader = false;

    this.onMediaQueryChange = this.onMediaQueryChange.bind(this);
    this.onCopy = this.onCopy.bind(this);
    this.onExportButtonClick = this.onExportButtonClick.bind(this);
    this.onExport = this.onExport.bind(this);
    this.onKeyDown = this.onKeyDown.bind(this);
    this.printShortCutDetect = this.printShortCutDetect.bind(this);
    this.onScroll = this.onScroll.bind(this);
    this.onChevronClick = this.onChevronClick.bind(this);
  }

  /**
   * Adds export button, print, and other functionality to the report. The method
   * should be called whenever the report needs to be re-rendered.
   * @param {LH.Result} report
   */
  initFeatures(report) {
    if (this._dom.isDevTools()) return;

    this.json = report;
    this._setupMediaQueryListeners();
    this._setupExportButton();
    this._setUpCollapseDetailsAfterPrinting();
    this._setupHeaderAnimation();
    this._resetUIState();
    this._document.addEventListener('keydown', this.printShortCutDetect);
    this._document.addEventListener('copy', this.onCopy);
  }

  /**
   * Fires a custom DOM event on target.
   * @param {string} name Name of the event.
   * @param {Node=} target DOM node to fire the event on.
   * @param {*=} detail Custom data to include.
   */
  _fireEventOn(name, target = this._document, detail) {
    const event = new CustomEvent(name, detail ? {detail} : undefined);
    target.dispatchEvent(event);
  }

  _setupMediaQueryListeners() {
    const mediaQuery = self.matchMedia('(max-width: 500px)');
    mediaQuery.addListener(this.onMediaQueryChange);
    // Ensure the handler is called on init
    this.onMediaQueryChange(mediaQuery);
  }

  /**
   * Handle media query change events.
   * @param {MediaQueryList|MediaQueryListEvent} mql
   */
  onMediaQueryChange(mql) {
    const root = this._dom.find('.lh-root', this._document);
    root.classList.toggle('lh-narrow', mql.matches);
  }

  _setupExportButton() {
    this.exportButton = this._dom.find('.lh-export__button', this._document);
    this.exportButton.addEventListener('click', this.onExportButtonClick);

    const dropdown = this._dom.find('.lh-export__dropdown', this._document);
    dropdown.addEventListener('click', this.onExport);
  }

  _setupHeaderAnimation() {
    const scoresWrapper = this._dom.find('.lh-scores-wrapper', this._document);
    const computedMarginTop = window.getComputedStyle(scoresWrapper).marginTop;
    this.headerOverlap = parseFloat(computedMarginTop || '0');
    this.headerSticky = this._dom.find('.lh-header-sticky', this._document);
    this.headerBackground = this._dom.find('.lh-header-bg', this._document);
    this.headerContent = this._dom.find('.lh-header', this._document);
    this.lighthouseIcon = this._dom.find('.lh-lighthouse', this._document);
    this.scoresWrapperBg = this._dom.find('.lh-scores-wrapper__background', this._document);
    this.productInfo = this._dom.find('.lh-product-info', this._document);
    this.toolbar = this._dom.find('.lh-toolbar', this._document);
    this.toolbarMetadata = this._dom.find('.lh-toolbar__metadata', this._document);
    const computedHeight = window.getComputedStyle(this.headerBackground).height;
    this.headerHeight = parseFloat(computedHeight || '0');

    this._document.addEventListener('scroll', this.onScroll, {passive: true});

    const toolbarChevron = this._dom.find('.lh-toggle-arrow', this.toolbar);
    toolbarChevron.addEventListener('click', this.onChevronClick);
  }

  /**
   * Handle copy events.
   * @param {ClipboardEvent} e
   */
  onCopy(e) {
    // Only handle copy button presses (e.g. ignore the user copying page text).
    if (this._copyAttempt) {
      // We want to write our own data to the clipboard, not the user's text selection.
      e.preventDefault();
      e.clipboardData.setData('text/plain', JSON.stringify(this.json, null, 2));

      this._fireEventOn('lh-log', this._document, {
        cmd: 'log', msg: 'Report JSON copied to clipboard',
      });
    }

    this._copyAttempt = false;
  }

  /**
   * Copies the report JSON to the clipboard (if supported by the browser).
   */
  onCopyButtonClick() {
    this._fireEventOn('lh-analytics', this._document, {
      cmd: 'send',
      fields: {hitType: 'event', eventCategory: 'report', eventAction: 'copy'},
    });

    try {
      if (this._document.queryCommandSupported('copy')) {
        this._copyAttempt = true;

        // Note: In Safari 10.0.1, execCommand('copy') returns true if there's
        // a valid text selection on the page. See http://caniuse.com/#feat=clipboard.
        if (!this._document.execCommand('copy')) {
          this._copyAttempt = false; // Prevent event handler from seeing this as a copy attempt.

          this._fireEventOn('lh-log', this._document, {
            cmd: 'warn', msg: 'Your browser does not support copy to clipboard.',
          });
        }
      }
    } catch (/** @type {Error} */ e) {
      this._copyAttempt = false;
      this._fireEventOn('lh-log', this._document, {cmd: 'log', msg: e.message});
    }
  }

  onScroll() {
    this.latestKnownScrollY = window.scrollY;

    if (!this.isAnimatingHeader) {
      window.requestAnimationFrame(this.animateHeader.bind(this));
    }
    this.isAnimatingHeader = true;
  }

  onChevronClick() {
    const toggle = this._dom.find('.lh-config__settings-toggle', this._document);

    if (toggle.hasAttribute('open')) {
      toggle.removeAttribute('open');
    } else {
      toggle.setAttribute('open', 'true');
    }
  }

  animateHeader() {
    const collapsedHeaderHeight = 50;
    const heightDiff = this.headerHeight - collapsedHeaderHeight + this.headerOverlap;
    const scrollPct = Math.max(0, Math.min(1,
      this.latestKnownScrollY / (this.headerHeight - collapsedHeaderHeight)));

    const scoresContainer = /** @type {HTMLElement} */ (this.scoresWrapperBg.parentElement);

    this.headerSticky.style.transform = `translateY(${heightDiff * scrollPct * -1}px)`;
    this.headerBackground.style.transform = `translateY(${scrollPct * this.headerOverlap}px)`;
    this.lighthouseIcon.style.transform =
      `translate3d(0,` +
      `-${scrollPct * this.headerOverlap * -1}px, 0) scale(${1 - scrollPct})`;
    this.headerContent.style.opacity = (1 - scrollPct).toString();

    // Switch up the score background & shadows
    this.scoresWrapperBg.style.opacity = (1 - scrollPct).toString();
    this.scoresWrapperBg.style.transform = `scaleY(${1 - scrollPct * 0.2})`;
    const scoreShadow = this._dom.find('.lh-scores-wrapper__shadow', scoresContainer);
    scoreShadow.style.opacity = scrollPct.toString();
    scoreShadow.style.transform = `scaleY(${1 - scrollPct * 0.2})`;

    // Fade & move the scorescale
    try {
      const scoreScalePositionDelta = 32;
      const scoreScale = this._dom.find('.lh-scorescale', scoresContainer);
      scoreScale.style.opacity = `${1 - scrollPct}`;
      scoreScale.style.transform = `translateY(${scrollPct * -scoreScalePositionDelta}px)`;
    } catch (e) {}

    // Move the toolbar & export
    this.toolbar.style.transform = `translateY(${heightDiff * scrollPct}px)`;
    const exportParent = this.exportButton.parentElement;
    if (exportParent) {
      exportParent.style.transform = `translateY(${heightDiff * scrollPct}px)`;
    }
    this.exportButton.style.transform = `scale(${1 - 0.2 * scrollPct})`;
    // Start showing the productinfo when we are at the 50% mark of our animation
    const opacity = scrollPct < 0.5 ? 0 : (scrollPct - 0.5) * 2;
    this.productInfo.style.opacity = this.toolbarMetadata.style.opacity = opacity.toString();

    this.isAnimatingHeader = false;
  }

  closeExportDropdown() {
    this.exportButton.classList.remove('active');
  }

  /**
   * Click handler for export button.
   * @param {Event} e
   */
  onExportButtonClick(e) {
    e.preventDefault();
    const el = /** @type {Element} */ (e.target);
    el.classList.toggle('active');
    this._document.addEventListener('keydown', this.onKeyDown);
  }

  /**
   * Resets the state of page before capturing the page for export.
   * When the user opens the exported HTML page, certain UI elements should
   * be in their closed state (not opened) and the templates should be unstamped.
   */
  _resetUIState() {
    this.closeExportDropdown();
    this._dom.resetTemplates();
  }

  /**
   * Handler for "export as" button.
   * @param {Event} e
   */
  onExport(e) {
    e.preventDefault();

    const el = /** @type {?Element} */ (e.target);

    if (!el || !el.hasAttribute('data-action')) {
      return;
    }

    switch (el.getAttribute('data-action')) {
      case 'copy':
        this.onCopyButtonClick();
        break;
      case 'print-summary':
        this.collapseAllDetails();
        this.closeExportDropdown();
        self.print();
        break;
      case 'print-expanded':
        this.expandAllDetails();
        this.closeExportDropdown();
        self.print();
        break;
      case 'save-json': {
        const jsonStr = JSON.stringify(this.json, null, 2);
        this._saveFile(new Blob([jsonStr], {type: 'application/json'}));
        break;
      }
      case 'save-html': {
        const htmlStr = this.getReportHtml();
        try {
          this._saveFile(new Blob([htmlStr], {type: 'text/html'}));
        } catch (/** @type {Error} */ e) {
          this._fireEventOn('lh-log', this._document, {
            cmd: 'error', msg: 'Could not export as HTML. ' + e.message,
          });
        }
        break;
      }
      case 'open-viewer': {
        const viewerPath = '/lighthouse/viewer/';
        ReportUIFeatures.openTabAndSendJsonReport(this.json, viewerPath);
        break;
      }
      case 'save-gist': {
        this.saveAsGist();
        break;
      }
    }

    this.closeExportDropdown();
    this._document.removeEventListener('keydown', this.onKeyDown);
  }

  /**
   * Keydown handler for the document.
   * @param {KeyboardEvent} e
   */
  onKeyDown(e) {
    if (e.keyCode === 27) { // ESC
      this.closeExportDropdown();
    }
  }

  /**
   * Opens a new tab to the online viewer and sends the local page's JSON results
   * to the online viewer using postMessage.
   * @param {LH.Result} reportJson
   * @param {string} viewerPath
   * @protected
   */
  static openTabAndSendJsonReport(reportJson, viewerPath) {
    const VIEWER_ORIGIN = 'https://googlechrome.github.io';
    // Chrome doesn't allow us to immediately postMessage to a popup right
    // after it's created. Normally, we could also listen for the popup window's
    // load event, however it is cross-domain and won't fire. Instead, listen
    // for a message from the target app saying "I'm open".
    const json = reportJson;
    window.addEventListener('message', function msgHandler(messageEvent) {
      if (messageEvent.origin !== VIEWER_ORIGIN) {
        return;
      }
      if (popup && messageEvent.data.opened) {
        popup.postMessage({lhresults: json}, VIEWER_ORIGIN);
        window.removeEventListener('message', msgHandler);
      }
    });

    // The popup's window.name is keyed by version+url+fetchTime, so we reuse/select tabs correctly
    // @ts-ignore - If this is a v2 LHR, use old `generatedTime`.
    const fallbackFetchTime = /** @type {string} */ (json.generatedTime);
    const fetchTime = json.fetchTime || fallbackFetchTime;
    const windowName = `${json.lighthouseVersion}-${json.requestedUrl}-${fetchTime}`;
    const popup = window.open(`${VIEWER_ORIGIN}${viewerPath}`, windowName);
  }

  /**
   * Expands audit details when user prints via keyboard shortcut.
   * @param {KeyboardEvent} e
   */
  printShortCutDetect(e) {
    if ((e.ctrlKey || e.metaKey) && e.keyCode === 80) { // Ctrl+P
      this.closeExportDropdown();
    }
  }

  /**
   * Expands all audit `<details>`.
   * Ideally, a print stylesheet could take care of this, but CSS has no way to
   * open a `<details>` element.
   */
  expandAllDetails() {
    const details = /** @type {Array<HTMLDetailsElement>} */ (this._dom.findAll(
        '.lh-categories details', this._document));
    details.map(detail => detail.open = true);
  }

  /**
   * Collapses all audit `<details>`.
   * open a `<details>` element.
   */
  collapseAllDetails() {
    const details = /** @type {Array<HTMLDetailsElement>} */ (this._dom.findAll(
        '.lh-categories details', this._document));
    details.map(detail => detail.open = false);
  }

  /**
   * Sets up listeners to collapse audit `<details>` when the user closes the
   * print dialog, all `<details>` are collapsed.
   */
  _setUpCollapseDetailsAfterPrinting() {
    // FF and IE implement these old events.
    if ('onbeforeprint' in self) {
      self.addEventListener('afterprint', this.collapseAllDetails);
    } else {
      const win = /** @type {Window} */ (self);
      // Note: FF implements both window.onbeforeprint and media listeners. However,
      // it doesn't matchMedia doesn't fire when matching 'print'.
      win.matchMedia('print').addListener(mql => {
        if (mql.matches) {
          this.expandAllDetails();
        } else {
          this.collapseAllDetails();
        }
      });
    }
  }

  /**
   * Returns the html that recreates this report.
   * @return {string}
   * @protected
   */
  getReportHtml() {
    this._resetUIState();
    return this._document.documentElement.outerHTML;
  }

  /**
   * Save json as a gist. Unimplemented in base UI features.
   * @protected
   */
  saveAsGist() {
    throw new Error('Cannot save as gist from base report');
  }

  /**
   * Downloads a file (blob) using a[download].
   * @param {Blob|File} blob The file to save.
   * @private
   */
  _saveFile(blob) {
    const filename = getFilenamePrefix({
      finalUrl: this.json.finalUrl,
      fetchTime: this.json.fetchTime,
    });

    const ext = blob.type.match('json') ? '.json' : '.html';
    const href = URL.createObjectURL(blob);

    const a = this._dom.createElement('a');
    a.download = `${filename}${ext}`;
    a.href = href;
    this._document.body.appendChild(a); // Firefox requires anchor to be in the DOM.
    a.click();

    // cleanup.
    this._document.body.removeChild(a);
    setTimeout(_ => URL.revokeObjectURL(href), 500);
  }
}

if (typeof module !== 'undefined' && module.exports) {
  module.exports = ReportUIFeatures;
} else {
  self.ReportUIFeatures = ReportUIFeatures;
}
;
/**
 * @license
 * Copyright 2017 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

/* globals self, Util */

/** @typedef {import('./dom.js')} DOM */
/** @typedef {import('./report-renderer.js')} ReportRenderer */
/** @typedef {import('./details-renderer.js')} DetailsRenderer */
/** @typedef {import('./util.js')} Util */
/** @typedef {'failed'|'warning'|'manual'|'passed'|'notApplicable'} TopLevelClumpId */

class CategoryRenderer {
  /**
   * @param {DOM} dom
   * @param {DetailsRenderer} detailsRenderer
   */
  constructor(dom, detailsRenderer) {
    /** @type {DOM} */
    this.dom = dom;
    /** @type {DetailsRenderer} */
    this.detailsRenderer = detailsRenderer;
    /** @type {ParentNode} */
    this.templateContext = this.dom.document();

    this.detailsRenderer.setTemplateContext(this.templateContext);
  }

  /**
   * Display info per top-level clump. Define on class to avoid race with Util init.
   */
  get _clumpTitles() {
    return {
      warning: Util.UIStrings.warningAuditsGroupTitle,
      manual: Util.UIStrings.manualAuditsGroupTitle,
      passed: Util.UIStrings.passedAuditsGroupTitle,
      notApplicable: Util.UIStrings.notApplicableAuditsGroupTitle,
    };
  }

  /**
   * @param {LH.ReportResult.AuditRef} audit
   * @param {number} index
   * @return {Element}
   */
  renderAudit(audit, index) {
    const tmpl = this.dom.cloneTemplate('#tmpl-lh-audit', this.templateContext);
    return this.populateAuditValues(audit, index, tmpl);
  }

  /**
   * Populate an DOM tree with audit details. Used by renderAudit and renderOpportunity
   * @param {LH.ReportResult.AuditRef} audit
   * @param {number} index
   * @param {DocumentFragment} tmpl
   * @return {Element}
   */
  populateAuditValues(audit, index, tmpl) {
    const auditEl = this.dom.find('.lh-audit', tmpl);
    auditEl.id = audit.result.id;
    const scoreDisplayMode = audit.result.scoreDisplayMode;

    if (audit.result.displayValue) {
      const displayValue = Util.formatDisplayValue(audit.result.displayValue);
      this.dom.find('.lh-audit__display-text', auditEl).textContent = displayValue;
    }

    const titleEl = this.dom.find('.lh-audit__title', auditEl);
    titleEl.appendChild(this.dom.convertMarkdownCodeSnippets(audit.result.title));
    this.dom.find('.lh-audit__description', auditEl)
        .appendChild(this.dom.convertMarkdownLinkSnippets(audit.result.description));

    const header = /** @type {HTMLDetailsElement} */ (this.dom.find('details', auditEl));
    if (audit.result.details) {
      const elem = this.detailsRenderer.render(audit.result.details);
      if (elem) {
        elem.classList.add('lh-details');
        header.appendChild(elem);
      }
    }
    this.dom.find('.lh-audit__index', auditEl).textContent = `${index + 1}`;

    // Add chevron SVG to the end of the summary
    this.dom.find('.lh-chevron-container', auditEl).appendChild(this._createChevron());
    this._setRatingClass(auditEl, audit.result.score, scoreDisplayMode);

    if (audit.result.scoreDisplayMode === 'error') {
      auditEl.classList.add(`lh-audit--error`);
      const textEl = this.dom.find('.lh-audit__display-text', auditEl);
      textEl.textContent = Util.UIStrings.errorLabel;
      textEl.classList.add('tooltip-boundary');
      const tooltip = this.dom.createChildOf(textEl, 'div', 'tooltip tooltip--error');
      tooltip.textContent = audit.result.errorMessage || Util.UIStrings.errorMissingAuditInfo;
    } else if (audit.result.explanation) {
      const explEl = this.dom.createChildOf(titleEl, 'div', 'lh-audit-explanation');
      explEl.textContent = audit.result.explanation;
    }
    const warnings = audit.result.warnings;
    if (!warnings || warnings.length === 0) return auditEl;

    // Add list of warnings or singular warning
    const warningsEl = this.dom.createChildOf(titleEl, 'div', 'lh-warnings');
    if (warnings.length === 1) {
      warningsEl.textContent = `${Util.UIStrings.warningHeader} ${warnings.join('')}`;
    } else {
      warningsEl.textContent = Util.UIStrings.warningHeader;
      const warningsUl = this.dom.createChildOf(warningsEl, 'ul');
      for (const warning of warnings) {
        const item = this.dom.createChildOf(warningsUl, 'li');
        item.textContent = warning;
      }
    }
    return auditEl;
  }

  /**
   * @return {HTMLElement}
   */
  _createChevron() {
    const chevronTmpl = this.dom.cloneTemplate('#tmpl-lh-chevron', this.templateContext);
    const chevronEl = this.dom.find('.lh-chevron', chevronTmpl);
    return chevronEl;
  }

  /**
   * @param {Element} element DOM node to populate with values.
   * @param {number|null} score
   * @param {string} scoreDisplayMode
   * @return {Element}
   */
  _setRatingClass(element, score, scoreDisplayMode) {
    const rating = Util.calculateRating(score, scoreDisplayMode);
    element.classList.add(`lh-audit--${rating}`, `lh-audit--${scoreDisplayMode.toLowerCase()}`);
    return element;
  }

  /**
   * @param {LH.ReportResult.Category} category
   * @param {Record<string, LH.Result.ReportGroup>} groupDefinitions
   * @return {Element}
   */
  renderCategoryHeader(category, groupDefinitions) {
    const tmpl = this.dom.cloneTemplate('#tmpl-lh-category-header', this.templateContext);

    const gaugeContainerEl = this.dom.find('.lh-score__gauge', tmpl);
    const gaugeEl = this.renderScoreGauge(category, groupDefinitions);
    gaugeContainerEl.appendChild(gaugeEl);

    this.dom.find('.lh-category-header__title', tmpl).appendChild(
      this.dom.convertMarkdownCodeSnippets(category.title));
    if (category.description) {
      const descEl = this.dom.convertMarkdownLinkSnippets(category.description);
      this.dom.find('.lh-category-header__description', tmpl).appendChild(descEl);
    }

    return /** @type {Element} */ (tmpl.firstElementChild);
  }

  /**
   * Renders the group container for a group of audits. Individual audit elements can be added
   * directly to the returned element.
   * @param {LH.Result.ReportGroup} group
   * @return {Element}
   */
  renderAuditGroup(group) {
    const groupEl = this.dom.createElement('div', 'lh-audit-group');
    const summaryEl = this.dom.createChildOf(groupEl, 'div');
    const summaryInnerEl = this.dom.createChildOf(summaryEl, 'div', 'lh-audit-group__summary');
    const headerEl = this.dom.createChildOf(summaryInnerEl, 'div', 'lh-audit-group__header');

    if (group.description) {
      const auditGroupDescription = this.dom.createElement('div', 'lh-audit-group__description');
      auditGroupDescription.appendChild(this.dom.convertMarkdownLinkSnippets(group.description));
      groupEl.appendChild(auditGroupDescription);
    }
    headerEl.textContent = group.title;

    return groupEl;
  }

  /**
   * Takes an array of auditRefs, groups them if requested, then returns an
   * array of audit and audit-group elements.
   * @param {Array<LH.ReportResult.AuditRef>} auditRefs
   * @param {Object<string, LH.Result.ReportGroup>} groupDefinitions
   * @return {Array<Element>}
   */
  _renderGroupedAudits(auditRefs, groupDefinitions) {
    // Audits grouped by their group (or under notAGroup).
    /** @type {Map<string, Array<LH.ReportResult.AuditRef>>} */
    const grouped = new Map();

    // Add audits without a group first so they will appear first.
    const notAGroup = 'NotAGroup';
    grouped.set(notAGroup, []);

    for (const auditRef of auditRefs) {
      const groupId = auditRef.group || notAGroup;
      const groupAuditRefs = grouped.get(groupId) || [];
      groupAuditRefs.push(auditRef);
      grouped.set(groupId, groupAuditRefs);
    }

    /** @type {Array<Element>} */
    const auditElements = [];
    // Continuous numbering across all groups.
    let index = 0;

    for (const [groupId, groupAuditRefs] of grouped) {
      if (groupId === notAGroup) {
        // Push not-grouped audits individually.
        for (const auditRef of groupAuditRefs) {
          auditElements.push(this.renderAudit(auditRef, index++));
        }
        continue;
      }

      // Push grouped audits as a group.
      const groupDef = groupDefinitions[groupId];
      const auditGroupElem = this.renderAuditGroup(groupDef);
      for (const auditRef of groupAuditRefs) {
        auditGroupElem.appendChild(this.renderAudit(auditRef, index++));
      }
      auditGroupElem.classList.add(`lh-audit-group--${groupId}`);
      auditElements.push(auditGroupElem);
    }

    return auditElements;
  }

  /**
   * Take a set of audits, group them if they have groups, then render in a top-level
   * clump that can't be expanded/collapsed.
   * @param {Array<LH.ReportResult.AuditRef>} auditRefs
   * @param {Object<string, LH.Result.ReportGroup>} groupDefinitions
   * @return {Element}
   */
  renderUnexpandableClump(auditRefs, groupDefinitions) {
    const clumpElement = this.dom.createElement('div');
    const elements = this._renderGroupedAudits(auditRefs, groupDefinitions);
    elements.forEach(elem => clumpElement.appendChild(elem));
    return clumpElement;
  }

  /**
   * Take a set of audits and render in a top-level, expandable clump that starts
   * in a collapsed state.
   * @param {Exclude<TopLevelClumpId, 'failed'>} clumpId
   * @param {{auditRefs: Array<LH.ReportResult.AuditRef>, description?: string}} clumpOpts
   * @return {Element}
   */
  renderClump(clumpId, {auditRefs, description}) {
    const clumpTmpl = this.dom.cloneTemplate('#tmpl-lh-clump', this.templateContext);
    const clumpElement = this.dom.find('.lh-clump', clumpTmpl);

    if (clumpId === 'warning') {
      clumpElement.setAttribute('open', '');
    }

    const summaryInnerEl = this.dom.find('.lh-audit-group__summary', clumpElement);
    const chevronEl = summaryInnerEl.appendChild(this._createChevron());
    chevronEl.title = Util.UIStrings.auditGroupExpandTooltip;

    const headerEl = this.dom.find('.lh-audit-group__header', clumpElement);
    const title = this._clumpTitles[clumpId];
    headerEl.textContent = title;
    if (description) {
      const markdownDescriptionEl = this.dom.convertMarkdownLinkSnippets(description);
      const auditGroupDescription = this.dom.createElement('div', 'lh-audit-group__description');
      auditGroupDescription.appendChild(markdownDescriptionEl);
      clumpElement.appendChild(auditGroupDescription);
    }

    const itemCountEl = this.dom.find('.lh-audit-group__itemcount', clumpElement);
    // TODO(i18n): support multiple locales here
    itemCountEl.textContent = `${auditRefs.length} audits`;

    // Add all audit results to the clump.
    const auditElements = auditRefs.map(this.renderAudit.bind(this));
    clumpElement.append(...auditElements);

    clumpElement.classList.add(`lh-clump--${clumpId.toLowerCase()}`);
    return clumpElement;
  }

  /**
   * @param {ParentNode} context
   */
  setTemplateContext(context) {
    this.templateContext = context;
    this.detailsRenderer.setTemplateContext(context);
  }

  /**
   * @param {LH.ReportResult.Category} category
   * @param {Record<string, LH.Result.ReportGroup>} groupDefinitions
   * @return {DocumentFragment}
   */
  renderScoreGauge(category, groupDefinitions) { // eslint-disable-line no-unused-vars
    const tmpl = this.dom.cloneTemplate('#tmpl-lh-gauge', this.templateContext);
    const wrapper = /** @type {HTMLAnchorElement} */ (this.dom.find('.lh-gauge__wrapper', tmpl));
    wrapper.href = `#${category.id}`;
    wrapper.classList.add(`lh-gauge__wrapper--${Util.calculateRating(category.score)}`);

    // Cast `null` to 0
    const numericScore = Number(category.score);
    const gauge = this.dom.find('.lh-gauge', tmpl);
    // 329 is ~= 2 * Math.PI * gauge radius (53)
    // https://codepen.io/xgad/post/svg-radial-progress-meters
    // score of 50: `stroke-dasharray: 164.5 329`;
    /** @type {?SVGCircleElement} */
    const gaugeArc = gauge.querySelector('.lh-gauge-arc');
    if (gaugeArc) {
      gaugeArc.style.strokeDasharray = `${numericScore * 329} 329`;
    }

    const scoreOutOf100 = Math.round(numericScore * 100);
    const percentageEl = this.dom.find('.lh-gauge__percentage', tmpl);
    percentageEl.textContent = scoreOutOf100.toString();
    if (category.score === null) {
      percentageEl.textContent = '?';
      percentageEl.title = Util.UIStrings.errorLabel;
    }

    this.dom.find('.lh-gauge__label', tmpl).textContent = category.title;
    return tmpl;
  }

  /**
   * @param {LH.ReportResult.AuditRef} audit
   * @return {boolean}
   */
  _auditHasWarning(audit) {
    return Boolean(audit.result.warnings && audit.result.warnings.length);
  }

  /**
   * Returns the id of the top-level clump to put this audit in.
   * @param {LH.ReportResult.AuditRef} auditRef
   * @return {TopLevelClumpId}
   */
  _getClumpIdForAuditRef(auditRef) {
    const scoreDisplayMode = auditRef.result.scoreDisplayMode;
    if (scoreDisplayMode === 'manual' || scoreDisplayMode === 'notApplicable') {
      return scoreDisplayMode;
    }

    if (Util.showAsPassed(auditRef.result)) {
      if (this._auditHasWarning(auditRef)) {
        return 'warning';
      } else {
        return 'passed';
      }
    } else {
      return 'failed';
    }
  }

  /**
   * Renders a set of top level sections (clumps), under a status of failed, warning,
   * manual, passed, or notApplicable. The result ends up something like:
   *
   * failed clump
   *   ├── audit 1 (w/o group)
   *   ├── audit 2 (w/o group)
   *   ├── audit group
   *   |  ├── audit 3
   *   |  └── audit 4
   *   └── audit group
   *      ├── audit 5
   *      └── audit 6
   * other clump (e.g. 'manual')
   *   ├── audit 1
   *   ├── audit 2
   *   ├── …
   *   ⋮
   * @param {LH.ReportResult.Category} category
   * @param {Object<string, LH.Result.ReportGroup>} [groupDefinitions]
   * @return {Element}
   */
  render(category, groupDefinitions = {}) {
    const element = this.dom.createElement('div', 'lh-category');
    this.createPermalinkSpan(element, category.id);
    element.appendChild(this.renderCategoryHeader(category, groupDefinitions));

    // Top level clumps for audits, in order they will appear in the report.
    /** @type {Map<TopLevelClumpId, Array<LH.ReportResult.AuditRef>>} */
    const clumps = new Map();
    clumps.set('failed', []);
    clumps.set('warning', []);
    clumps.set('manual', []);
    clumps.set('passed', []);
    clumps.set('notApplicable', []);

    // Sort audits into clumps.
    for (const auditRef of category.auditRefs) {
      const clumpId = this._getClumpIdForAuditRef(auditRef);
      const clump = /** @type {Array<LH.ReportResult.AuditRef>} */ (clumps.get(clumpId)); // already defined
      clump.push(auditRef);
      clumps.set(clumpId, clump);
    }

    // Render each clump.
    for (const [clumpId, auditRefs] of clumps) {
      if (auditRefs.length === 0) continue;

      if (clumpId === 'failed') {
        const clumpElem = this.renderUnexpandableClump(auditRefs, groupDefinitions);
        clumpElem.classList.add(`lh-clump--failed`);
        element.appendChild(clumpElem);
        continue;
      }

      const description = clumpId === 'manual' ? category.manualDescription : undefined;
      const clumpElem = this.renderClump(clumpId, {auditRefs, description});
      element.appendChild(clumpElem);
    }

    return element;
  }

  /**
   * Create a non-semantic span used for hash navigation of categories
   * @param {Element} element
   * @param {string} id
   */
  createPermalinkSpan(element, id) {
    const permalinkEl = this.dom.createChildOf(element, 'span', 'lh-permalink');
    permalinkEl.id = id;
  }
}

if (typeof module !== 'undefined' && module.exports) {
  module.exports = CategoryRenderer;
} else {
  self.CategoryRenderer = CategoryRenderer;
}
;
/**
 * @license
 * Copyright 2018 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

/* globals self, Util, CategoryRenderer */

/** @typedef {import('./dom.js')} DOM */

class PerformanceCategoryRenderer extends CategoryRenderer {
  /**
   * @param {LH.ReportResult.AuditRef} audit
   * @return {Element}
   */
  _renderMetric(audit) {
    const tmpl = this.dom.cloneTemplate('#tmpl-lh-metric', this.templateContext);
    const element = this.dom.find('.lh-metric', tmpl);
    element.id = audit.result.id;
    const rating = Util.calculateRating(audit.result.score, audit.result.scoreDisplayMode);
    element.classList.add(`lh-metric--${rating}`);

    const titleEl = this.dom.find('.lh-metric__title', tmpl);
    titleEl.textContent = audit.result.title;

    const valueEl = this.dom.find('.lh-metric__value', tmpl);
    valueEl.textContent = Util.formatDisplayValue(audit.result.displayValue);

    const descriptionEl = this.dom.find('.lh-metric__description', tmpl);
    descriptionEl.appendChild(this.dom.convertMarkdownLinkSnippets(audit.result.description));

    if (audit.result.scoreDisplayMode === 'error') {
      descriptionEl.textContent = '';
      valueEl.textContent = 'Error!';
      const tooltip = this.dom.createChildOf(descriptionEl, 'span');
      tooltip.textContent = audit.result.errorMessage || 'Report error: no metric information';
    }

    return element;
  }

  /**
   * @param {LH.ReportResult.AuditRef} audit
   * @param {number} index
   * @param {number} scale
   * @return {Element}
   */
  _renderOpportunity(audit, index, scale) {
    const oppTmpl = this.dom.cloneTemplate('#tmpl-lh-opportunity', this.templateContext);
    const element = this.populateAuditValues(audit, index, oppTmpl);
    element.id = audit.result.id;

    if (!audit.result.details || audit.result.scoreDisplayMode === 'error') {
      return element;
    }
    const details = audit.result.details;
    if (details.type !== 'opportunity') {
      return element;
    }

    // Overwrite the displayValue with opportunity's wastedMs
    const displayEl = this.dom.find('.lh-audit__display-text', element);
    const sparklineWidthPct = `${details.overallSavingsMs / scale * 100}%`;
    this.dom.find('.lh-sparkline__bar', element).style.width = sparklineWidthPct;
    displayEl.textContent = Util.formatSeconds(details.overallSavingsMs, 0.01);

    // Set [title] tooltips
    if (audit.result.displayValue) {
      const displayValue = Util.formatDisplayValue(audit.result.displayValue);
      this.dom.find('.lh-load-opportunity__sparkline', element).title = displayValue;
      displayEl.title = displayValue;
    }

    return element;
  }

  /**
   * Get an audit's wastedMs to sort the opportunity by, and scale the sparkline width
   * Opportunties with an error won't have a details object, so MIN_VALUE is returned to keep any
   * erroring opportunities last in sort order.
   * @param {LH.ReportResult.AuditRef} audit
   * @return {number}
   */
  _getWastedMs(audit) {
    if (audit.result.details && audit.result.details.type === 'opportunity') {
      const details = audit.result.details;
      if (typeof details.overallSavingsMs !== 'number') {
        throw new Error('non-opportunity details passed to _getWastedMs');
      }
      return details.overallSavingsMs;
    } else {
      return Number.MIN_VALUE;
    }
  }

  /**
   * @param {LH.ReportResult.Category} category
   * @param {Object<string, LH.Result.ReportGroup>} groups
   * @param {'PSI'=} environment 'PSI' and undefined are the only valid values
   * @return {Element}
   * @override
   */
  render(category, groups, environment) {
    const element = this.dom.createElement('div', 'lh-category');
    if (environment === 'PSI') {
      const gaugeEl = this.dom.createElement('div', 'lh-score__gauge');
      gaugeEl.appendChild(this.renderScoreGauge(category, groups));
      element.appendChild(gaugeEl);
    } else {
      this.createPermalinkSpan(element, category.id);
      element.appendChild(this.renderCategoryHeader(category, groups));
    }

    // Metrics
    const metricAudits = category.auditRefs.filter(audit => audit.group === 'metrics');
    const metricAuditsEl = this.renderAuditGroup(groups.metrics);

    const keyMetrics = metricAudits.filter(a => a.weight >= 3);
    const otherMetrics = metricAudits.filter(a => a.weight < 3);

    const metricsBoxesEl = this.dom.createChildOf(metricAuditsEl, 'div', 'lh-columns');
    const metricsColumn1El = this.dom.createChildOf(metricsBoxesEl, 'div', 'lh-column');
    const metricsColumn2El = this.dom.createChildOf(metricsBoxesEl, 'div', 'lh-column');

    keyMetrics.forEach(item => {
      metricsColumn1El.appendChild(this._renderMetric(item));
    });
    otherMetrics.forEach(item => {
      metricsColumn2El.appendChild(this._renderMetric(item));
    });

    // 'Values are estimated and may vary' is used as the category description for PSI
    if (environment !== 'PSI') {
      const estValuesEl = this.dom.createChildOf(metricsColumn2El, 'div',
          'lh-metrics__disclaimer lh-metrics__disclaimer');
      estValuesEl.textContent = Util.UIStrings.varianceDisclaimer;
    }

    metricAuditsEl.classList.add('lh-audit-group--metrics');
    element.appendChild(metricAuditsEl);

    // Filmstrip
    const timelineEl = this.dom.createChildOf(element, 'div', 'lh-filmstrip-container');
    const thumbnailAudit = category.auditRefs.find(audit => audit.id === 'screenshot-thumbnails');
    const thumbnailResult = thumbnailAudit && thumbnailAudit.result;
    if (thumbnailResult && thumbnailResult.details) {
      timelineEl.id = thumbnailResult.id;
      const filmstripEl = this.detailsRenderer.render(thumbnailResult.details);
      filmstripEl && timelineEl.appendChild(filmstripEl);
    }

    // Opportunities
    const opportunityAudits = category.auditRefs
        .filter(audit => audit.group === 'load-opportunities' && !Util.showAsPassed(audit.result))
        .sort((auditA, auditB) => this._getWastedMs(auditB) - this._getWastedMs(auditA));

    if (opportunityAudits.length) {
      // Scale the sparklines relative to savings, minimum 2s to not overstate small savings
      const minimumScale = 2000;
      const wastedMsValues = opportunityAudits.map(audit => this._getWastedMs(audit));
      const maxWaste = Math.max(...wastedMsValues);
      const scale = Math.max(Math.ceil(maxWaste / 1000) * 1000, minimumScale);
      const groupEl = this.renderAuditGroup(groups['load-opportunities']);
      const tmpl = this.dom.cloneTemplate('#tmpl-lh-opportunity-header', this.templateContext);

      this.dom.find('.lh-load-opportunity__col--one', tmpl).textContent =
        Util.UIStrings.opportunityResourceColumnLabel;
      this.dom.find('.lh-load-opportunity__col--two', tmpl).textContent =
        Util.UIStrings.opportunitySavingsColumnLabel;

      const headerEl = this.dom.find('.lh-load-opportunity__header', tmpl);
      groupEl.appendChild(headerEl);
      opportunityAudits.forEach((item, i) =>
          groupEl.appendChild(this._renderOpportunity(item, i, scale)));
      groupEl.classList.add('lh-audit-group--load-opportunities');
      element.appendChild(groupEl);
    }

    // Diagnostics
    const diagnosticAudits = category.auditRefs
        .filter(audit => audit.group === 'diagnostics' && !Util.showAsPassed(audit.result))
        .sort((a, b) => {
          const scoreA = a.result.scoreDisplayMode === 'informative' ? 100 : Number(a.result.score);
          const scoreB = b.result.scoreDisplayMode === 'informative' ? 100 : Number(b.result.score);
          return scoreA - scoreB;
        });

    if (diagnosticAudits.length) {
      const groupEl = this.renderAuditGroup(groups['diagnostics']);
      diagnosticAudits.forEach((item, i) => groupEl.appendChild(this.renderAudit(item, i)));
      groupEl.classList.add('lh-audit-group--diagnostics');
      element.appendChild(groupEl);
    }

    // Passed audits
    const passedAudits = category.auditRefs
        .filter(audit => (audit.group === 'load-opportunities' || audit.group === 'diagnostics') &&
            Util.showAsPassed(audit.result));

    if (!passedAudits.length) return element;

    const clumpOpts = {
      auditRefs: passedAudits,
      groupDefinitions: groups,
    };
    const passedElem = this.renderClump('passed', clumpOpts);
    element.appendChild(passedElem);
    return element;
  }
}

if (typeof module !== 'undefined' && module.exports) {
  module.exports = PerformanceCategoryRenderer;
} else {
  self.PerformanceCategoryRenderer = PerformanceCategoryRenderer;
}
;
/**
 * @license
 * Copyright 2018 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

/* globals self, Util, CategoryRenderer */

class PwaCategoryRenderer extends CategoryRenderer {
  /**
   * @param {LH.ReportResult.Category} category
   * @param {Object<string, LH.Result.ReportGroup>} [groupDefinitions]
   * @return {Element}
   */
  render(category, groupDefinitions = {}) {
    const categoryElem = this.dom.createElement('div', 'lh-category');
    this.createPermalinkSpan(categoryElem, category.id);
    categoryElem.appendChild(this.renderCategoryHeader(category, groupDefinitions));

    const auditRefs = category.auditRefs;

    // Regular audits aren't split up into pass/fail/notApplicable clumps, they're
    // all put in a top-level clump that isn't expandable/collapsable.
    const regularAuditRefs = auditRefs.filter(ref => ref.result.scoreDisplayMode !== 'manual');
    const auditsElem = this._renderAudits(regularAuditRefs, groupDefinitions);
    categoryElem.appendChild(auditsElem);

    // Manual audits are still in a manual clump.
    const manualAuditRefs = auditRefs.filter(ref => ref.result.scoreDisplayMode === 'manual');
    const manualElem = this.renderClump('manual',
      {auditRefs: manualAuditRefs, description: category.manualDescription});
    categoryElem.appendChild(manualElem);

    return categoryElem;
  }

  /**
   * @param {LH.ReportResult.Category} category
   * @param {Record<string, LH.Result.ReportGroup>} groupDefinitions
   * @return {DocumentFragment}
   */
  renderScoreGauge(category, groupDefinitions) {
    // Defer to parent-gauge style if category error.
    if (category.score === null) {
      return super.renderScoreGauge(category, groupDefinitions);
    }

    const tmpl = this.dom.cloneTemplate('#tmpl-lh-gauge--pwa', this.templateContext);
    const wrapper = /** @type {HTMLAnchorElement} */ (this.dom.find('.lh-gauge--pwa__wrapper',
      tmpl));
    wrapper.href = `#${category.id}`;

    const allGroups = this._getGroupIds(category.auditRefs);
    const passingGroupIds = this._getPassingGroupIds(category.auditRefs);

    if (passingGroupIds.size === allGroups.size) {
      wrapper.classList.add('lh-badged--all');
    } else {
      for (const passingGroupId of passingGroupIds) {
        wrapper.classList.add(`lh-badged--${passingGroupId}`);
      }
    }

    this.dom.find('.lh-gauge__label', tmpl).textContent = category.title;
    wrapper.title = this._getGaugeTooltip(category.auditRefs, groupDefinitions);
    return tmpl;
  }

  /**
   * Returns the group IDs found in auditRefs.
   * @param {Array<LH.ReportResult.AuditRef>} auditRefs
   * @return {Set<string>}
   */
  _getGroupIds(auditRefs) {
    const groupIds = auditRefs.map(ref => ref.group).filter(/** @return {g is string} */ g => !!g);
    return new Set(groupIds);
  }

  /**
   * Returns the group IDs whose audits are all considered passing.
   * @param {Array<LH.ReportResult.AuditRef>} auditRefs
   * @return {Set<string>}
   */
  _getPassingGroupIds(auditRefs) {
    const uniqueGroupIds = this._getGroupIds(auditRefs);

    // Remove any that have a failing audit.
    for (const auditRef of auditRefs) {
      if (!Util.showAsPassed(auditRef.result) && auditRef.group) {
        uniqueGroupIds.delete(auditRef.group);
      }
    }

    return uniqueGroupIds;
  }

  /**
   * Returns a tooltip string summarizing group pass rates.
   * @param {Array<LH.ReportResult.AuditRef>} auditRefs
   * @param {Record<string, LH.Result.ReportGroup>} groupDefinitions
   * @return {string}
   */
  _getGaugeTooltip(auditRefs, groupDefinitions) {
    const groupIds = this._getGroupIds(auditRefs);

    const tips = [];
    for (const groupId of groupIds) {
      const groupAuditRefs = auditRefs.filter(ref => ref.group === groupId);
      const auditCount = groupAuditRefs.length;
      const passedCount = groupAuditRefs.filter(ref => Util.showAsPassed(ref.result)).length;

      const title = groupDefinitions[groupId].title;
      tips.push(`${title}: ${passedCount}/${auditCount}`);
    }

    return tips.join(', ');
  }

  /**
   * Render non-manual audits in groups, giving a badge to any group that has
   * all passing audits.
   * @param {Array<LH.ReportResult.AuditRef>} auditRefs
   * @param {Object<string, LH.Result.ReportGroup>} groupDefinitions
   * @return {Element}
   */
  _renderAudits(auditRefs, groupDefinitions) {
    const auditsElem = this.renderUnexpandableClump(auditRefs, groupDefinitions);

    // Add a 'badged' class to group if all audits in that group pass.
    const passsingGroupIds = this._getPassingGroupIds(auditRefs);
    for (const groupId of passsingGroupIds) {
      const groupElem = this.dom.find(`.lh-audit-group--${groupId}`, auditsElem);
      groupElem.classList.add('lh-badged');
    }

    return auditsElem;
  }
}

if (typeof module !== 'undefined' && module.exports) {
  module.exports = PwaCategoryRenderer;
} else {
  self.PwaCategoryRenderer = PwaCategoryRenderer;
}
;
/**
 * @license
 * Copyright 2017 Google Inc. All Rights Reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS-IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
'use strict';

/**
 * @fileoverview The entry point for rendering the Lighthouse report based on the JSON output.
 *    This file is injected into the report HTML along with the JSON report.
 *
 * Dummy text for ensuring report robustness: \u003c/script> pre$`post %%LIGHTHOUSE_JSON%%
 */

/** @typedef {import('./dom.js')} DOM */

/* globals self, Util, DetailsRenderer, CategoryRenderer, PerformanceCategoryRenderer, PwaCategoryRenderer */

class ReportRenderer {
  /**
   * @param {DOM} dom
   */
  constructor(dom) {
    /** @type {DOM} */
    this._dom = dom;
    /** @type {ParentNode} */
    this._templateContext = this._dom.document();
  }

  /**
   * @param {LH.Result} result
   * @param {Element} container Parent element to render the report into.
   * @return {Element}
   */
  renderReport(result, container) {
    // Mutate the UIStrings if necessary (while saving originals)
    const originalUIStrings = JSON.parse(JSON.stringify(Util.UIStrings));

    const report = Util.prepareReportResult(result);

    container.textContent = ''; // Remove previous report.
    container.appendChild(this._renderReport(report));

    // put the UIStrings back into original state
    Util.updateAllUIStrings(originalUIStrings);

    return container;
  }

  /**
   * Define a custom element for <templates> to be extracted from. For example:
   *     this.setTemplateContext(new DOMParser().parseFromString(htmlStr, 'text/html'))
   * @param {ParentNode} context
   */
  setTemplateContext(context) {
    this._templateContext = context;
  }

  /**
   * @param {LH.ReportResult} report
   * @return {DocumentFragment}
   */
  _renderReportHeader(report) {
    const el = this._dom.cloneTemplate('#tmpl-lh-heading', this._templateContext);
    const domFragment = this._dom.cloneTemplate('#tmpl-lh-scores-wrapper', this._templateContext);
    const placeholder = this._dom.find('.lh-scores-wrapper-placeholder', el);
    /** @type {HTMLDivElement} */ (placeholder.parentNode).replaceChild(domFragment, placeholder);

    this._dom.find('.lh-config__timestamp', el).textContent =
        Util.formatDateTime(report.fetchTime);
    this._dom.find('.lh-product-info__version', el).textContent = report.lighthouseVersion;
    const metadataUrl = /** @type {HTMLAnchorElement} */ (this._dom.find('.lh-metadata__url', el));
    const toolbarUrl = /** @type {HTMLAnchorElement}*/ (this._dom.find('.lh-toolbar__url', el));
    metadataUrl.href = metadataUrl.textContent = report.finalUrl;
    toolbarUrl.href = toolbarUrl.textContent = report.finalUrl;

    const emulationDescriptions = Util.getEmulationDescriptions(report.configSettings || {});
    this._dom.find('.lh-config__emulation', el).textContent = emulationDescriptions.summary;
    return el;
  }

  /**
   * @return {Element}
   */
  _renderReportShortHeader() {
    const shortHeaderContainer = this._dom.createElement('div', 'lh-header-container');
    const wrapper = this._dom.cloneTemplate('#tmpl-lh-scores-wrapper', this._templateContext);
    shortHeaderContainer.appendChild(wrapper);
    return shortHeaderContainer;
  }


  /**
   * @param {LH.ReportResult} report
   * @return {DocumentFragment}
   */
  _renderReportFooter(report) {
    const footer = this._dom.cloneTemplate('#tmpl-lh-footer', this._templateContext);

    const env = this._dom.find('.lh-env__items', footer);
    env.id = 'runtime-settings';
    const envValues = Util.getEnvironmentDisplayValues(report.configSettings || {});
    [
      {name: 'URL', description: report.finalUrl},
      {name: 'Fetch time', description: Util.formatDateTime(report.fetchTime)},
      ...envValues,
      {name: 'User agent (host)', description: report.userAgent},
      {name: 'User agent (network)', description: report.environment &&
        report.environment.networkUserAgent},
      {name: 'CPU/Memory Power', description: report.environment &&
        report.environment.benchmarkIndex.toFixed(0)},
    ].forEach(runtime => {
      if (!runtime.description) return;

      const item = this._dom.cloneTemplate('#tmpl-lh-env__items', env);
      this._dom.find('.lh-env__name', item).textContent = `${runtime.name}:`;
      this._dom.find('.lh-env__description', item).textContent = runtime.description;
      env.appendChild(item);
    });

    this._dom.find('.lh-footer__version', footer).textContent = report.lighthouseVersion;
    return footer;
  }

  /**
   * Returns a div with a list of top-level warnings, or an empty div if no warnings.
   * @param {LH.ReportResult} report
   * @return {Node}
   */
  _renderReportWarnings(report) {
    if (!report.runWarnings || report.runWarnings.length === 0) {
      return this._dom.createElement('div');
    }

    const container = this._dom.cloneTemplate('#tmpl-lh-warnings--toplevel', this._templateContext);
    const message = this._dom.find('.lh-warnings__msg', container);
    message.textContent = Util.UIStrings.toplevelWarningsMessage;

    const warnings = this._dom.find('ul', container);
    for (const warningString of report.runWarnings) {
      const warning = warnings.appendChild(this._dom.createElement('li'));
      warning.textContent = warningString;
    }

    return container;
  }

  /**
   * @param {LH.ReportResult} report
   * @return {DocumentFragment}
   */
  _renderReport(report) {
    let header;
    const headerContainer = this._dom.createElement('div');
    if (this._dom.isDevTools()) {
      headerContainer.classList.add('lh-header-plain');
      header = this._renderReportShortHeader();
    } else {
      headerContainer.classList.add('lh-header-sticky');
      header = this._renderReportHeader(report);
    }
    headerContainer.appendChild(header);

    const container = this._dom.createElement('div', 'lh-container');
    const reportSection = container.appendChild(this._dom.createElement('div', 'lh-report'));

    reportSection.appendChild(this._renderReportWarnings(report));

    let scoreHeader;
    const isSoloCategory = report.reportCategories.length === 1;
    if (!isSoloCategory) {
      scoreHeader = this._dom.createElement('div', 'lh-scores-header');
    } else {
      headerContainer.classList.add('lh-header--solo-category');
    }

    const detailsRenderer = new DetailsRenderer(this._dom);
    const categoryRenderer = new CategoryRenderer(this._dom, detailsRenderer);
    categoryRenderer.setTemplateContext(this._templateContext);

    /** @type {Record<string, CategoryRenderer>} */
    const specificCategoryRenderers = {
      performance: new PerformanceCategoryRenderer(this._dom, detailsRenderer),
      pwa: new PwaCategoryRenderer(this._dom, detailsRenderer),
    };
    Object.values(specificCategoryRenderers).forEach(renderer => {
      renderer.setTemplateContext(this._templateContext);
    });

    const categories = reportSection.appendChild(this._dom.createElement('div', 'lh-categories'));

    for (const category of report.reportCategories) {
      const renderer = specificCategoryRenderers[category.id] || categoryRenderer;
      categories.appendChild(renderer.render(category, report.categoryGroups));
    }

    // Fireworks
    const scoresAll100 = report.reportCategories.every(cat => cat.score === 1);
    if (!this._dom.isDevTools() && scoresAll100) {
      headerContainer.classList.add('score100');
      this._dom.find('.lh-header', headerContainer).addEventListener('click', _ => {
        headerContainer.classList.toggle('fireworks-paused');
      });
    }

    if (scoreHeader) {
      const defaultGauges = [];
      const customGauges = [];
      for (const category of report.reportCategories) {
        const renderer = specificCategoryRenderers[category.id] || categoryRenderer;
        const categoryGauge = renderer.renderScoreGauge(category, report.categoryGroups || {});

        // Group gauges that aren't default at the end of the header
        if (renderer.renderScoreGauge === categoryRenderer.renderScoreGauge) {
          defaultGauges.push(categoryGauge);
        } else {
          customGauges.push(categoryGauge);
        }
      }
      scoreHeader.append(...defaultGauges, ...customGauges);

      const scoreScale = this._dom.cloneTemplate('#tmpl-lh-scorescale', this._templateContext);
      this._dom.find('.lh-scorescale-label', scoreScale).textContent =
        Util.UIStrings.scorescaleLabel;
      const scoresContainer = this._dom.find('.lh-scores-container', headerContainer);
      scoresContainer.appendChild(scoreHeader);
      scoresContainer.appendChild(scoreScale);
    }

    reportSection.appendChild(this._renderReportFooter(report));

    const reportFragment = this._dom.createFragment();
    reportFragment.appendChild(headerContainer);
    reportFragment.appendChild(container);

    return reportFragment;
  }
}

/** @type {LH.I18NRendererStrings} */
ReportRenderer._UIStringsStash = {};

if (typeof module !== 'undefined' && module.exports) {
  module.exports = ReportRenderer;
} else {
  self.ReportRenderer = ReportRenderer;
}

  //# sourceURL=compiled-reportrenderer.js
  </script>
  <script>window.__LIGHTHOUSE_JSON__ = {"userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36","environment":{"networkUserAgent":"Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3694.0 Mobile Safari/537.36 Chrome-Lighthouse","hostUserAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/73.0.3683.75 Safari/537.36","benchmarkIndex":1430},"lighthouseVersion":"4.2.0","fetchTime":"2019-03-14T18:14:49.947Z","requestedUrl":"https://www.paulirish.com/","finalUrl":"https://www.paulirish.com/","runWarnings":[],"audits":{"is-on-https":{"id":"is-on-https","title":"Uses HTTPS","description":"All sites should be protected with HTTPS, even ones that don't handle sensitive data. HTTPS prevents intruders from tampering with or passively listening in on the communications between your app and your users, and is a prerequisite for HTTP/2 and many new web platform APIs. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/https).","score":1,"scoreDisplayMode":"binary","rawValue":true,"displayValue":"","details":{"type":"table","headings":[],"items":[]}},"redirects-http":{"id":"redirects-http","title":"Redirects HTTP traffic to HTTPS","description":"If you've already set up HTTPS, make sure that you redirect all HTTP traffic to HTTPS. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/http-redirects-to-https).","score":1,"scoreDisplayMode":"binary","rawValue":true},"service-worker":{"id":"service-worker","title":"Does not register a service worker that controls page and start_url","description":"The service worker is the technology that enables your app to use many Progressive Web App features, such as offline, add to homescreen, and push notifications. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/registered-service-worker).","score":0,"scoreDisplayMode":"binary","rawValue":false},"works-offline":{"id":"works-offline","title":"Current page does not respond with a 200 when offline","description":"If you're building a Progressive Web App, consider using a service worker so that your app can work offline. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/http-200-when-offline).","score":0,"scoreDisplayMode":"binary","rawValue":false,"warnings":[]},"viewport":{"id":"viewport","title":"Has a `\u003cmeta name=\"viewport\">` tag with `width` or `initial-scale`","description":"Add a viewport meta tag to optimize your app for mobile screens. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/has-viewport-meta-tag).","score":1,"scoreDisplayMode":"binary","rawValue":true,"warnings":[]},"without-javascript":{"id":"without-javascript","title":"Contains some content when JavaScript is not available","description":"Your app should display some content when JavaScript is disabled, even if it's just a warning to the user that JavaScript is required to use the app. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/no-js).","score":1,"scoreDisplayMode":"binary","rawValue":true},"first-contentful-paint":{"id":"first-contentful-paint","title":"First Contentful Paint","description":"First Contentful Paint marks the time at which the first text or image is painted. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/first-contentful-paint).","score":0.98,"scoreDisplayMode":"numeric","rawValue":1692.7309999999998,"displayValue":"1.7 s"},"first-meaningful-paint":{"id":"first-meaningful-paint","title":"First Meaningful Paint","description":"First Meaningful Paint measures when the primary content of a page is visible. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/first-meaningful-paint).","score":0.98,"scoreDisplayMode":"numeric","rawValue":1692.7309999999998,"displayValue":"1.7 s"},"load-fast-enough-for-pwa":{"id":"load-fast-enough-for-pwa","title":"Page load is fast enough on mobile networks","description":"A fast page load over a cellular network ensures a good mobile user experience. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/fast-3g).","score":1,"scoreDisplayMode":"binary","rawValue":1934.4504999999997},"speed-index":{"id":"speed-index","title":"Speed Index","description":"Speed Index shows how quickly the contents of a page are visibly populated. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/speed-index).","score":1,"scoreDisplayMode":"numeric","rawValue":1692.7309999999998,"displayValue":"1.7 s"},"screenshot-thumbnails":{"id":"screenshot-thumbnails","title":"Screenshot Thumbnails","description":"This is what the load of your site looked like.","score":null,"scoreDisplayMode":"informative","rawValue":true,"details":{"type":"filmstrip","scale":3000,"items":[{"timing":300,"timestamp":18294171816,"data":"/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRQBAwQEBQQFCQUFCRQNCw0UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFP/AABEIAMAAeAMBEQACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/AP1ToAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgD/9k="},{"timing":600,"timestamp":18294471816,"data":"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"},{"timing":900,"timestamp":18294771816,"data":"/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRQBAwQEBQQFCQUFCRQNCw0UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFP/AABEIAMAAeAMBEQACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/APjKgAoAKACgAoAKACgAoAKACgAoAKACgAoAmsUWS9t0YBlaRQQehGaAO/8A2dfCWlePPjj4M8Pa5am+0jUb9YLm3EjR+YpB43IQw/AigD2+b9nbwF8UrvwbBomoWngrWLi38vxBZeHWn8R6fZXEt6ILFTdJJJFGZlLlg9xxsUBdxAYA8t8Z/s6XXgn+2oL/AFmP+0dK8Py6zcQQ2+6MSx6wdMeBX3gkblMm8jpxt70AM8V+AtD07x18etOtrARWnhj7T/ZEfnSH7Ns1u0tl5JJf9zLInzk/ez94AgA6zVv2e/B+i3OreG4/Gtjf3lp4p0vRL7xLcWs1pBpXmNqa3MZR3CvgWcL7jhcsVD4+cgHUL+yN4eutAm8ODXLiw8a/8JLc6VptxfaTcRSai66Za3UdrJD5hjt0DyyDzsvncpXehDAA+TD1OKACgAoAKACgAoAKACgB0cjQyK6HDqQwPoRQBteCdU1zQvE9nqvhu4ktNZ04SXsFxGVBi8pGkd/m44RWPNAHU+CdQ+Ivgi4u7Lw3Nc6QdTWznmiXyhFJteOW2l/eZUPG0kbrIMNGSTlfmNABefEv4keKdMvdIudQ1HU7PWZZZJoXtw/2gzTfanXdtzsMuZQoO1WZ2AG5sgGRr2reLrXxB4qk1U3H9p6xNLDrMjoD9ofzluXDMBj/AFsSSZXj5B2zQAT+L/F19c313O89y+r6lHrN20torpeXal9sjqV2uD9pcbcFW87BBDAUAbS/Fz4krqFnfJql+Luy1F7+0kjt1PkXPlxwfuwFwNsccUYjA2qqqABxQB5/c2VzBH58ttJDEzbd5Qhc88Z/A/kaAK9ABQAUAFABQAUAFABQBe0TXdQ8OX632l3cljeorolxCcOm5SpKnscMRkYIzwQeaAOgb4ueMDNbTf2z5lxbxiOOae1hlcgGMguWXLsDDEQ7ZYGNSDkZoAF+KevL4W03QfMtja6df/2hbSG3UukmHGMH5SuZHOCpzuIJK/LQAr/Fzxc/kD+2ZVWG6lvVCIgPnSeZvbOM8+bJkHIO7pjigCtP8TPE9zOk0usTvLFv8lyFzCGEikJgDaMSuMLjGRjG1doBJcfEzXLmDRA80Zu9Hmmnt75lLzM0kplbeXJB+Yt2GQ3OcDABQ8ReNdZ8WYOq3aXbjaBI1vGrhVaRgAVUEZaWRmx94tk5IGADEoAKACgAoAKACgAoAKAP0mX9g74UTOsVva63c3D5EcEeoANIQM4BIAHAJ5IHHWgCnefsOfC7TtXh0q60rW7bU5rd7qOzl16yWZ4VxukCGXJUZ5OMCgC/af8ABP3wDfwCa38NeJJ4izLvj1i0YblJVhxJ1DAgjsQRQBN/w7y8Ef8AQqeJ/wDwbWv/AMcoAP8Ah3l4I/6FTxR/4NrX/wCOUAH/AA7y8Ef9Cp4o/wDBta//ABygA/4d5eCP+hU8Uf8Ag2tf/jlAEP8AwwN8LlmFvLY67b3ZIX7PJqC7gT0GQCDnI5BI96ANmP8A4Jx/DCZWMX9oTbGKMY9TJwR94f6vtnn0oAF/4JxfDCV5Uja/d4m2SKuqEmNtobaw8vg4YHB9aAH/APDtz4af3NS/8GR/+N0AH/Dtz4af3NS/8GR/+N0AH/Dtz4af3NS/8GR/+N0AH/Dtz4af3NS/8GR/+N0AVNT/AOCeHwu0mBJp49V2MwQbNRzzyf7g9KAParHwR4y02+gu4LeFJ4WJQi4XuCp/MEjI5GeOaAJbnwR4kuLyzuY9CsLGW0t47WIafeSWsawxypKkeyKRQVDIOCMFSynKuwIBpeHtM8beF9Ht9N03TLCG1h3H95ctLJI7MWeSSR3Z3dmJZnYlmYkkkkmgDR+3fEUf8uOnfg4/+KoAPt3xEP8Ay46d+Lj/AOKoAPt3xFH/AC5ad+Dj/wCKoAPtvxF6/YdPx/vjP/oVAGBceF/HF5rH9pzRQNdeYJN3moACOgAHYYA9fXJ5oArav8M7/XtT1DUL7wtZT3V9s+0SDUplLhBhVOJPujg7emVU/wAIwAb2kaV4m0I3BsfDunwefs8z/S2bOxQq9XOAFAGBgcUAaH2vxr/0BdP/APAj/wCyoAPtfjX/AKAun/8AgR/9lQAfa/Gv/QF0/wD8CP8A7KgA+1+Nf+gLp/8A4Ef/AGVAGX4g03xr4htY7aTTrKCNHEgEdx1OCOSSfU0AenZ5oAM4oATBxQAdKAFGD2oATrQAueKAE7EUAHQfWgAJxQAuDQAnfgc0ABoAWgBO4+tAFbVLN9Qs/s6TvakyRuZY+uFdWK/jjB68E0AY2ieGdS0i0uUk11r+VvKEUlxbZ2KoAI+/nJAHORg5bkmgCC08H31u1oW1++fypFdyzkl9rzNg5JzkSqD3/dr+ABY17w1f6zI8q6zJZOBKiC3RlGHjUZOHG5gy5BJ74wRQBp6Vpr6at2HupLsz3Ek6mT/lmrNkIBk8DpQBeHvQAdqAF7YoABz1oATPFAC4oASgBcc4oASgAJ+79aAOd8f3Pie08N7vB1vZXOvSXtlAv9oxmSCK3e6iS6mZRJGWMdu00gUOCSgAyTggHjE/hf426t4zjivtRSDw1deLI9TkksLwRS2mlm2v4/sjYwfl8rTGIj3gzzzHcYh8oBQ1mX9o6wvfifa6Hp1lPp89zeS+HLy7kt5Lld1hdmERFrgIirdQ2KBZYyP9IkZvlBKgGnY+Lf2itQTxs1z4J8P6Z/Z0F9L4eJmWR9XlVpxZwyoLzbb5H2ZnYu6kCQZQsCgByvivXf2pdR16K0sfCOjx2elXOoXMOowTx2sV+0JdLJJE+3SO8EyssjqQjBvlwAm9wD0O3174tSfFLwPJdeDZl8MXWhW51q4t9WtUjsL+TeZ42ty7M4j2RjcrvyybGK+dvAKV9c/HXw7qMyadpWneJrd3tlhlvLmFcQtb38kgdVeLY8dz9ihZwJMwskgEkm9UAJ/CfiD42L4r0ldW8IaemkahqEv9ryyXqD+zoltLER/Ztk8hkRpvtnLKrHbkrH/GAcJ4bvP2kPCOi6QdN8NTeIJZDpEGr2vjDUrN5El8q5Op3NtLBPxCWFoqK5ZgS22IDJoAq+GPHX7T/gjwDJb6v8PrDWn0fQbbyL6SVLi8u54dIle485Y753lke/S3jUouXVpCQpYFQCt4U+Lf7QnxFv8AT4T4GfRL3S4f7Rka50q50+zunl8PylYH8+5UyCPUpY42QHJG1sxmN2AB1+g/En4y+JPGHxM8I6p4SudGXSTK+j6zpun+WupW2622m2uZ5ntxdGJ7hlSQeWJDEHIEUwIBi32r/tDrbWvhzR/A2oR6Ob+3/wCJzrut2M+oR2i3F40nmSwXEfzlY9OwqpJhJLhWkdtpABd+DPiH9pZvifZx+NvBWk2Pg3WLk3OqXj30Tz6YU0mFPJtoku5QsLXkbFTmRjvdmWPcMAH076euaAMHx541svh54al1vULa9urWO4trYxafAZ5meeeOCMLGOW+eVeBk4zgE8UAUk+K3hJr6ewGt27apBZx302mJue8SGR/LUmAAvneQm0LuDMoIywyAWrD4h6Dq2l2GpaXfLrGn3xdba704efDIVbaf3i5UDIbBJAbHyk8UActJ+0X4Ftptc+2apJp1josEU19ql5bulnC0l1La+W0uNoZZoWU5wvPBO19oB0mkfEzw5rrWQtdQR49QuWtbCVlIS9KweeXiP8SGLLB+Awwy5VlJAMXwZ8ePBfjdbKG11eGx1i5WEtol9LGl7btLCJo1lRWYKSjDoSN3y53ArQBoL8YfCDeI7TQE1hZNVubuSxSGOCVgkyfatyuwXan/AB43eNxGfJbGeMgFDTvjv4M1DxLrPh46oLTW9Mnt4ZdPuRtuJFnW18qVYgS/ls97BEGZV+fcOgzQB048YaSNTstOluzbX17cS2trBcxPE1xLGjO6x7gA/wAqOcjIIRsHg0ActZfHzwTPqcOn3WrLpOoXPl/ZLLUozBcXe+G3lURRH52Y/aokCY3lwyhSVNAGzF8TNAl06/vhcyGGx1J9JnWGB7h0uVfbs2xBzzlCP99QcMcUAVpfjH4Sit9Um/tN5LbTObq8htZpLZB9kS8BEyqUIMEiOCGOc468UASw/FbwtPp1pqK6kTp93dT2cF2LaZoXkhd0kO8IQsY8t28wkJsRn3bQTQBd8I/EDQPHdoLnQdQXU7Zt22eCNzG207Ww2McNuX/ejkXrG4UA6DrtPvQBwPx28eaP8MPhhqXinXtGGv6VpU9pcy2axxvJkXMQWSMSfL5kbESLyMMi/Mv3gAcL4u8efDC18Q2PhnXfBE0up69dppcsEWn285Z2ltrp4rpo5CNolvRI6MSGZnbDCVDKAYfgD46/CLxleW+peGvA6S3/ANnvdeiZbDTop4rjYyzhQZg4uZo4WwQP3iR53FFLAA6LVfGvwz0++1zw3qvw3W1j1GG71G6hk0i0ntNTis1W68x2jdo33ecXQOdwZssELpvAM1Pjz8M/DkmoiHwVc6ZqPhu+uVktX02yglt7lpLeOaVSZQIw73ahp2ZUYJIxcoAzAGp4d8Y+APFV54puvD/w8S71DQNWXR7yX+zbOGR7mC6t44Y0ctk/NFE0ZOFX7OgYxsqgAFT4Z/G/4d+OtDbxp4e8FXltpza1Hp76nNpUEM32uWSMRyEBy+HbUpWD/wC3cE4Mg8wA9E8LeBPAOq6JpWt6V4N8P2kN9a29zA8NhaOyxkQyRr5kW5G2+TblSjMuYYypIVTQBu2Hgjw5pl413Z6BplpdNevqJlt7SNCbl02STZC58x0JVn+8ykgkg0AV5/ht4QuTKZvCmizecbkyCTT4WDG4YNcH7vWUhS5/j2jdkigC1aeC/D+n6ne6jZ6DplteX0izXVxDaIslxKhJSSRgBvZSzEFskFie9AEMfgHw1HaXdqPDukC3u4lt7mL7BEEnjVPLVJF24ZRGAgB4CjAwOKAJrLwboGn6Y+m2+h6dFpzySStZx2sawlpNwkbYBjc4dwxx8wY56nIAzw14H8P+DI/L0DQ9P0OHyEthBptqlvGsaPI6oqoAAoeaVsDjMjHqTQBt9CPrQAcr0OPpQAKFDEhFBIwSFA49KAADaysMnbwMknHOe/0H5UALwXLYG445AxQAhUFmbkM3BI6mgAYA9T7YzQA5mL4yST79x/h7UAIx3c+nHAoAaKAFPoBQAuaAA8igAGBQAA0AIeo9c0AZ+vXd/Y6XLNpmnLqd6HjVLZpxCrAuodi5BxtUs3Q524HJrSmoyfvaIyqSlFe7qzh7bx34/m1Se0k+G7Qxrpn2pLo6xCYfteTi33YyRgffC8EgFQuHPUqNBq/tPw/4f+vuOJ18Sm17K/pL/OxFN4u+JRntGTwHbLGq+ZcRf2pE+7MhTy0k3LhgrRyklMYikUZZlIap4dL3qmvp/mN1cVdWp/j/AJGn4l8V+NtIv4INK8DDXbV1cPcw6lBCY3ATaSkjDKszNnByojY4YsAXGlhnq6j+718xTrYmP/Ltff6f5lVPF3j6K78TRyeBBcRWTM2lTLqcEa6kvZcbmMJBxywOck4TG0kqeG05J9Ff16kxrYqTa9n1fVbaW6sonxr8ULTQbWWT4dW+o6uxjSa3ttZhiiX91AzyBnJI+eSZNnzf6jO5gyk5qGHlJrnf3X/yNubFxim6ab9bf5m3qnibxnZ6lfRWvhAXtnDPCttcQ30ObqJlbzWKu6GIoQMD5t+4D5Rl1mMKDfvTsrb9n59xyqV0tIa9rrVet1b7jO1Lxb8RTYauLPwLCJhZ3EthJNqUJdp9zCGKSEPt6FSzCbH3sdADtGlhm1ep+H9fkYyr4mz5ad/O6/zJ7Xxn44/4QvU9XvPARg1eGN5INDXVIpJJSGYKplXK5KqrcD+LaATSVPDuSg6n4MJ1sTCHOqd/n69rkujeJ/G13rBF/wCEYYtLuGQwzpqC+ZbL9mt3ZZEb73717lNw2n90nyANvqXToXaU9V/mWp4vSXs9Hb8tfxINJ8RfEVfGYsdQ8JWTeH5Zbj/icQ6kqvDGs04hzCclmdFhJAIA3k55KIlDDuN1PUFUxXNb2d1935nQ+EtY8Qav5x1zQBoapGhjH2tJy8hZ94Gz+FQI8McFsnKrjFZVYQjbklf5P9TopTqS+ONtuq/zOj68VgdAn0oACvT60AUNd16x8NWUd5qMxgtpLq2s1cIWzNPOkEK8A43SSouTwM5JABND13BabHOeDvi94S8faDZ6xoGpSalY3kElzA8FnMWlRB85CbN3ByuMZ3Ky/eUiklbYbd9yHS/jb4H117RdJ1+LV1vJTDaTafDJcQ3TCO4kPkyRqyyfLaXABUkFomTO4YqrsmyNLTPiX4X1q402HTtatr1tTluIbFoCWW6aDHnmNgMMsZO1nB2hvlznIpDIx8U/Ca3mj2k+uW1ld6zxp0N7mB7s5ORGHA3kYGQOgdD0dSXcVkLf/FDwppfiePw9e67Z2WrSJK629yxjB8qJZpRuI27kidJGXOVV1YgBgaT13GtNi7p3jPR9Y1Braxuxe7dm6a1jeWFS0XmqDIqlASmGxno8f99ci02FZM5nwv8AHrwR4x8MaXr+m6s76bqsr29jJNaTRG4lVnXy1VkBLM0ciooyXKMqhmBAdwsjph400Z0v3hnmvYrLcsslnaSzplZDGyqyKQzLIrKyrkqUbIG04QJJaIjuPiD4bszIsuqQh0yoRQWaRhKIWRAOXdZWjjKLkhpY1PLqC7thZFC2+LfhK81DTLGDXLae51RtthFGSXvF2q3mQDH71Nrq5dcqEYOSFIJLsGr7lPSvjh4I1qzt7qy12K5gnvLmwQxRuzefAMypt25zyoAxli6AAlgKLthZI3T460JdLOpHUY10/wC1LZrdMrCJpWICAPjaQzMEVgSrMyqCSwFIZNpHjDSde1K70+xu1mv7NI3u7UqVltfMUOiyoRlHKFW2NhgGBI5FAGwe31oA57x/quhaH4YnvvEcYl0uGWFvL8oyu03mp5AjQAs0pm8rywvzb9m3nFAHEeFPFvwui1XT9B0eLS9Ku2s5rnS4LGERxT2sskzs9u8Y2EO0dxIFB3EIz7doDEA1JbjwTFpF1q9xoKpb6TNcSxPJah50mkkn3vbINziWZzJgxjfI0gXJfKqAHge/8AXKeD5NA0i0sLW4W7OgXT6b9lXMmZp0h3qrKZVVpsAASIhcblUkAFbxGfh94q1bRNL1/wAN2mp6nfWsyaRY6rYxtJPAYvMk8lZfugrHHvHBUmHzNu6PIBb1D4xeBdIstc1a6vYbW30zVPsmoXEsXlbL5YYSkeWxud4nhClchuEzu+WgBdP1vwdqfj3WvsWnmfxHptyun381vZt5sUsqQgqxAyymNbMswyu1IixxEfLAMXwtF8OH0Wey0jw1DHD4aa3vv7MXTwDp0txGJ4mjX7qybZmfeh+QySHIJagCbUvHvwwv/G2n+HLv7JeeJ9TcwWunw2zXDMrstyXBQMiRv5KzFyQG8kFiWjwACew+JXw/8T6ofDKqGbWNQ1LR1tZ7VkhvJ7Vm+3JsPGFKncWAD5GC2OADP0HxL8LtR8SeE7OHRbaw1pbvUdN0GKTTVElsbR5La4WF0BWKMrZsoGVzGFTAHyAA1PDGneAJtB0/V9B8LQW+msJb2CSPTPsjQFpQJJwjhGDMV8wSqMusasCR5eQDB8JfFr4Z/E7wj4Y1CawjtLXxLcyXumafq8cIkubiG58t22hmVpFkVZcAk4G8fcbaAdT4e8ZeE/8AhOdQ0y00xdN168uFjmuhaJGb11tIpgHlX7zrEQArHcRG5UMsblQDvzztHvQBk+Kdem8O6PJfQaRfa7MskUSafpio1xMzyLGNodkUAbtzMzKFVWJOAaAOS1X4nXNhPNcH4f8Aim7a0gvjFLDbRMHMRlGxV8wuWmFsxiIXDCSIMUMgFAG5aeL9SvNTngj8LakbWO8ltftjPFGgVIwwmIdlYxuxKKYw/OC21dxUAyNO+JV1rbx3dv4P8QwWo0m41Jft9o9vOWjMQ+z+SRxMS0ihWIJ8s7co+6gBfFfxOvtB8L65qWn+ENZ1PUNO0mDVIrB4Hj+1mUSkWyMqufOUxYdQp2+ZH13cAG3b+Kb6aa9Q+G9TjjtrmK381/LAlU48yWNSwdkTv8uW42hucAHNWPxgudQ066uovA3idTBrB0YW0toqSzOEDfaEy2022WC+cWA4JxxyAdHP4tura1v5pdBvw9vMscdtGm+WVfJjlZsrlBt3SJw5BaPaGLMq0AZvhz4lza/faLat4R8RaZ/aUN3NJPf2giislgk8rEzFuHkbDRqu4snzcAHAB23/AOqgBpgjadJyimVEZFfHIUlSRn0JVfyFADsUAGeaADFACc8fWgB4YqpXoG64oAb06cDtjt0/wFACliVCnoDkD0NADfboCMYHA/KgB5Y4+8aAGdySTz1560AOHynIJGepBoATGOhK+wOKAHBsFtoA3dcADNACcZoAC2aADtzQAlABj0oAD1GOmaAOf8d2fiC/8NTQ+GbyLT9YM0BSeZlAEYmQzAFopVDGISAEo2CRWtJwUv3i07GNZVJR/duzOW8MWvxVtrm4m1+58LXUTRiOGDTop4wjbmHmEuSSSNhYZx8uFwck9VsGlaKkvXX8Tiksa3duL/Bf18/kc/4N1D4463Pez69p/h/QRb6fItraMu6K4vW8sozGOaVvLXEi5yhw4baxwE1ksHBLlbev3Ew+uyvzJRt+JvXUPxT1Cw0m9sZ9B03UFULfabfwM0LMDMGKPG7MFIMJHOTtBOz5kbNPCxnJatdH9xb+tzjCWi7r77C+JR8VF0az/sr/AIR7+0Wa1FwUWRkjf7TD5rAORuhEImyuRIcgqysADMVhbdV/wxdR4q+lnv8A079DT1W0+IV74g02SyvNA0/RIZ4/tduySyzzx+V+8YPwF+diAgXP7tWMhDtEMV9X5XzJ39dNy2sS5JppfLXZ/wBI5uPRvjGNI01n1jw8dYtbRUlEZK2dzcCWQs8qm3MjBoxCuI2i2s8xwQEFdKnhXdSi7N/1rdfkzmdPGppqaul/WnK/zRqWcfxcOo34upfBa2C2ANo0Ud2ZHvNiZWTLYWLf5g3DLbdp25yKzcsO1tL71/ka8uKT05fuf+ZDd6b8Vzd2V9b6t4e85LKGK4sDE/2NpvNczSINvm52GLaTLt+VwY8sHVp4fVNMJLE3umhn9k/FaO+1HUI9Z0WaV7WGG20u5j/0COZZXE0oKRCdQ8axMqtK4V3lU7gEaiMsNdKUXZdVv076BKOJs3Fq76Pbr21Or8DQ+LobAr4vn0i4uyqup0dZVRGI+ZDv5Kg8KepXGeQWbGq6T1p3+Z0UVVV/a2+SOlFc50ADzQAfSgA7gDpmgBGYrj5S2eOMdfxoAwLHx1pOoeI59Age4bWILGHUZ7b7NJtiglZ1iJkx5eWaOQBQxb5GOMCgDN1z4w+E/Dt7DZ6jqMtpcTatb6FEj2sp3306looQwUjkK2WztBUgkHigDZfxno8KTyTXYtoYld2muFMaBUXezEngAKGJJxjB7c0AZ9p8T/Dl9ZeF7u2vJJrbxNbrd6W6W0n72BhEVlcFQY1PnwjL4AMig4YgUAVPDvxf8NeKbnUINMubm9ew1ibQboW9nK/k3kRXzEb5eFAZT5n3MHlhQBf1D4keHtLh1CS6vWhj0/UoNKuy0LnyriZoFiU4B6/a7c5HAEnJGGwAYdx8ePBVtr+uaM+sr/aOiabNq+oQLDIzW1tFy7uApwdrRuF+8yyIwUqwagDbvPiHpOnQ2E1yt7bw3elTayXltHRoLeLyd4kjYCRX/fr8hTcMMCARigButfEbS/Dtha6jqEN9baXcoXW7ltWjMai3luH8yJ8SoVjhYkFM5IGM5AAHWvxF0O78O2utwzyPp1zJaRQymJgXe6MQtxtIyN3nwnkfLv8AmxhsAEMfxR0O805b6wF5d2p1BdO81rZrZS52fOpn8sSIA/3oy24qyLucFaAMlfjt4Wk1fSNLVtQ/tHUb1LJbe4sJbVoi8N1LHKyziNjE4srhVkVSCUyPl+agClof7SPgTxJe+FYdM1SS6tvE0FxNp+oG2kitj5VzHbFZGdVMbPNJ5abgAzgKDueNXAPT+4+tAGR4r1258P6VDdWmnTapO9/ZWpggB3JHNdRQyTHCt8sSSNK3GMRnJAyQAcN4c+J/iTxB4d8ManqvgrUtFN/o9/qmpafJBJJcW0kLxLFaYKpiSUSMwyBuMZAB5IANn/hZVzcPpPleFdfMd1b2d7K89oF8lbgTkJktgSxNEglDEKglTk5xQBGfi0Yr3xBYz+FPE5k0SK0Y3aaf+4v2mjL4tZC2JPLICSMwRUYjcwXLAAo23jTw14jn0HX4PD+p6pMLC41GO/tLYzpZ4SH5JPKLZmeO7YxFA4dDM0bFXy4Bfb4kP9jutVj0a+1LR47OO9sJNHQ3kt/HsjdihVfJ/wCWsYUiVvMKybeEJoAuHx1cQ6vr9lLoGpQ2+mQR3SX5hAtp0MTOyK7Eb5FaOQMFGF3pk5JoAyvE/jS+k8O+Hmg8K6xqEXiDU10a/s5InhuNLifzRNPKyBx5aMm0ur+WwYNHIVKswBa1PxleaBZ6Zpuh+FtWuPNmawWVYQ1vpscdwlv51wC4ZkIcSKEyzopJKAMygBb/ABEurm98Ni08Ma0LfVrm+gmkntfLNitssm2WT7wCTNEPLyVDLKpyOhAMbSPi9qd74c8STXvhLWbfXdG1Nozoyw77i5sjevDFcQhWO4NHHI3UAtG2MpsdgDsJ/Ghs/EMukxaBq9zdrZS35uIrYC1KxuirF5+7yzK5ZtqFgfkctsG3IBt6dfR6pY2t5F53lzolwi3MLwypuUEB45FV0YA4KsoYHggEYoAs7towMAAYGBj/AD3/ADNADSOnrmgDP8QX19punrPp2mNq9x9ot42tkmSIiJ5kSWQFuD5cbPJt6ts2jlhQBz2m+KvFlw1it54K+xedpX2qcjVI5Bb325V+yEhfmXlj5y8YXlRngAjTxR4wk02eRvCa2ly1xPDBB9tSRlgBkSGY4G0l8QuULKVWV+SY8MAWvCfi3XdY8V61pureFn0OwsobWa01BrxJlvTIp81NigFDG6svJO4bWGA1AHQaTPJd6fFNJHJE8mX8uWMo6AkkKQSeQOM98ZHBoAtg4oAOh9aAF680AA6UAA4NAATQAnUYoAMbTQAe9AATnH1oAjuLmG0jDzzRwpnG6Rgoz6ZNAFc61YdPt1tj/rqv+NAB/bWn4/4/rb/v6v8AjQAHWbAAf6db8HP+uXr+dAANZ08c/brb/v8AL/jQAf2xYDre23/f1f8AGgA/tnT8f8ftv/39X/GgA/tnT8f8f1tj/rqv+NAC/wBs2H/P9bf9/V/xoAQazp/e+tv+/q/40AA1nT+99b/9/l/xoAP7Z0//AJ/rf/v6v+NAB/bVgf8Al+tv+/y/40AB1nT/APn9tv8Av6v+NAFiC5iuow8E0cyZxujYMAfT+VAGP42fxF/wjV2nhOPTn8QSbUtX1ff9kiyw3PKE+dgF3EKvJO0ZAJIAPO7jxN8W5vEqXEPhn7LoU+k3E32WaK0nnt71JbgwRNi+QfPGLfcVZ1ZiOYcuyAE+uT/Fi1s7PVLA2V68mlQNcaM2kxPLBehohJ5YOoRJllluMgzuqi3QKzMSZADbhvfiAmp+I0u7Kwn09NUtItIksoAkr2TNbm4eXfckFlEtwowEP+jFgj+YqUAZvgrxD8Uzr2pWfi3QbAaTb6iLayvtJhQfa7XFxi4ZGu3aPpbgrgkEnghyYQChpF/8YdP1Oze50+w1XSbrVLgXC3bRR3un2i3bpDsEbiKYPAYpCcq0e2TKysViABQTxB8bLOe6gTw9Z3duNW1YQzTwWxJslkZrE5W9TkxlQMpucjZIIcfaHAOr126+I1tD4ek0+Gwu5JfEsa6jFHZoiwaOyuGLb7r5pEO1vMQ5JxiFhkEAzPCfjj4i3njuWw1/wiNL0G4LtZyusQlRAZ23SSR3UqEqq2iFcKzvcsUBSB2IBUtvEXxmu724jk8LaJY2kz2T200kgkaGKWeI3SzILjBkt4ZJFGw7ZmheQMg8uGQAyNW8ZfGbwv4C8Wa1deHrfU9Zt9SeLS9NtLL7Y72fl24icLFOHk/eeeGztZt4kKxKpjAB2Gr6v8SovGk8OmaTYz+HIrjTwJbi3RHlhkkjW7McgvCSY0d5PnhT/VFFEpYNQB6RQAd/woAPTjvQBheMrHV9R0MJocscWox3lpOvnTvAkiR3McksbOisQHjR0+6Qd2DwTVxaj8XZmc05fB3Rxeg6H49u7i+/tPXr7TmtmNtYxxNaeTdL9niUOzNDI/8ArllbLfNhhlTytd06mH+xHfX89DzoUsU9ZStbT8iPS/DPxQ0fSpbUeILLUWh0H7Nby3U4yb/ag81m+zFiF/eYJY7gE3Ju3OcJSoy6NG6hiI/aRf0zT/iRa6XdfbdR06+uZLW7WIRyKrwS75mtyP3CLIwUwoxby1OM7RgmSKjpte4jWlGtFt1GZ3gfwf8AFCeXXIvGXjcJC91C2mvoUdsJI4Qjq8cvmWYBJYoxcY3FAVWJSUbA6SvqHhD4tX3giGCz8bLpfiYCJXuZGtbqPAuWMrFhp8YJNu+B+5UB4owcjeXALl/4Z+Kdzruo3Vt4qs00qR4BZ2KtFEyobyaSZndrNyrC3NvEqgEYEoYhyswAFtfC/wATbjwd4Z+1+MY4PE9m9xJqhghtza32RKYozm1DKocQj5AjBGkyzsFegChofhj4vw6TCb7xdYzag2j3iPFJ5MsKakWQWkmRZRMYlUSM/IJZwAu0cgEUHhn4xz+E9c0+XxDptvrK31ld6JqDXiz5hURC4gugljCCpKSONgDP5vl7owm4gFi+8HfFK+8H+JrRfFFrDr0q2R0a+e5Rkt2TYZt6pZxnLHcGLeYsh5Edup8oAEumWPxPHirxtZvcb9DXT7WDw/rF/dQI7XIgVZJDDHA3LSGVneUbFKxCOFgz4ALPhPwt8SLO48KzeIvE8WpywX19caxFbSRxW7QvG6W0USi0V5FQlT8zoQdxJlGwKAeofjQAHgigD//Z"},{"timing":1200,"timestamp":18295071816,"data":"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"},{"timing":1500,"timestamp":18295371816,"data":"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"},{"timing":1800,"timestamp":18295671816,"data":"/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRQBAwQEBQQFCQUFCRQNCw0UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFP/AABEIAMAAeAMBEQACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/APjKgAoAKACgAoAKACgAoAKACgAoAKACgAoAKAPRf2dfCWlePPjj4M8Pa5am+0jUb9YLm3EjR+YpB43IQw/AigD2+b9nbwF8UrvwbBomoWngrWLi38vxBZeHWn8R6fZXEt6ILFTdJJJFGZlLlg9xxsUBdxAYA8t8Z/s6XXgn+2oL/WY/7R0rw/LrNxBDb7oxLHrB0x4FfeCRuUybyOnG3vQAzxX4C0PTvHXx6062sBFaeGPtP9kR+dIfs2zW7S2Xkkl/3MsifOT97P3gCADrNW/Z78H6Lc6t4bj8a2N/eWninS9EvvEtxazWkGleY2prcxlHcK+BZwvuOFyxUPj5yAdQv7I3h660Cbw4NcuLDxr/AMJLc6VptxfaTcRSai66Za3UdrJD5hjt0DyyDzsvncpXehDAA+TD1OKACgAoAKACgAoAKACgAoA3PBOqa5oXiez1Xw3cSWms6cJL2C4jKgxeUjSO/wA3HCKx5oA6nwTqHxF8EXF3ZeG5rnSDqa2c80S+UIpNrxy20v7zKh42kjdZBhoyScr8xoALz4l/EjxTpl7pFzqGo6nZ6zLLJNC9uH+0Gab7U67tudhlzKFB2qzOwA3NkAyNe1bxda+IPFUmqm4/tPWJpYdZkdAftD+cty4ZgMf62JJMrx8g7ZoAJ/F/i6+ub67nee5fV9Sj1m7aW0V0vLtS+2R1K7XB+0uNuCredgghgKANpfi58SV1Czvk1S/F3Zai9/aSR26nyLny44P3YC4G2OOKMRgbVVVAA4oA8/ubK5gj8+W2khiZtu8oQueeM/gfyNAFegAoAKACgAoAKACgAoAvaJruoeHL9b7S7uSxvUV0S4hOHTcpUlT2OGIyMEZ4IPNAHQN8XPGBmtpv7Z8y4t4xHHNPawyuQDGQXLLl2BhiIdssDGpByM0AC/FPXl8LaboPmWxtdOv/AO0LaQ26l0kw4xg/KVzI5wVOdxBJX5aAFf4ueLn8gf2zKqw3Ut6oREB86TzN7ZxnnzZMg5B3dMcUAVp/iZ4nuZ0ml1id5Yt/kuQuYQwkUhMAbRiVxhcYyMY2rtAJLj4ma5cwaIHmjN3o8009vfMpeZmklMrby5IPzFuwyG5zgYAKHiLxrrPizB1W7S7cbQJGt41cKrSMACqgjLSyM2PvFsnJAwAYlABQAUAFABQAUAFABQB+ky/sHfCiZ1it7XW7m4fIjgj1ABpCBnAJAA4BPJA460AU7z9hz4Xadq8OlXWla3banNbvdR2cuvWSzPCuN0gQy5KjPJxgUAX7T/gn74Bv4BNb+GvEk8RZl3x6xaMNykqw4k6hgQR2IIoAm/4d5eCP+hU8T/8Ag2tf/jlAB/w7y8Ef9Cp4o/8ABta//HKAD/h3l4I/6FTxR/4NrX/45QAf8O8vBH/QqeKP/Bta/wDxygCH/hgb4XLMLeWx123uyQv2eTUF3AnoMgEHORyCR70AbMf/AATj+GEysYv7Qm2MUYx6mTgj7w/1fbPPpQAL/wAE4vhhK8qRtfu8TbJFXVCTG20NtYeXwcMDg+tAD/8Ah258NP7mpf8AgyP/AMboAP8Ah258NP7mpf8AgyP/AMboAP8Ah258NP7mpf8AgyP/AMboAP8Ah258NP7mpf8AgyP/AMboAqan/wAE8PhdpMCTTx6rsZgg2ajnnk/3B6UAe1WPgjxlpt9BdwW8KTwsShFwvcFT+YJGRyM8c0AS3PgjxJcXlncx6FYWMtpbx2sQ0+8ktY1hjlSVI9kUigqGQcEYKllOVdgQDS8PaZ428L6Pb6bpumWENrDuP7y5aWSR2Ys8kkjuzu7MSzOxLMxJJJJNAGj9u+Io/wCXHTvwcf8AxVAB9u+Ih/5cdO/Fx/8AFUAH274ij/ly078HH/xVAB9t+IvX7Dp+P98Z/wDQqAMC48L+OLzWP7Tmiga68wSbvNQAEdAAOwwB6+uTzQBW1f4Z3+vanqGoX3haynur7Z9okGpTKXCDCqcSfdHB29Mqp/hGADe0jSvE2hG4Nj4d0+Dz9nmf6WzZ2KFXq5wAoAwMDigDQ+1+Nf8AoC6f/wCBH/2VAB9r8a/9AXT/APwI/wDsqAD7X41/6Aun/wDgR/8AZUAH2vxr/wBAXT//AAI/+yoAy/EGm+NfENrHbSadZQRo4kAjuOpwRyST6mgD07PNABnFACYOKADpQAowe1ACdaAFzxQAnYigA6D60ABOKAFwaAE78DmgANAC0AJ3H1oArapZvqFn9nSd7UmSNzLH1wrqxX8cYPXgmgDG0TwzqWkWlykmutfyt5QikuLbOxVABH385IA5yMHLck0AQWng++t2tC2v3z+VIruWckvteZsHJOciVQe/7tfwALGveGr/AFmR5V1mSycCVEFujKMPGoycONzBlyCT3xgigDT0rTX01bsPdSXZnuJJ1Mn/ACzVmyEAyeB0oAvD3oAO1AC9sUAA560AJnigBcUAJQAuOcUAJQAE/d+tAHO+P7nxPaeG93g63srnXpL2ygX+0YzJBFbvdRJdTMokjLGO3aaQKHBJQAZJwQDxifwv8bdW8ZxxX2opB4auvFkepySWF4IpbTSzbX8f2RsYPy+VpjER7wZ55juMQ+UAoazL+0dYXvxPtdD06yn0+e5vJfDl5dyW8lyu6wuzCIi1wERVuobFAssZH+kSM3yglQDTsfFv7RWoJ42a58E+H9M/s6C+l8PEzLI+ryq04s4ZUF5tt8j7MzsXdSBIMoWBQA5XxXrv7Uuo69FaWPhHR47PSrnULmHUYJ47WK/aEulkkifbpHeCZWWR1IRg3y4ATe4B6Hb698WpPil4HkuvBsy+GLrQrc61cW+rWqR2F/JvM8bW5dmcR7IxuV35ZNjFfO3gFK+ufjr4d1GZNO0rTvE1u72ywy3lzCuIWt7+SQOqvFseO5+xQs4EmYWSQCSTeqAE/hPxB8bF8V6SureENPTSNQ1CX+15ZL1B/Z0S2liI/s2yeQyI032zllVjtyVj/jAOE8N3n7SHhHRdIOm+GpvEEsh0iDV7XxhqVm8iS+VcnU7m2lgn4hLC0VFcswJbbEBk0AVfDHjr9p/wR4Bkt9X+H1hrT6PoNt5F9JKlxeXc8OkSvcecsd87yyPfpbxqUXLq0hIUsCoBW8KfFv8AaE+It/p8J8DPol7pcP8AaMjXOlXOn2d08vh+UrA/n3KmQR6lLHGyA5I2tmMxuwAOv0H4k/GXxJ4w+JnhHVPCVzoy6SZX0fWdN0/y11K23W2021zPM9uLoxPcMqSDyxIYg5AimBAMW+1f9odba18OaP4G1CPRzf2//E513W7GfUI7Rbi8aTzJYLiP5ysenYVUkwklwrSO20gAu/BnxD+0s3xPs4/G3grSbHwbrFybnVLx76J59MKaTCnk20SXcoWFryNipzIx3uzLHuGAD6d9PXNAGD488a2Xw88NS63qFte3VrHcW1sYtPgM8zPPPHBGFjHLfPKvAycZwCeKAKSfFbwk19PYDW7dtUgs476bTE3PeJDI/lqTAAXzvITaF3BmUEZYZALVh8Q9B1bS7DUtLvl1jT74uttd6cPPhkKttP7xcqBkNgkgNj5SeKAOWk/aL8C202ufbNUk06x0WCKa+1S8t3SzhaS6ltfLaXG0Ms0LKc4Xngna+0A6TSPiZ4c11rIWuoI8eoXLWthKykJelYPPLxH+JDFlg/AYYZcqykgGL4M+PHgvxutlDa6vDY6xcrCW0S+ljS9t2lhE0ayorMFJRh0JG75c7gVoA0F+MPhBvEdpoCawsmq3N3JYpDHBKwSZPtW5XYLtT/jxu8biM+S2M8ZAKGnfHfwZqHiXWfDx1QWmt6ZPbwy6fcjbcSLOtr5UqxAl/LZ72CIMyr8+4dBmgDpx4w0kanZadLdm2vr24ltbWC5ieJriWNGd1j3AB/lRzkZBCNg8GgDlrL4+eCZ9Th0+61ZdJ1C58v7JZalGYLi73w28qiKI/OzH7VEgTG8uGUKSpoA2YviZoEunX98LmQw2OpPpM6wwPcOlyr7dm2IOecoR/vqDhjigCtL8Y/CUVvqk39pvJbaZzdXkNrNJbIPsiXgImVShBgkRwQxznHXigCWH4reFp9OtNRXUidPu7qezguxbTNC8kLukh3hCFjHlu3mEhNiM+7aCaALvhH4gaB47tBc6DqC6nbNu2zwRuY22na2Gxjhty/70ci9Y3CgHQddp96AOB+O3jzR/hh8MNS8U69ow1/StKntLmWzWON5Mi5iCyRiT5fMjYiReRhkX5l+8ADhfF3jz4YWviGx8M674Iml1PXrtNLlgi0+3nLO0ttdPFdNHIRtEt6JHRiQzM7YYSoZQDD8AfHX4ReMry31Lw14HSW/+z3uvRMthp0U8VxsZZwoMwcXM0cLYIH7xI87iilgAdFqvjX4Z6ffa54b1X4brax6jDd6jdQyaRaT2mpxWardeY7Ru0b7vOLoHO4M2WCF03gGanx5+GfhyTURD4KudM1Hw3fXKyWr6bZQS29y0lvHNKpMoEYd7tQ07MqMEkYuUAZgDU8O+MfAHiq88U3Xh/wCHiXeoaBqy6PeS/wBm2cMj3MF1bxwxo5bJ+aKJoycKv2dAxjZVAAKnwz+N/wAO/HWht408PeCry205taj099Tm0qCGb7XLJGI5CA5fDtqUrB/9u4JwZB5gB6J4W8CeAdV0TStb0rwb4ftIb61t7mB4bC0dljIhkjXzItyNt8m3KlGZcwxlSQqmgDdsPBHhzTLxruz0DTLS6a9fUTLb2kaE3LpskmyFz5joSrP95lJBJBoArz/DbwhcmUzeFNFm843JkEmnwsGNwwa4P3espClz/HtG7JFAFq08F+H9P1O91Gz0HTLa8vpFmuriG0RZLiVCSkkjADeylmILZILE96AIY/APhqO0u7UeHdIFvdxLb3MX2CIJPGqeWqSLtwyiMBADwFGBgcUATWXg3QNP0x9Nt9D06LTnkklazjtY1hLSbhI2wDG5w7hjj5gxz1OQBnhrwP4f8GR+XoGh6focPkJbCDTbVLeNY0eR1RVQABQ80rYHGZGPUmgDb6EfWgA5XocfSgAUKGJCKCRgkKBx6UAAG1lYZO3gZJOOc9/oPyoAXguWwNxxyBigBCoLM3IZuCR1NAAwB6n2xmgBzMXxkkn37j/D2oARju59OOBQA0UAKfQCgBc0AB5FAAMCgABoAQ9R65oAz9eu7+x0uWbTNOXU70PGqWzTiFWBdQ7FyDjapZuhztwOTWlNRk/e0RlUlKK93VnD23jvx/Nqk9pJ8N2hjXTPtSXR1iEw/a8nFvuxkjA++F4JAKhcOepUaDV/afh/w/8AX3HE6+JTa9lf0l/nYim8XfEoz2jJ4DtljVfMuIv7UifdmQp5aSblwwVo5SSmMRSKMsykNU8Ol71TX0/zG6uKurU/x/yNPxL4r8baRfwQaV4GGu2rq4e5h1KCExuAm0lJGGVZmbODlRGxwxYAuNLDPV1H93r5inWxMf8Al2vv9P8AMqp4u8fRXfiaOTwILiKyZm0qZdTgjXUl7LjcxhIOOWBzknCY2klTw2nJPor+vUmNbFSbXs+r6rbS3VlE+NfihaaDayyfDq31HV2MaTW9trMMUS/uoGeQM5JHzyTJs+b/AFGdzBlJzUMPKTXO/uv/AJG3Ni4xTdNN+tv8zb1TxN4zs9SvorXwgL2zhnhW2uIb6HN1Eyt5rFXdDEUIGB82/cB8oy6zGFBv3p2Vt+z8+45VK6WkNe11qvW6t9xnal4t+IpsNXFn4FhEws7iWwkm1KEu0+5hDFJCH29CpZhNj72OgB2jSwzavU/D+vyMZV8TZ8tO/ndf5k9r4z8cf8IXqer3ngIwavDG8kGhrqkUkkpDMFUyrlclVVuB/FtAJpKnh3JQdT8GE62JhDnVO/z9e1yXRvE/ja71gi/8IwxaXcMhhnTUF8y2X7NbuyyI33v3r3KbhtP7pPkAbfUunQu0p6r/ADLU8XpL2ejt+Wv4kGk+IviKvjMWOoeErJvD8stx/wATiHUlV4Y1mnEOYTkszosJIBAG8nPJREoYdxup6gqmK5rezuvu/M6HwlrHiDV/OOuaANDVI0MY+1pOXkLPvA2fwqBHhjgtk5VcYrKrCEbckr/J/qdFKdSXxxtt1X+Z0fXisDoE+lAAV6fWgChruvWPhqyjvNRmMFtJdW1mrhC2Zp50ghXgHG6SVFyeBnJIAJoeu4LTY5zwd8XvCXj7QbPWNA1KTUrG8gkuYHgs5i0qIPnITZu4OVxjO5WX7ykUkrbDbvuQ6X8bfA+uvaLpOvxaut5KYbSbT4ZLiG6YR3Eh8mSNWWT5bS4AKkgtEyZ3DFVdk2RpaZ8S/C+tXGmw6drVtetqctxDYtASy3TQY88xsBhljJ2s4O0N8uc5FIZGPin4TW80e0n1y2srvWeNOhvcwPdnJyIw4G8jAyB0DoejqS7ishb/AOKHhTS/E8fh6912zstWkSV1t7ljGD5USzSjcRt3JE6SMucqrqxADA0nruNabF3TvGej6xqDW1jdi927N01rG8sKlovNUGRVKAlMNjPR4/765FpsKyZzPhf49eCPGPhjS9f03VnfTdVle3sZJrSaI3Eqs6+WqsgJZmjkVFGS5RlUMwIDuFkdMPGmjOl+8M817FZbllks7SWdMrIY2VWRSGZZFZWVclSjZA2nCBJLREdx8QfDdmZFl1SEOmVCKCzSMJRCyIBy7rK0cZRckNLGp5dQXdsLIoW3xb8JXmoaZYwa5bT3OqNtsIoyS94u1W8yAY/eptdXLrlQjByQpBJdg1fcp6V8cPBGtWdvdWWuxXME95c2CGKN2bz4BmVNu3OeVAGMsXQAEsBRdsLJG6fHWhLpZ1I6jGun/als1umVhE0rEBAHxtIZmCKwJVmZVBJYCkMm0jxhpOvald6fY3azX9mkb3dqVKy2vmKHRZUIyjlCrbGwwDAkcigDYPb60Ac94/1XQtD8MT33iOMS6XDLC3l+UZXabzU8gRoAWaUzeV5YX5t+zbzigDiPCni34XRarp+g6PFpelXbWc1zpcFjCI4p7WWSZ2e3eMbCHaO4kCg7iEZ9u0BiAaktx4Ji0i61e40FUt9JmuJYnktQ86TSST73tkG5xLM5kwYxvkaQLkvlVADwPf8AgC5TwfJoGkWlha3C3Z0C6fTfsq5kzNOkO9VZTKqtNgACRELjcqkgAreIz8PvFWraJpev+G7TU9TvrWZNIsdVsY2kngMXmSeSsv3QVjj3jgqTD5m3dHkAt6h8YvAukWWuatdXsNrb6Zqn2TULiWLytl8sMJSPLY3O8TwhSuQ3CZ3fLQAun634O1Px7rX2LTzP4j025XT7+a3s282KWVIQVYgZZTGtmWYZXakRY4iPlgGL4Wi+HD6LPZaR4ahjh8NNb339mLp4B06W4jE8TRr91ZNszPvQ/IZJDkEtQBNqXj34YX/jbT/Dl39kvPE+puYLXT4bZrhmV2W5LgoGRI38lZi5IDeSCxLR4ABPYfEr4f8AifVD4ZVQzaxqGpaOtrPaskN5Pas325Nh4wpU7iwAfIwWxwAZ+g+JfhdqPiTwnZw6LbWGtLd6jpugxSaaoktjaPJbXCwugKxRlbNlAyuYwqYA+QAGp4Y07wBNoOn6voPhaC301hLewSR6Z9kaAtKBJOEcIwZivmCVRl1jVgSPLyAYPhL4tfDP4neEfDGoTWEdpa+JbmS90zT9XjhElzcQ3Plu20MytIsirLgEnA3j7jbQDqfD3jLwn/wnOoaZaaYum69eXCxzXQtEjN662kUwDyr951iIAVjuIjcqGWNyoB3552j3oAyfFOvTeHdHkvoNIvtdmWSKJNP0xUa4mZ5FjG0OyKAN25mZlCqrEnANAHJar8TrmwnmuD8P/FN21pBfGKWG2iYOYjKNir5hctMLZjEQuGEkQYoZAKANy08X6leanPBH4W1I2sd5La/bGeKNAqRhhMQ7KxjdiUUxh+cFtq7ioBkad8SrrW3ju7fwf4hgtRpNxqS/b7R7ectGYh9n8kjiYlpFCsQT5Z25R91AC+K/idfaD4X1zUtP8IazqeoadpMGqRWDwPH9rMolItkZVc+cpiw6hTt8yPru4ANu38U30016h8N6nHHbXMVv5r+WBKpx5ksalg7Inf5ctxtDc4AOasfjBc6hp11dReBvE6mDWDowtpbRUlmcIG+0JltptssF84sBwTjjkA6OfxbdW1rfzS6Dfh7eZY47aNN8sq+THKzZXKDbukThyC0e0MWZVoAzfDnxLm1++0W1bwj4i0z+0obuaSe/tBFFZLBJ5WJmLcPI2GjVdxZPm4AOADtv/wBVADTBG06TlFMqIyK+OQpKkjPoSq/kKAHYoAM80AGKAE54+tADwxVSvQN1xQA3p04HbHbp/gKAFLEqFPQHIHoaAG+3QEYwOB+VADyxx940AM7kknnrz1oAcPlOQSM9SDQAmMdCV9gcUAODYLbQBu64AGaAE4zQAFs0AHbmgBKADHpQAHqMdM0Ac/47s/EF/wCGpofDN5Fp+sGaApPMygCMTIZgC0UqhjEJACUbBIrWk4KX7xadjGsqko/u3ZnLeGLX4q21zcTa/c+FrqJoxHDBp0U8YRtzDzCXJJJGwsM4+XC4OSeq2DStFSXrr+JxSWNbu3F/gv6+fyOf8G6h8cdbnvZ9e0/w/oIt9PkW1tGXdFcXreWUZjHNK3lriRc5Q4cNtY4CayWDglytvX7iYfXZX5ko2/E3rqH4p6hYaTe2M+g6bqCqFvtNv4GaFmBmDFHjdmCkGEjnJ2gnZ8yNmnhYzktWuj+4t/W5xhLRd199hfEo+Ki6NZ/2V/wj39os1qLgosjJG/2mHzWAcjdCIRNlciQ5BVlYAGYrC26r/hi6jxV9LPf+nfoaeq2nxCvfEGmyWV5oGn6JDPH9rt2SWWeePyv3jB+AvzsQEC5/dqxkIdohivq/K+ZO/rpuW1iXJNNL5a7P+kc3Ho3xjGkaaz6x4eOsWtoqSiMlbO5uBLIWeVTbmRg0YhXEbRbWeY4ICCulTwrupRdm/wCtbr8mczp41NNTV0v605X+aNSzj+Lh1G/F1L4LWwWwBtGijuzI95sTKyZbCxb/ADBuGW27TtzkVm5YdraX3r/I15cUnpy/c/8AMhu9N+K5u7K+t9W8PecllDFcWBif7G03muZpEG3zc7DFtJl2/K4MeWDq08PqmmElib3TQz+yfitHfajqEes6LNK9rDDbaXcx/wCgRzLK4mlBSITqHjWJlVpXCu8qncAjURlhrpSi7Lqt+nfQJRxNm4tXfR7de2p1fgaHxdDYFfF8+kXF2VV1OjrKqIxHzId/JUHhT1K4zyCzY1XSetO/zOiiqqv7W3yR0ornOgAeaAD6UAHcAdM0AIzFcfKWzxxjr+NAGBY+OtJ1DxHPoED3DaxBYw6jPbfZpNsUErOsRMmPLyzRyAKGLfIxxgUAZuufGHwn4dvYbPUdRltLibVrfQoke1lO++nUtFCGCkchWy2doKkEg8UAbL+M9HhSeSa7FtDEru01wpjQKi72Yk8ABQxJOMYPbmgDPtPif4cvrLwvd215JNbeJrdbvS3S2k/ewMIisrgqDGp8+EZfABkUHDECgCp4d+L/AIa8U3OoQaZc3N69hrE2g3Qt7OV/JvIivmI3y8KAynzPuYPLCgC/qHxI8PaXDqEl1etDHp+pQaVdloXPlXEzQLEpwD1+125yOAJOSMNgAw7j48eCrbX9c0Z9ZX+0dE02bV9QgWGRmtraLl3cBTg7WjcL95lkRgpVg1AG3efEPSdOhsJrlb23hu9Km1kvLaOjQW8Xk7xJGwEiv+/X5Cm4YYEAjFADda+I2l+HbC11HUIb620u5Qut3LatGY1FvLcP5kT4lQrHCxIKZyQMZyAAOtfiLod34dtdbhnkfTrmS0ihlMTAu90YhbjaRkbvPhPI+Xf82MNgAhj+KOh3mnLfWAvLu1OoLp3mtbNbKXOz51M/liRAH+9GW3FWRdzgrQBkr8dvC0mr6RpatqH9o6jepZLb3FhLatEXhupY5WWcRsYnFlcKsiqQSmR8vzUAUtD/AGkfAniS98Kw6Zqkl1beJoLibT9QNtJFbHyrmO2KyM6qY2eaTy03ABnAUHc8auAen9x9aAMjxXrtz4f0qG6tNOm1Sd7+ytTBADuSOa6ihkmOFb5YkkaVuMYjOSBkgA4bw58T/EniDw74Y1PVfBWpaKb/AEe/1TUtPkgkkuLaSF4litMFUxJKJGYZA3GMgA8kAGz/AMLKubh9J8rwrr5jurezvZXntAvkrcCchMlsCWJokEoYhUEqcnOKAIz8WjFe+ILGfwp4nMmiRWjG7TT/ANxftNGXxayFsSeWQEkZgioxG5guWABRtvGnhrxHPoOvweH9T1SYWFxqMd/aWxnSzwkPySeUWzM8d2xiKBw6GZo2KvlwC+3xIf7HdarHo19qWjx2cd7YSaOhvJb+PZG7FCq+T/y1jCkSt5hWTbwhNAFw+OriHV9fspdA1KG30yCO6S/MIFtOhiZ2RXYjfIrRyBgowu9MnJNAGV4n8aX0nh3w80HhXWNQi8QamujX9nJE8NxpcT+aJp5WQOPLRk2l1fy2DBo5CpVmALWp+MrzQLPTNN0Pwtq1x5szWCyrCGt9NjjuEt/OuAXDMhDiRQmWdFJJQBmUALf4iXVze+GxaeGNaFvq1zfQTST2vlmxW2WTbLJ94BJmiHl5KhllU5HQgGNpHxe1O98OeJJr3wlrNvrujam0Z0ZYd9xc2RvXhiuIQrHcGjjkbqAWjbGU2OwB2E/jQ2fiGXSYtA1e5u1spb83EVsBalY3RVi8/d5Zlcs21CwPyOW2DbkA29Ovo9UsbW8i87y50S4RbmF4ZU3KCA8ciq6MAcFWUMDwQCMUAWd20YGAAMDAx/nv+ZoAaR09c0AZ/iC+vtN09Z9O0xtXuPtFvG1skyRERPMiSyAtwfLjZ5NvVtm0csKAOe03xV4suGsVvPBX2LztK+1TkapHILe+3Kv2QkL8y8sfOXjC8qM8AEaeKPGEmmzyN4TW0uWuJ4YIPtqSMsAMiQzHA2kviFyhZSqyvyTHhgC14T8W67rHivWtN1bws+h2FlDazWmoNeJMt6ZFPmpsUAoY3Vl5J3DawwGoA6DSZ5LvT4ppI5Inky/lyxlHQEkhSCTyBxnvjI4NAFsHFAB0PrQAvXmgAHSgAHBoACaAE6jFABjaaAD3oACc4+tAEdxcw2kYeeaOFM43SMFGfTJoArnWrDp9utsf9dV/xoAP7a0/H/H9bf8Af1f8aAA6zYAD/Trfg5/1y9fzoABrOnjn7dbf9/l/xoAP7YsB1vbb/v6v+NAB/bOn4/4/bf8A7+r/AI0AH9s6fj/j+tsf9dV/xoAX+2bD/n+tv+/q/wCNACDWdP731t/39X/GgAGs6f3vrf8A7/L/AI0AH9s6f/z/AFv/AN/V/wAaAD+2rA/8v1t/3+X/ABoADrOn/wDP7bf9/V/xoAsQXMV1GHgmjmTON0bBgD6fyoAx/Gz+Iv8AhGrtPCcenP4gk2pavq+/7JFlhueUJ87ALuIVeSdoyASQAed3Hib4tzeJUuIfDP2XQp9JuJvss0VpPPb3qS3BgibF8g+eMW+4qzqzEcw5dkAJ9cn+LFrZ2eqWBsr15NKga40ZtJieWC9DRCTywdQiTLLLcZBndVFugVmYkyAG3De/EBNT8Rpd2VhPp6apaRaRJZQBJXsma3Nw8u+5ILKJbhRgIf8ARiwR/MVKAM3wV4h+KZ17UrPxboNgNJt9RFtZX2kwoPtdri4xcMjXbtH0twVwSCTwQ5MIBQ0i/wDjDp+p2b3On2Gq6TdapcC4W7aKO90+0W7dIdgjcRTB4DFITlWj2yZWVisQAKCeIPjZZz3UCeHrO7txq2rCGaeC2JNksjNYnK3qcmMqBlNzkbJBDj7Q4B1eu3XxGtofD0mnw2F3JL4ljXUYo7NEWDR2VwxbfdfNIh2t5iHJOMQsMggGZ4T8cfEW88dy2Gv+ERpeg3BdrOV1iEqIDO26SSO6lQlVW0QrhWd7ligKQOxAKlt4i+M13e3EcnhbRLG0meye2mkkEjQxSzxG6WZBcYMlvDJIo2HbM0LyBkHlwyAGRq3jL4zeF/AXizWrrw9b6nrNvqTxaXptpZfbHez8u3EThYpw8n7zzw2drNvEhWJVMYAOw1fV/iVF40nh0zSbGfw5FcaeBLcW6I8sMkka3ZjkF4STGjvJ88Kf6ooolLBqAPSKADv+FAB6cd6AMLxlY6vqOhhNDlji1GO8tJ186d4EkSO5jkljZ0ViA8aOn3SDuweCauLUfi7MzmnL4O6OL0HQ/Ht3cX39p69fac1sxtrGOJrTybpfs8Sh2ZoZH/1yytlvmwwyp5Wu6dTD/Yjvr+eh50KWKespWtp+RHpfhn4oaPpUtqPEFlqLQ6D9mt5bqcZN/tQeazfZixC/vMEsdwCbk3bnOEpUZdGjdQxEftIv6Zp/xItdLuvtuo6dfXMlrdrEI5FV4Jd8zW5H7hFkYKYUYt5anGdowTJFR02vcRrSjWi26jM7wP4P+KE8uuReMvG4SF7qFtNfQo7YSRwhHV45fMswCSxRi4xuKAqsSko2B0lfUPCHxavvBEMFn42XS/EwESvcyNa3UeBcsZWLDT4wSbd8D9yoDxRg5G8uAXL/AMM/FO513Ubq28VWaaVI8As7FWiiZUN5NJMzu1m5Vhbm3iVQCMCUMQ5WYAC2vhf4m3Hg7wz9r8YxweJ7N7iTVDBDbm1vsiUxRnNqGVQ4hHyBGCNJlnYK9AFDQ/DHxfh0mE33i6xm1BtHvEeKTyZYU1IsgtJMiyiYxKokZ+QSzgBdo5AIoPDPxjn8J65p8viHTbfWVvrK70TUGvFnzCoiFxBdBLGEFSUkcbAGfzfL3RhNxALF94O+KV94P8TWi+KLWHXpVsjo189yjJbsmwzb1SzjOWO4MW8xZDyI7dT5QAJdMsfiePFXjaze436Gun2sHh/WL+6gR2uRAqySGGOBuWkMrO8o2KViEcLBnwAWfCfhb4kWdx4Vm8ReJ4tTlgvr641iK2kjit2heN0toolForyKhKn5nQg7iTKNgUA9Q/GgAPBFAH//2Q=="},{"timing":2100,"timestamp":18295971816,"data":"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"},{"timing":2400,"timestamp":18296271816,"data":"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"},{"timing":2700,"timestamp":18296571816,"data":"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"},{"timing":3000,"timestamp":18296871816,"data":"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"}]}},"final-screenshot":{"id":"final-screenshot","title":"Final Screenshot","description":"The last screenshot captured of the pageload.","score":null,"scoreDisplayMode":"informative","rawValue":true,"details":{"type":"screenshot","timestamp":18295022.828,"data":"data:image/jpeg;base64,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"}},"estimated-input-latency":{"id":"estimated-input-latency","title":"Estimated Input Latency","description":"Estimated Input Latency is an estimate of how long your app takes to respond to user input, in milliseconds, during the busiest 5s window of page load. If your latency is higher than 50 ms, users may perceive your app as laggy. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/estimated-input-latency).","score":1,"scoreDisplayMode":"numeric","rawValue":12.8,"displayValue":"10 ms"},"max-potential-fid":{"id":"max-potential-fid","title":"Max Potential FID","description":"The potential First Input Delay that your users could experience is the duration, in milliseconds, of the longest task.","score":1,"scoreDisplayMode":"numeric","rawValue":58,"displayValue":"60 ms"},"errors-in-console":{"id":"errors-in-console","title":"No browser errors logged to the console","description":"Errors logged to the console indicate unresolved problems. They can come from network request failures and other browser concerns.","score":1,"scoreDisplayMode":"binary","rawValue":0,"details":{"type":"table","headings":[],"items":[]}},"time-to-first-byte":{"id":"time-to-first-byte","title":"Server response times are low (TTFB)","description":"Time To First Byte identifies the time at which your server sends a response. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/ttfb).","score":1,"scoreDisplayMode":"binary","rawValue":102.16199999999999,"displayValue":"Root document took 100 ms","details":{"type":"opportunity","overallSavingsMs":-497.838,"headings":[],"items":[]}},"first-cpu-idle":{"id":"first-cpu-idle","title":"First CPU Idle","description":"First CPU Idle marks the first time at which the page's main thread is quiet enough to handle input. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/first-interactive).","score":1,"scoreDisplayMode":"numeric","rawValue":1692.7309999999998,"displayValue":"1.7 s"},"interactive":{"id":"interactive","title":"Time to Interactive","description":"Time to interactive is the amount of time it takes for the page to become fully interactive. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/consistently-interactive).","score":1,"scoreDisplayMode":"numeric","rawValue":1934.4504999999997,"displayValue":"1.9 s"},"user-timings":{"id":"user-timings","title":"User Timing marks and measures","description":"Consider instrumenting your app with the User Timing API to measure your app's real-world performance during key user experiences. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/user-timing).","score":null,"scoreDisplayMode":"informative","rawValue":false,"displayValue":"4 user timings","details":{"type":"table","headings":[{"key":"name","itemType":"text","text":"Name"},{"key":"timingType","itemType":"text","text":"Type"},{"key":"startTime","itemType":"ms","granularity":0.01,"text":"Start Time"},{"key":"duration","itemType":"ms","granularity":0.01,"text":"Duration"}],"items":[{"name":"HTML (nearly) done parsing","startTime":0,"duration":474.579,"timingType":"Measure"},{"name":"evaling scripts","startTime":462.019,"duration":12.56,"timingType":"Measure"},{"name":"scripts","startTime":462.029,"timingType":"Mark"},{"name":"endOfDOM","startTime":474.583,"timingType":"Mark"}]}},"critical-request-chains":{"id":"critical-request-chains","title":"Minimize Critical Requests Depth","description":"The Critical Request Chains below show you what resources are loaded with a high priority. Consider reducing the length of chains, reducing the download size of resources, or deferring the download of unnecessary resources to improve page load. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/critical-request-chains).","score":null,"scoreDisplayMode":"informative","rawValue":false,"displayValue":"7 chains found","details":{"type":"criticalrequestchain","chains":{"5FB433527ED459448BF571CAB31A69C3":{"request":{"url":"https://www.paulirish.com/","startTime":18293.872798,"endTime":18294.103633,"responseReceivedTime":18294.083576,"transferSize":22595},"children":{"1000060836.10":{"request":{"url":"https://fonts.googleapis.com/css?family=PT+Serif:regular,italic,bold|PT+Sans:regular,italic,bold|Droid+Sans:400,700|Lato:700,900","startTime":18294.106405,"endTime":18294.225124,"responseReceivedTime":18294.224779,"transferSize":1228}},"1000060836.11":{"request":{"url":"https://www.paulirish.com/javascripts/modernizr-2.0.js","startTime":18294.107311,"endTime":18294.132901,"responseReceivedTime":18294.132603,"transferSize":4245}},"1000060836.12":{"request":{"url":"https://www.paulirish.com/javascripts/ender.js","startTime":18294.107647,"endTime":18294.135741,"responseReceivedTime":18294.133057,"transferSize":17039}},"1000060836.13":{"request":{"url":"https://www.paulirish.com/javascripts/octopress.js","startTime":18294.107943,"endTime":18294.132446,"responseReceivedTime":18294.1321,"transferSize":3262}},"1000060836.30":{"request":{"url":"https://fonts.gstatic.com/s/lato/v14/S6u9w4BMUTPHh6UVSwiPGQ3q5d0.woff2","startTime":18294.33455,"endTime":18294.406809,"responseReceivedTime":18294.392324,"transferSize":14193}},"1000060836.27":{"request":{"url":"https://fonts.gstatic.com/s/droidsans/v9/SlGVmQWMvZQIdix7AFxXkHNSbRYXags.woff2","startTime":18294.335034,"endTime":18294.410992,"responseReceivedTime":18294.407065,"transferSize":11353}},"1000060836.28":{"request":{"url":"https://fonts.gstatic.com/s/droidsans/v9/SlGWmQWMvZQIdix7AFxXmMh3eDs1ZyHKpWg.woff2","startTime":18294.335348,"endTime":18294.392146,"responseReceivedTime":18294.391832,"transferSize":11659}}}}},"longestChain":{"duration":538.194000000658,"length":2,"transferSize":11353}}},"redirects":{"id":"redirects","title":"Avoid multiple page redirects","description":"Redirects introduce additional delays before the page can be loaded. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/redirects).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0}},"installable-manifest":{"id":"installable-manifest","title":"Web app manifest does not meet the installability requirements","description":"Browsers can proactively prompt users to add your app to their homescreen, which can lead to higher engagement. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/install-prompt).","score":0,"scoreDisplayMode":"binary","rawValue":false,"explanation":"Failures: No manifest was fetched.","details":{"type":"diagnostic","items":[{"failures":["No manifest was fetched"],"isParseFailure":true,"parseFailureReason":"No manifest was fetched"}]}},"splash-screen":{"id":"splash-screen","title":"Is not configured for a custom splash screen","description":"A themed splash screen ensures a high-quality experience when users launch your app from their homescreens. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/custom-splash-screen).","score":0,"scoreDisplayMode":"binary","rawValue":false,"explanation":"Failures: No manifest was fetched.","details":{"type":"diagnostic","items":[{"failures":["No manifest was fetched"],"isParseFailure":true,"parseFailureReason":"No manifest was fetched"}]}},"themed-omnibox":{"id":"themed-omnibox","title":"Does not set an address-bar theme color","description":"The browser address bar can be themed to match your site. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/address-bar).","score":0,"scoreDisplayMode":"binary","rawValue":false,"explanation":"Failures: No manifest was fetched,\nNo `\u003cmeta name=\"theme-color\">` tag found.","details":{"type":"diagnostic","items":[{"failures":["No manifest was fetched","No `\u003cmeta name=\"theme-color\">` tag found"],"themeColor":null,"isParseFailure":true,"parseFailureReason":"No manifest was fetched"}]}},"content-width":{"id":"content-width","title":"Content is sized correctly for the viewport","description":"If the width of your app's content doesn't match the width of the viewport, your app might not be optimized for mobile screens. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/content-sized-correctly-for-viewport).","score":1,"scoreDisplayMode":"binary","rawValue":true,"explanation":""},"image-aspect-ratio":{"id":"image-aspect-ratio","title":"Displays images with incorrect aspect ratio","description":"Image display dimensions should match natural aspect ratio. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/aspect-ratio).","score":0,"scoreDisplayMode":"binary","rawValue":false,"warnings":[],"details":{"type":"table","headings":[{"key":"url","itemType":"thumbnail","text":""},{"key":"url","itemType":"url","text":"URL"},{"key":"displayedAspectRatio","itemType":"text","text":"Aspect Ratio (Displayed)"},{"key":"actualAspectRatio","itemType":"text","text":"Aspect Ratio (Actual)"}],"items":[{"url":"https://www.paulirish.com/images/noise.png?1418840251","displayedAspectRatio":"412 x 13991\n        (0.03)","actualAspectRatio":"200 x 200\n        (1.00)","doRatiosMatch":false},{"url":"https://www.paulirish.com/images/noise.png?1418840251","displayedAspectRatio":"411 x 13990\n        (0.03)","actualAspectRatio":"200 x 200\n        (1.00)","doRatiosMatch":false}]}},"deprecations":{"id":"deprecations","title":"Avoids deprecated APIs","description":"Deprecated APIs will eventually be removed from the browser. [Learn more](https://www.chromestatus.com/features#deprecated).","score":1,"scoreDisplayMode":"binary","rawValue":true,"displayValue":"","details":{"type":"table","headings":[],"items":[]}},"mainthread-work-breakdown":{"id":"mainthread-work-breakdown","title":"Minimizes main-thread work","description":"Consider reducing the time spent parsing, compiling and executing JS. You may find delivering smaller JS payloads helps with this.","score":0.97,"scoreDisplayMode":"numeric","rawValue":1467.2360000000003,"displayValue":"1.5 s","details":{"type":"table","headings":[{"key":"groupLabel","itemType":"text","text":"Category"},{"key":"duration","itemType":"ms","granularity":1,"text":"Time Spent"}],"items":[{"group":"styleLayout","groupLabel":"Style & Layout","duration":1022.4960000000002},{"group":"other","groupLabel":"Other","duration":238.2640000000002},{"group":"scriptEvaluation","groupLabel":"Script Evaluation","duration":113.81599999999996},{"group":"paintCompositeRender","groupLabel":"Rendering","duration":55.18},{"group":"parseHTML","groupLabel":"Parse HTML & CSS","duration":27.723999999999993},{"group":"scriptParseCompile","groupLabel":"Script Parsing & Compilation","duration":8.899999999999997},{"group":"garbageCollection","groupLabel":"Garbage Collection","duration":0.856}]}},"bootup-time":{"id":"bootup-time","title":"JavaScript execution time","description":"Consider reducing the time spent parsing, compiling, and executing JS. You may find delivering smaller JS payloads helps with this. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/bootup).","score":1,"scoreDisplayMode":"numeric","rawValue":72.26,"displayValue":"0.1 s","details":{"type":"table","headings":[{"key":"url","itemType":"url","text":"URL"},{"key":"total","granularity":1,"itemType":"ms","text":"Total CPU Time"},{"key":"scripting","granularity":1,"itemType":"ms","text":"Script Evaluation"},{"key":"scriptParseCompile","granularity":1,"itemType":"ms","text":"Script Parse"}],"items":[{"url":"Other","total":1357.0720000000006,"scripting":12.555999999999996,"scriptParseCompile":1.536},{"url":"https://www.google-analytics.com/analytics.js","total":58.168000000000006,"scripting":56.992000000000004,"scriptParseCompile":1.1760000000000002}],"summary":{"wastedMs":72.26}}},"uses-rel-preload":{"id":"uses-rel-preload","title":"Preload key requests","description":"Consider using \u003clink rel=preload> to prioritize fetching resources that are currently requested later in page load. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/preload).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0}},"uses-rel-preconnect":{"id":"uses-rel-preconnect","title":"Preconnect to required origins","description":"Consider adding preconnect or dns-prefetch resource hints to establish early connections to important third-party origins. [Learn more](https://developers.google.com/web/fundamentals/performance/resource-prioritization#preconnect).","score":0.8,"scoreDisplayMode":"numeric","rawValue":244.42300000196695,"displayValue":"Potential savings of 240 ms","warnings":[],"details":{"type":"opportunity","headings":[{"key":"url","valueType":"url","label":"URL"},{"key":"wastedMs","valueType":"timespanMs","label":"Potential Savings (ms)"}],"items":[{"url":"https://paulirish.disqus.com","wastedMs":244.42300000196695},{"url":"https://www.google-analytics.com","wastedMs":243.92000000360608}],"overallSavingsMs":244.42300000196695}},"font-display":{"id":"font-display","title":"Ensure text remains visible during webfont load","description":"Leverage the font-display CSS feature to ensure text is user-visible while webfonts are loading. [Learn more](https://developers.google.com/web/updates/2016/02/font-display).","score":0,"scoreDisplayMode":"binary","rawValue":false,"details":{"type":"table","headings":[{"key":"url","itemType":"url","text":"URL"},{"key":"wastedMs","itemType":"ms","text":"Potential Savings (ms)"}],"items":[{"url":"https://fonts.gstatic.com/s/lato/v14/S6u9w4BMUTPHh6UVSwiPGQ3q5d0.woff2","wastedMs":72.25900000048568},{"url":"https://fonts.gstatic.com/s/droidsans/v9/SlGVmQWMvZQIdix7AFxXkHNSbRYXags.woff2","wastedMs":75.95800000126474},{"url":"https://fonts.gstatic.com/s/droidsans/v9/SlGWmQWMvZQIdix7AFxXmMh3eDs1ZyHKpWg.woff2","wastedMs":56.79799999779789}]}},"diagnostics":{"id":"diagnostics","title":"Diagnostics","description":"Collection of useful page vitals.","score":null,"scoreDisplayMode":"informative","rawValue":1,"details":{"type":"diagnostic","items":[{"numRequests":24,"numScripts":5,"numStylesheets":1,"numFonts":3,"numTasks":281,"numTasksOver10ms":6,"numTasksOver25ms":4,"numTasksOver50ms":1,"numTasksOver100ms":1,"numTasksOver500ms":0,"rtt":14.751000000000001,"throughput":24730610.303708825,"maxRtt":24.42,"maxServerLatency":99.891,"totalByteWeight":331726,"totalTaskTime":366.80899999999986,"mainDocumentTransferSize":22595}]}},"network-requests":{"id":"network-requests","title":"Network Requests","description":"Lists the network requests that were made during page load.","score":null,"scoreDisplayMode":"informative","rawValue":24,"details":{"type":"table","headings":[{"key":"url","itemType":"url","text":"URL"},{"key":"startTime","itemType":"ms","granularity":1,"text":"Start Time"},{"key":"endTime","itemType":"ms","granularity":1,"text":"End Time"},{"key":"transferSize","itemType":"bytes","displayUnit":"kb","granularity":1,"text":"Transfer Size"},{"key":"resourceSize","itemType":"bytes","displayUnit":"kb","granularity":1,"text":"Resource Size"},{"key":"statusCode","itemType":"text","text":"Status Code"},{"key":"mimeType","itemType":"text","text":"MIME Type"},{"key":"resourceType","itemType":"text","text":"Resource Type"}],"items":[{"url":"https://www.paulirish.com/","startTime":0,"endTime":230.83499999847845,"transferSize":22595,"resourceSize":75221,"statusCode":200,"mimeType":"text/html","resourceType":"Document"},{"url":"https://www.paulirish.com/assets/wikipedia-flamechart.jpg","startTime":224.0620000011404,"endTime":259.08200000048964,"transferSize":76530,"resourceSize":76300,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://paulirish.com/assets/webkit-box.png","startTime":228.74400000000605,"endTime":422.9930000001332,"transferSize":106,"resourceSize":0,"statusCode":301,"mimeType":""},{"url":"https://lh6.googleusercontent.com/--WfQB-Tr1sQ/TfHQSfY38FI/AAAAAAAAB8s/DSNAn8F71i8/s800/graphicscontext.png","startTime":231.9999999999709,"endTime":355.3170000013779,"transferSize":44448,"resourceSize":44114,"statusCode":200,"mimeType":"image/png","resourceType":"Image"},{"url":"https://paulirish.com/assets/webkit-diagram.png","startTime":232.6839999986987,"endTime":423.4230000001844,"transferSize":73,"resourceSize":0,"statusCode":301,"mimeType":""},{"url":"https://paulirish.com/i/3fb890.png","startTime":233.00000000017462,"endTime":423.8469999982044,"transferSize":64,"resourceSize":0,"statusCode":301,"mimeType":""},{"url":"https://paulirish.com/avatar150.jpg","startTime":233.25199999817414,"endTime":424.29700000138837,"transferSize":65,"resourceSize":0,"statusCode":301,"mimeType":""},{"url":"https://fonts.googleapis.com/css?family=PT+Serif:regular,italic,bold|PT+Sans:regular,italic,bold|Droid+Sans:400,700|Lato:700,900","startTime":233.60699999830103,"endTime":352.32600000017555,"transferSize":1228,"resourceSize":11151,"statusCode":200,"mimeType":"text/css","resourceType":"Stylesheet"},{"url":"https://www.paulirish.com/javascripts/modernizr-2.0.js","startTime":234.5129999994242,"endTime":260.10300000052666,"transferSize":4245,"resourceSize":9736,"statusCode":200,"mimeType":"application/javascript","resourceType":"Script"},{"url":"https://www.paulirish.com/javascripts/ender.js","startTime":234.84900000039488,"endTime":262.9429999979038,"transferSize":17039,"resourceSize":56107,"statusCode":200,"mimeType":"application/javascript","resourceType":"Script"},{"url":"https://www.paulirish.com/javascripts/octopress.js","startTime":235.14499999873806,"endTime":259.647999999288,"transferSize":3262,"resourceSize":7820,"statusCode":200,"mimeType":"application/javascript","resourceType":"Script"},{"url":"https://www.paulirish.com/images/noise.png?1418840251","startTime":237.44000000078813,"endTime":316.16199999916716,"transferSize":17845,"resourceSize":17742,"statusCode":200,"mimeType":"image/png","resourceType":"Image"},{"url":"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAABCAYAAACsXeyTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAFU","startTime":237.9079999991518,"endTime":237.9479999981413,"transferSize":0,"resourceSize":99,"statusCode":200,"mimeType":"image/png","resourceType":"Image"},{"url":"https://www.paulirish.com/assets/webkit-box.png","startTime":423.1680000011693,"endTime":443.8509999999951,"transferSize":38908,"resourceSize":38746,"statusCode":200,"mimeType":"image/png","resourceType":"Image"},{"url":"https://www.paulirish.com/assets/webkit-diagram.png","startTime":423.532000000705,"endTime":445.6609999979264,"transferSize":21155,"resourceSize":21022,"statusCode":200,"mimeType":"image/png","resourceType":"Image"},{"url":"https://www.paulirish.com/i/3fb890.png","startTime":423.99699999805307,"endTime":445.1709999993909,"transferSize":18929,"resourceSize":18808,"statusCode":200,"mimeType":"image/png","resourceType":"Image"},{"url":"https://www.paulirish.com/avatar150.jpg","startTime":424.4489999982761,"endTime":446.87100000010105,"transferSize":7511,"resourceSize":7409,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://fonts.gstatic.com/s/lato/v14/S6u9w4BMUTPHh6UVSwiPGQ3q5d0.woff2","startTime":461.751999999251,"endTime":534.0109999997367,"transferSize":14193,"resourceSize":14076,"statusCode":200,"mimeType":"font/woff2","resourceType":"Font"},{"url":"https://fonts.gstatic.com/s/droidsans/v9/SlGVmQWMvZQIdix7AFxXkHNSbRYXags.woff2","startTime":462.23599999939324,"endTime":538.194000000658,"transferSize":11353,"resourceSize":11236,"statusCode":200,"mimeType":"font/woff2","resourceType":"Font"},{"url":"https://fonts.gstatic.com/s/droidsans/v9/SlGWmQWMvZQIdix7AFxXmMh3eDs1ZyHKpWg.woff2","startTime":462.5500000001921,"endTime":519.34799999799,"transferSize":11659,"resourceSize":11396,"statusCode":200,"mimeType":"font/woff2","resourceType":"Font"},{"url":"https://www.google-analytics.com/analytics.js","startTime":474.48200000144425,"endTime":562.976000001072,"transferSize":17833,"resourceSize":44130,"statusCode":200,"mimeType":"text/javascript","resourceType":"Script"},{"url":"https://paulirish.disqus.com/count.js","startTime":475.09699999864097,"endTime":674.3080000014743,"transferSize":1476,"resourceSize":1517,"statusCode":200,"mimeType":"application/javascript","resourceType":"Script"},{"url":"https://www.google-analytics.com/r/collect?v=1&_v=j73&a=1061881216&t=pageview&_s=1&dl=https%3A%2F%2Fwww.paulirish.com%2F&ul=en-us&de=UTF-8&dt=Paul%20Irish&sd=24-bit&sr=412x660&vp=412x660&je=0&_u=IEBAAEAB~&jid=1707220295&gjid=1007658189&cid=215630862.1552587291&tid=UA-692547-2&_gid=1945880939.1552587291&_r=1&z=1150510297","startTime":615.5709999984538,"endTime":655.0019999995129,"transferSize":199,"resourceSize":35,"statusCode":200,"mimeType":"image/gif","resourceType":"Image"},{"url":"https://www.paulirish.com/favicon.ico","startTime":679.0770000006887,"endTime":695.6559999998717,"transferSize":1010,"resourceSize":1150,"statusCode":200,"mimeType":"image/x-icon","resourceType":"Other"}]}},"network-rtt":{"id":"network-rtt","title":"Network Round Trip Times","description":"Network round trip times (RTT) have a large impact on performance. If the RTT to an origin is high, it's an indication that servers closer to the user could improve performance. [Learn more](https://hpbn.co/primer-on-latency-and-bandwidth/).","score":null,"scoreDisplayMode":"informative","rawValue":24.42,"displayValue":"20 ms","details":{"type":"table","headings":[{"key":"origin","itemType":"text","text":"URL"},{"key":"rtt","itemType":"ms","granularity":1,"text":"Time Spent"}],"items":[{"origin":"https://paulirish.disqus.com","rtt":24.42},{"origin":"https://lh6.googleusercontent.com","rtt":19.789999999999996},{"origin":"https://www.paulirish.com","rtt":17.147},{"origin":"https://www.google-analytics.com","rtt":15.206999999999999},{"origin":"https://paulirish.com","rtt":14.751000000000001},{"origin":"https://fonts.googleapis.com","rtt":14.751000000000001},{"origin":"https://fonts.gstatic.com","rtt":14.751000000000001}]}},"network-server-latency":{"id":"network-server-latency","title":"Server Backend Latencies","description":"Server latencies can impact web performance. If the server latency of an origin is high, it's an indication the server is overloaded or has poor backend performance. [Learn more](https://hpbn.co/primer-on-web-performance/#analyzing-the-resource-waterfall).","score":null,"scoreDisplayMode":"informative","rawValue":99.891,"displayValue":"100 ms","details":{"type":"table","headings":[{"key":"origin","itemType":"text","text":"URL"},{"key":"serverReponseTime","itemType":"ms","granularity":1,"text":"Time Spent"}],"items":[{"origin":"https://paulirish.disqus.com","serverReponseTime":99.891},{"origin":"https://fonts.googleapis.com","serverReponseTime":28.40499999999999},{"origin":"https://paulirish.com","serverReponseTime":5.8820000000000014},{"origin":"https://lh6.googleusercontent.com","serverReponseTime":5.846},{"origin":"https://fonts.gstatic.com","serverReponseTime":5.046000000000003},{"origin":"https://www.paulirish.com","serverReponseTime":4.742000000000001},{"origin":"https://www.google-analytics.com","serverReponseTime":1.108000000000013}]}},"main-thread-tasks":{"id":"main-thread-tasks","title":"Tasks","description":"Lists the toplevel main thread tasks that executed during page load.","score":null,"scoreDisplayMode":"informative","rawValue":9,"details":{"type":"table","headings":[{"key":"type","itemType":"text","text":"Task Type"},{"key":"startTime","itemType":"ms","granularity":1,"text":"Start Time"},{"key":"duration","itemType":"ms","granularity":1,"text":"End Time"}],"items":[{"type":"styleLayout","duration":67.171,"startTime":240.316},{"type":"styleLayout","duration":111.376,"startTime":307.562},{"type":"styleLayout","duration":6.808,"startTime":431.265},{"type":"styleLayout","duration":22.405,"startTime":438.103},{"type":"parseHTML","duration":10.756,"startTime":477.816},{"type":"styleLayout","duration":37.047,"startTime":560.731},{"type":"scriptEvaluation","duration":14.415,"startTime":605.205},{"type":"scriptEvaluation","duration":14.096,"startTime":605.497},{"type":"scriptEvaluation","duration":13.826,"startTime":605.504}]}},"metrics":{"id":"metrics","title":"Metrics","description":"Collects all available metrics.","score":null,"scoreDisplayMode":"informative","rawValue":1934.4504999999997,"details":{"type":"diagnostic","items":[{"firstContentfulPaint":1693,"firstMeaningfulPaint":1693,"firstCPUIdle":1693,"interactive":1934,"speedIndex":1693,"estimatedInputLatency":13,"observedNavigationStart":0,"observedNavigationStartTs":18293871816,"observedFirstPaint":435,"observedFirstPaintTs":18294306671,"observedFirstContentfulPaint":435,"observedFirstContentfulPaintTs":18294306673,"observedFirstMeaningfulPaint":435,"observedFirstMeaningfulPaintTs":18294306674,"observedTraceEnd":1740,"observedTraceEndTs":18295611982,"observedLoad":677,"observedLoadTs":18294548866,"observedDomContentLoaded":481,"observedDomContentLoadedTs":18294352497,"observedFirstVisualChange":451,"observedFirstVisualChangeTs":18294322816,"observedLastVisualChange":1134,"observedLastVisualChangeTs":18295005816,"observedSpeedIndex":500,"observedSpeedIndexTs":18294371354}]}},"offline-start-url":{"id":"offline-start-url","title":"start_url does not respond with a 200 when offline","description":"A service worker enables your web app to be reliable in unpredictable network conditions. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/http-200-when-offline).","score":0,"scoreDisplayMode":"binary","rawValue":false,"explanation":"No usable web app manifest found on page.","warnings":[]},"pwa-cross-browser":{"id":"pwa-cross-browser","title":"Site works cross-browser","description":"To reach the most number of users, sites should work across every major browser. [Learn more](https://developers.google.com/web/progressive-web-apps/checklist#site-works-cross-browser).","score":null,"scoreDisplayMode":"manual","rawValue":false},"pwa-page-transitions":{"id":"pwa-page-transitions","title":"Page transitions don't feel like they block on the network","description":"Transitions should feel snappy as you tap around, even on a slow network, a key to perceived performance. [Learn more](https://developers.google.com/web/progressive-web-apps/checklist#page-transitions-dont-feel-like-they-block-on-the-network).","score":null,"scoreDisplayMode":"manual","rawValue":false},"pwa-each-page-has-url":{"id":"pwa-each-page-has-url","title":"Each page has a URL","description":"Ensure individual pages are deep linkable via the URLs and that URLs are unique for the purpose of shareability on social media. [Learn more](https://developers.google.com/web/progressive-web-apps/checklist#each-page-has-a-url).","score":null,"scoreDisplayMode":"manual","rawValue":false},"accesskeys":{"id":"accesskeys","title":"`[accesskey]` values are unique","description":"Access keys let users quickly focus a part of the page. For proper navigation, each access key must be unique. [Learn more](https://dequeuniversity.com/rules/axe/3.1/accesskeys?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"aria-allowed-attr":{"id":"aria-allowed-attr","title":"`[aria-*]` attributes match their roles","description":"Each ARIA `role` supports a specific subset of `aria-*` attributes. Mismatching these invalidates the `aria-*` attributes. [Learn more](https://dequeuniversity.com/rules/axe/3.1/aria-allowed-attr?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"aria-required-attr":{"id":"aria-required-attr","title":"`[role]`s have all required `[aria-*]` attributes","description":"Some ARIA roles have required attributes that describe the state of the element to screen readers. [Learn more](https://dequeuniversity.com/rules/axe/3.1/aria-required-attr?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"aria-required-children":{"id":"aria-required-children","title":"Elements with `[role]` that require specific children `[role]`s, are present","description":"Some ARIA parent roles must contain specific child roles to perform their intended accessibility functions. [Learn more](https://dequeuniversity.com/rules/axe/3.1/aria-required-children?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"aria-required-parent":{"id":"aria-required-parent","title":"`[role]`s are contained by their required parent element","description":"Some ARIA child roles must be contained by specific parent roles to properly perform their intended accessibility functions. [Learn more](https://dequeuniversity.com/rules/axe/3.1/aria-required-parent?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"aria-roles":{"id":"aria-roles","title":"`[role]` values are valid","description":"ARIA roles must have valid values in order to perform their intended accessibility functions. [Learn more](https://dequeuniversity.com/rules/axe/3.1/aria-roles?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"aria-valid-attr-value":{"id":"aria-valid-attr-value","title":"`[aria-*]` attributes have valid values","description":"Assistive technologies, like screen readers, can't interpret ARIA attributes with invalid values. [Learn more](https://dequeuniversity.com/rules/axe/3.1/aria-valid-attr-value?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"aria-valid-attr":{"id":"aria-valid-attr","title":"`[aria-*]` attributes are valid and not misspelled","description":"Assistive technologies, like screen readers, can't interpret ARIA attributes with invalid names. [Learn more](https://dequeuniversity.com/rules/axe/3.1/aria-valid-attr?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"audio-caption":{"id":"audio-caption","title":"`\u003caudio>` elements contain a `\u003ctrack>` element with `[kind=\"captions\"]`","description":"Captions make audio elements usable for deaf or hearing-impaired users, providing critical information such as who is talking, what they're saying, and other non-speech information. [Learn more](https://dequeuniversity.com/rules/axe/3.1/audio-caption?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"button-name":{"id":"button-name","title":"Buttons have an accessible name","description":"When a button doesn't have an accessible name, screen readers announce it as \"button\", making it unusable for users who rely on screen readers. [Learn more](https://dequeuniversity.com/rules/axe/3.1/button-name?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"bypass":{"id":"bypass","title":"The page contains a heading, skip link, or landmark region","description":"Adding ways to bypass repetitive content lets keyboard users navigate the page more efficiently. [Learn more](https://dequeuniversity.com/rules/axe/3.1/bypass?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"color-contrast":{"id":"color-contrast","title":"Background and foreground colors do not have a sufficient contrast ratio.","description":"Low-contrast text is difficult or impossible for many users to read. [Learn more](https://dequeuniversity.com/rules/axe/3.1/color-contrast?application=lighthouse).","score":0,"scoreDisplayMode":"binary","rawValue":false,"details":{"type":"table","headings":[{"key":"node","itemType":"node","text":"Failing Elements"}],"items":[{"node":{"type":"node","selector":".search","path":"1,HTML,1,BODY,1,NAV,1,FORM,0,FIELDSET,1,INPUT","snippet":"\u003cinput class=\"search\" type=\"text\" name=\"q\" results=\"0\" placeholder=\"Search\">","explanation":"Fix any of the following:\n  Element has insufficient color contrast of 3.16 (foreground color: #888888, background color: #f2f2f2, font size: 10.2pt, font weight: normal). Expected contrast ratio of 4.5:1"}}],"diagnostic":{"type":"diagnostic","impact":"serious","tags":["cat.color","wcag2aa","wcag143"]}}},"definition-list":{"id":"definition-list","title":"`\u003cdl>`'s contain only properly-ordered `\u003cdt>` and `\u003cdd>` groups, `\u003cscript>` or `\u003ctemplate>` elements.","description":"When definition lists are not properly marked up, screen readers may produce confusing or inaccurate output. [Learn more](https://dequeuniversity.com/rules/axe/3.1/definition-list?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"dlitem":{"id":"dlitem","title":"Definition list items are wrapped in `\u003cdl>` elements","description":"Definition list items (`\u003cdt>` and `\u003cdd>`) must be wrapped in a parent `\u003cdl>` element to ensure that screen readers can properly announce them. [Learn more](https://dequeuniversity.com/rules/axe/3.1/dlitem?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"document-title":{"id":"document-title","title":"Document has a `\u003ctitle>` element","description":"The title gives screen reader users an overview of the page, and search engine users rely on it heavily to determine if a page is relevant to their search. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/title).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"duplicate-id":{"id":"duplicate-id","title":"`[id]` attributes on the page are unique","description":"The value of an id attribute must be unique to prevent other instances from being overlooked by assistive technologies. [Learn more](https://dequeuniversity.com/rules/axe/3.1/duplicate-id?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"frame-title":{"id":"frame-title","title":"`\u003cframe>` or `\u003ciframe>` elements have a title","description":"Screen reader users rely on frame titles to describe the contents of frames. [Learn more](https://dequeuniversity.com/rules/axe/3.1/frame-title?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"html-has-lang":{"id":"html-has-lang","title":"`\u003chtml>` element has a `[lang]` attribute","description":"If a page doesn't specify a lang attribute, a screen reader assumes that the page is in the default language that the user chose when setting up the screen reader. If the page isn't actually in the default language, then the screen reader might not announce the page's text correctly. [Learn more](https://dequeuniversity.com/rules/axe/3.1/html-has-lang?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"html-lang-valid":{"id":"html-lang-valid","title":"`\u003chtml>` element has a valid value for its `[lang]` attribute","description":"Specifying a valid [BCP 47 language](https://www.w3.org/International/questions/qa-choosing-language-tags#question) helps screen readers announce text properly. [Learn more](https://dequeuniversity.com/rules/axe/3.1/valid-lang?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"image-alt":{"id":"image-alt","title":"Image elements do not have `[alt]` attributes","description":"Informative elements should aim for short, descriptive alternate text. Decorative elements can be ignored with an empty alt attribute. [Learn more](https://dequeuniversity.com/rules/axe/3.1/image-alt?application=lighthouse).","score":0,"scoreDisplayMode":"binary","rawValue":false,"details":{"type":"table","headings":[{"key":"node","itemType":"node","text":"Failing Elements"}],"items":[{"node":{"type":"node","selector":"center > img","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,1,ARTICLE,1,DIV,7,CENTER,0,IMG","snippet":"\u003cimg src=\"/assets/wikipedia-flamechart.jpg\">","explanation":"Fix any of the following:\n  Element does not have an alt attribute\n  aria-label attribute does not exist or is empty\n  aria-labelledby attribute does not exist, references elements that do not exist or references elements that are empty\n  Element has no title attribute or the title attribute is empty\n  Element's default semantics were not overridden with role=\"presentation\"\n  Element's default semantics were not overridden with role=\"none\""}}],"diagnostic":{"type":"diagnostic","impact":"critical","tags":["cat.text-alternatives","wcag2a","wcag111","section508","section508.22.a"]}}},"input-image-alt":{"id":"input-image-alt","title":"`\u003cinput type=\"image\">` elements have `[alt]` text","description":"When an image is being used as an `\u003cinput>` button, providing alternative text can help screen reader users understand the purpose of the button. [Learn more](https://dequeuniversity.com/rules/axe/3.1/input-image-alt?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"label":{"id":"label","title":"Form elements do not have associated labels","description":"Labels ensure that form controls are announced properly by assistive technologies, like screen readers. [Learn more](https://dequeuniversity.com/rules/axe/3.1/label?application=lighthouse).","score":0,"scoreDisplayMode":"binary","rawValue":false,"details":{"type":"table","headings":[{"key":"node","itemType":"node","text":"Failing Elements"}],"items":[{"node":{"type":"node","selector":".search","path":"1,HTML,1,BODY,1,NAV,1,FORM,0,FIELDSET,1,INPUT","snippet":"\u003cinput class=\"search\" type=\"text\" name=\"q\" results=\"0\" placeholder=\"Search\">","explanation":"Fix any of the following:\n  aria-label attribute does not exist or is empty\n  aria-labelledby attribute does not exist, references elements that do not exist or references elements that are empty\n  Form element does not have an implicit (wrapped) \u003clabel>\n  Form element does not have an explicit \u003clabel>\n  Element has no title attribute or the title attribute is empty"}},{"node":{"type":"node","selector":"select","path":"1,HTML,1,BODY,1,NAV,1,FORM,1,FIELDSET,0,SELECT","snippet":"\u003cselect>","explanation":"Fix any of the following:\n  aria-label attribute does not exist or is empty\n  aria-labelledby attribute does not exist, references elements that do not exist or references elements that are empty\n  Form element does not have an implicit (wrapped) \u003clabel>\n  Form element does not have an explicit \u003clabel>\n  Element has no title attribute or the title attribute is empty"}}],"diagnostic":{"type":"diagnostic","impact":"critical","tags":["cat.forms","wcag2a","wcag332","wcag131","section508","section508.22.n"]}}},"layout-table":{"id":"layout-table","title":"Presentational `\u003ctable>` elements avoid using `\u003cth>`, `\u003ccaption>` or the `[summary]` attribute.","description":"A table being used for layout purposes should not include data elements, such as the th or caption elements or the summary attribute, because this can create a confusing experience for screen reader users. [Learn more](https://dequeuniversity.com/rules/axe/3.1/layout-table?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"link-name":{"id":"link-name","title":"Links do not have a discernible name","description":"Link text (and alternate text for images, when used as links) that is discernible, unique, and focusable improves the navigation experience for screen reader users. [Learn more](https://dequeuniversity.com/rules/axe/3.1/link-name?application=lighthouse).","score":0,"scoreDisplayMode":"binary","rawValue":false,"details":{"type":"table","headings":[{"key":"node","itemType":"node","text":"Failing Elements"}],"items":[{"node":{"type":"node","selector":"p:nth-child(61) > a","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,60,P,0,A","snippet":"\u003ca href=\"https://docs.google.com/presentation/d/1ZRIQbUKw9Tf077odCh66OrrwRIVNLvI_nhLm2Gi__F0/embed?start=false&amp;loop=false&amp;delayms=3000\">\n\u003cimg src=\"https://paulirish.com/i/3fb890.png\" alt=\"\">\n\u003c/a>","explanation":"Fix all of the following:\n  Element is in tab order and does not have accessible text\n\nFix any of the following:\n  Element does not have text that is visible to screen readers\n  aria-label attribute does not exist or is empty\n  aria-labelledby attribute does not exist, references elements that do not exist or references elements that are empty\n  Element's default semantics were not overridden with role=\"presentation\"\n  Element's default semantics were not overridden with role=\"none\""}}],"diagnostic":{"type":"diagnostic","impact":"serious","tags":["cat.name-role-value","wcag2a","wcag412","wcag244","section508","section508.22.a"]}}},"list":{"id":"list","title":"Lists contain only `\u003cli>` elements and script supporting elements (`\u003cscript>` and `\u003ctemplate>`).","description":"Screen readers have a specific way of announcing lists. Ensuring proper list structure aids screen reader output. [Learn more](https://dequeuniversity.com/rules/axe/3.1/list?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"listitem":{"id":"listitem","title":"List items (`\u003cli>`) are contained within `\u003cul>` or `\u003col>` parent elements","description":"Screen readers require list items (`\u003cli>`) to be contained within a parent `\u003cul>` or `\u003col>` to be announced properly. [Learn more](https://dequeuniversity.com/rules/axe/3.1/listitem?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"meta-refresh":{"id":"meta-refresh","title":"The document does not use `\u003cmeta http-equiv=\"refresh\">`","description":"Users do not expect a page to refresh automatically, and doing so will move focus back to the top of the page. This may create a frustrating or confusing experience. [Learn more](https://dequeuniversity.com/rules/axe/3.1/meta-refresh?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"meta-viewport":{"id":"meta-viewport","title":"`[user-scalable=\"no\"]` is used in the `\u003cmeta name=\"viewport\">` element or the `[maximum-scale]` attribute is less than 5.","description":"Disabling zooming is problematic for users with low vision who rely on screen magnification to properly see the contents of a web page. [Learn more](https://dequeuniversity.com/rules/axe/3.1/meta-viewport?application=lighthouse).","score":0,"scoreDisplayMode":"binary","rawValue":false,"details":{"type":"table","headings":[{"key":"node","itemType":"node","text":"Failing Elements"}],"items":[{"node":{"type":"node","selector":"meta[name=\"viewport\"]","path":"1,HTML,0,HEAD,3,META","snippet":"\u003cmeta name=\"viewport\" content=\"width=device-width,minimum-scale=1,maximum-scale=1\">","explanation":"Fix any of the following:\n  maximum-scale on \u003cmeta> tag disables zooming on mobile devices"}}],"diagnostic":{"type":"diagnostic","impact":"critical","tags":["cat.sensory-and-visual-cues","wcag2aa","wcag144"]}}},"object-alt":{"id":"object-alt","title":"`\u003cobject>` elements have `[alt]` text","description":"Screen readers cannot translate non-text content. Adding alt text to `\u003cobject>` elements helps screen readers convey meaning to users. [Learn more](https://dequeuniversity.com/rules/axe/3.1/object-alt?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"tabindex":{"id":"tabindex","title":"No element has a `[tabindex]` value greater than 0","description":"A value greater than 0 implies an explicit navigation ordering. Although technically valid, this often creates frustrating experiences for users who rely on assistive technologies. [Learn more](https://dequeuniversity.com/rules/axe/3.1/tabindex?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"td-headers-attr":{"id":"td-headers-attr","title":"Cells in a `\u003ctable>` element that use the `[headers]` attribute only refer to other cells of that same table.","description":"Screen readers have features to make navigating tables easier. Ensuring `\u003ctd>` cells using the `[headers]` attribute only refer to other cells in the same table may improve the experience for screen reader users. [Learn more](https://dequeuniversity.com/rules/axe/3.1/td-headers-attr?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"th-has-data-cells":{"id":"th-has-data-cells","title":"`\u003cth>` elements and elements with `[role=\"columnheader\"/\"rowheader\"]` have data cells they describe.","description":"Screen readers have features to make navigating tables easier. Ensuring table headers always refer to some set of cells may improve the experience for screen reader users. [Learn more](https://dequeuniversity.com/rules/axe/3.1/th-has-data-cells?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"valid-lang":{"id":"valid-lang","title":"`[lang]` attributes have a valid value","description":"Specifying a valid [BCP 47 language](https://www.w3.org/International/questions/qa-choosing-language-tags#question) on elements helps ensure that text is pronounced correctly by a screen reader. [Learn more](https://dequeuniversity.com/rules/axe/3.1/valid-lang?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"video-caption":{"id":"video-caption","title":"`\u003cvideo>` elements contain a `\u003ctrack>` element with `[kind=\"captions\"]`","description":"When a video provides a caption it is easier for deaf and hearing impaired users to access its information. [Learn more](https://dequeuniversity.com/rules/axe/3.1/video-caption?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"video-description":{"id":"video-description","title":"`\u003cvideo>` elements contain a `\u003ctrack>` element with `[kind=\"description\"]`","description":"Audio descriptions provide relevant information for videos that dialogue cannot, such as facial expressions and scenes. [Learn more](https://dequeuniversity.com/rules/axe/3.1/video-description?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"custom-controls-labels":{"id":"custom-controls-labels","title":"Custom controls have associated labels","description":"Custom interactive controls have associated labels, provided by aria-label or aria-labelledby. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#try_it_with_a_screen_reader).","score":null,"scoreDisplayMode":"manual","rawValue":false},"custom-controls-roles":{"id":"custom-controls-roles","title":"Custom controls have ARIA roles","description":"Custom interactive controls have appropriate ARIA roles. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#try_it_with_a_screen_reader).","score":null,"scoreDisplayMode":"manual","rawValue":false},"focus-traps":{"id":"focus-traps","title":"User focus is not accidentally trapped in a region","description":"A user can tab into and out of any control or region without accidentally trapping their focus. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#start_with_the_keyboard).","score":null,"scoreDisplayMode":"manual","rawValue":false},"focusable-controls":{"id":"focusable-controls","title":"Interactive controls are keyboard focusable","description":"Custom interactive controls are keyboard focusable and display a focus indicator. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#start_with_the_keyboard).","score":null,"scoreDisplayMode":"manual","rawValue":false},"heading-levels":{"id":"heading-levels","title":"Headings don't skip levels","description":"Headings are used to create an outline for the page and heading levels are not skipped. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#take_advantage_of_headings_and_landmarks).","score":null,"scoreDisplayMode":"manual","rawValue":false},"interactive-element-affordance":{"id":"interactive-element-affordance","title":"Interactive elements indicate their purpose and state","description":"Interactive elements, such as links and buttons, should indicate their state and be distinguishable from non-interactive elements. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#interactive_elements_like_links_and_buttons_should_indicate_their_purpose_and_state).","score":null,"scoreDisplayMode":"manual","rawValue":false},"logical-tab-order":{"id":"logical-tab-order","title":"The page has a logical tab order","description":"Tabbing through the page follows the visual layout. Users cannot focus elements that are offscreen. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#start_with_the_keyboard).","score":null,"scoreDisplayMode":"manual","rawValue":false},"managed-focus":{"id":"managed-focus","title":"The user's focus is directed to new content added to the page","description":"If new content, such as a dialog, is added to the page, the user's focus is directed to it. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#start_with_the_keyboard).","score":null,"scoreDisplayMode":"manual","rawValue":false},"offscreen-content-hidden":{"id":"offscreen-content-hidden","title":"Offscreen content is hidden from assistive technology","description":"Offscreen content is hidden with display: none or aria-hidden=true. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#try_it_with_a_screen_reader).","score":null,"scoreDisplayMode":"manual","rawValue":false},"use-landmarks":{"id":"use-landmarks","title":"HTML5 landmark elements are used to improve navigation","description":"Landmark elements (\u003cmain>, \u003cnav>, etc.) are used to improve the keyboard navigation of the page for assistive technology. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#take_advantage_of_headings_and_landmarks).","score":null,"scoreDisplayMode":"manual","rawValue":false},"visual-order-follows-dom":{"id":"visual-order-follows-dom","title":"Visual order on the page follows DOM order","description":"DOM order matches the visual order, improving navigation for assistive technology. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#try_it_with_a_screen_reader).","score":null,"scoreDisplayMode":"manual","rawValue":false},"uses-long-cache-ttl":{"id":"uses-long-cache-ttl","title":"Serve static assets with an efficient cache policy","description":"A long cache lifetime can speed up repeat visits to your page. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/cache-policy).","score":0.51,"scoreDisplayMode":"numeric","rawValue":125445.05,"displayValue":"12 resources found","details":{"type":"table","headings":[{"key":"url","itemType":"url","text":"URL"},{"key":"cacheLifetimeMs","itemType":"ms","text":"Cache TTL","displayUnit":"duration"},{"key":"totalBytes","itemType":"bytes","text":"Size (KB)","displayUnit":"kb","granularity":1}],"items":[{"url":"https://www.paulirish.com/images/noise.png?1418840251","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":17845,"wastedBytes":17845},{"url":"https://paulirish.disqus.com/count.js","diagnostic":{"type":"diagnostic","public":true,"max-age":300},"cacheLifetimeMs":300000,"cacheHitProbability":0.041666666666666664,"totalBytes":1476,"wastedBytes":1414.5},{"url":"https://www.google-analytics.com/analytics.js","diagnostic":{"type":"diagnostic","public":true,"max-age":7200},"cacheLifetimeMs":7200000,"cacheHitProbability":0.25,"totalBytes":17833,"wastedBytes":13374.75},{"url":"https://www.paulirish.com/assets/wikipedia-flamechart.jpg","diagnostic":{"type":"diagnostic","public":true,"max-age":86400},"cacheLifetimeMs":86400000,"cacheHitProbability":0.6,"totalBytes":76530,"wastedBytes":30612},{"url":"https://lh6.googleusercontent.com/--WfQB-Tr1sQ/TfHQSfY38FI/AAAAAAAAB8s/DSNAn8F71i8/s800/graphicscontext.png","diagnostic":{"type":"diagnostic","public":true,"max-age":86400,"no-transform":true},"cacheLifetimeMs":86400000,"cacheHitProbability":0.6,"totalBytes":44448,"wastedBytes":17779.2},{"url":"https://www.paulirish.com/assets/webkit-box.png","diagnostic":{"type":"diagnostic","public":true,"max-age":86400},"cacheLifetimeMs":86400000,"cacheHitProbability":0.6,"totalBytes":38908,"wastedBytes":15563.2},{"url":"https://www.paulirish.com/assets/webkit-diagram.png","diagnostic":{"type":"diagnostic","public":true,"max-age":86400},"cacheLifetimeMs":86400000,"cacheHitProbability":0.6,"totalBytes":21155,"wastedBytes":8462},{"url":"https://www.paulirish.com/i/3fb890.png","diagnostic":{"type":"diagnostic","public":true,"max-age":86400},"cacheLifetimeMs":86400000,"cacheHitProbability":0.6,"totalBytes":18929,"wastedBytes":7571.6},{"url":"https://www.paulirish.com/javascripts/ender.js","diagnostic":{"type":"diagnostic","public":true,"max-age":86400},"cacheLifetimeMs":86400000,"cacheHitProbability":0.6,"totalBytes":17039,"wastedBytes":6815.6},{"url":"https://www.paulirish.com/avatar150.jpg","diagnostic":{"type":"diagnostic","public":true,"max-age":86400},"cacheLifetimeMs":86400000,"cacheHitProbability":0.6,"totalBytes":7511,"wastedBytes":3004.4},{"url":"https://www.paulirish.com/javascripts/modernizr-2.0.js","diagnostic":{"type":"diagnostic","public":true,"max-age":86400},"cacheLifetimeMs":86400000,"cacheHitProbability":0.6,"totalBytes":4245,"wastedBytes":1698},{"url":"https://www.paulirish.com/javascripts/octopress.js","diagnostic":{"type":"diagnostic","public":true,"max-age":86400},"cacheLifetimeMs":86400000,"cacheHitProbability":0.6,"totalBytes":3262,"wastedBytes":1304.8000000000002}],"summary":{"wastedBytes":125445.05}}},"total-byte-weight":{"id":"total-byte-weight","title":"Avoids enormous network payloads","description":"Large network payloads cost users real money and are highly correlated with long load times. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/network-payloads).","score":1,"scoreDisplayMode":"numeric","rawValue":331726,"displayValue":"Total size was 324 KB","details":{"type":"table","headings":[{"key":"url","itemType":"url","text":"URL"},{"key":"totalBytes","itemType":"bytes","text":"Size (KB)"}],"items":[{"url":"https://www.paulirish.com/assets/wikipedia-flamechart.jpg","totalBytes":76530},{"url":"https://lh6.googleusercontent.com/--WfQB-Tr1sQ/TfHQSfY38FI/AAAAAAAAB8s/DSNAn8F71i8/s800/graphicscontext.png","totalBytes":44448},{"url":"https://www.paulirish.com/assets/webkit-box.png","totalBytes":38908},{"url":"https://www.paulirish.com/","totalBytes":22595},{"url":"https://www.paulirish.com/assets/webkit-diagram.png","totalBytes":21155},{"url":"https://www.paulirish.com/i/3fb890.png","totalBytes":18929},{"url":"https://www.paulirish.com/images/noise.png?1418840251","totalBytes":17845},{"url":"https://www.google-analytics.com/analytics.js","totalBytes":17833},{"url":"https://www.paulirish.com/javascripts/ender.js","totalBytes":17039},{"url":"https://fonts.gstatic.com/s/lato/v14/S6u9w4BMUTPHh6UVSwiPGQ3q5d0.woff2","totalBytes":14193}]}},"offscreen-images":{"id":"offscreen-images","title":"Defer offscreen images","description":"Consider lazy-loading offscreen and hidden images after all critical resources have finished loading to lower time to interactive. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/offscreen-images).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"Potential savings of 118 KB","warnings":[],"details":{"type":"opportunity","headings":[{"key":"url","valueType":"thumbnail","label":""},{"key":"url","valueType":"url","label":"URL"},{"key":"totalBytes","valueType":"bytes","label":"Size (KB)"},{"key":"wastedBytes","valueType":"bytes","label":"Potential Savings (KB)"}],"items":[{"url":"https://www.paulirish.com/assets/wikipedia-flamechart.jpg","requestStartTime":18294.09686,"totalBytes":76300,"wastedBytes":76300,"wastedPercent":100},{"url":"https://lh6.googleusercontent.com/--WfQB-Tr1sQ/TfHQSfY38FI/AAAAAAAAB8s/DSNAn8F71i8/s800/graphicscontext.png","requestStartTime":18294.104798,"totalBytes":44114,"wastedBytes":44114,"wastedPercent":100}],"overallSavingsMs":0,"overallSavingsBytes":120414}},"render-blocking-resources":{"id":"render-blocking-resources","title":"Eliminate render-blocking resources","description":"Resources are blocking the first paint of your page. Consider delivering critical JS/CSS inline and deferring all non-critical JS/styles. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/blocking-resources).","score":0.5,"scoreDisplayMode":"numeric","rawValue":778,"displayValue":"Potential savings of 780 ms","details":{"type":"opportunity","headings":[{"key":"url","valueType":"url","label":"URL"},{"key":"totalBytes","valueType":"bytes","label":"Size (KB)"},{"key":"wastedMs","valueType":"timespanMs","label":"Potential Savings (ms)"}],"items":[{"url":"https://fonts.googleapis.com/css?family=PT+Serif:regular,italic,bold|PT+Sans:regular,italic,bold|Droid+Sans:400,700|Lato:700,900","totalBytes":1228,"wastedMs":778}],"overallSavingsMs":778}},"unminified-css":{"id":"unminified-css","title":"Minify CSS","description":"Minifying CSS files can reduce network payload sizes. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/minify-css).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"unminified-javascript":{"id":"unminified-javascript","title":"Minify JavaScript","description":"Minifying JavaScript files can reduce payload sizes and script parse time. [Learn more](https://developers.google.com/speed/docs/insights/MinifyResources).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","warnings":[],"details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"unused-css-rules":{"id":"unused-css-rules","title":"Remove unused CSS","description":"Remove dead rules from stylesheets and defer the loading of CSS not used for above-the-fold content to reduce unnecessary bytes consumed by network activity. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/unused-css).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"Potential savings of 10 KB","details":{"type":"opportunity","headings":[{"key":"url","valueType":"url","label":"URL"},{"key":"totalBytes","valueType":"bytes","label":"Size (KB)"},{"key":"wastedBytes","valueType":"bytes","label":"Potential Savings (KB)"}],"items":[{"url":"html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,bi...","wastedBytes":9937,"wastedPercent":73.63828603227601,"totalBytes":13495}],"overallSavingsMs":0,"overallSavingsBytes":9937}},"uses-webp-images":{"id":"uses-webp-images","title":"Serve images in next-gen formats","description":"Image formats like JPEG 2000, JPEG XR, and WebP often provide better compression than PNG or JPEG, which means faster downloads and less data consumption. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/webp).","score":0.66,"scoreDisplayMode":"numeric","rawValue":460,"displayValue":"Potential savings of 118 KB","warnings":[],"details":{"type":"opportunity","headings":[{"key":"url","valueType":"thumbnail","label":""},{"key":"url","valueType":"url","label":"URL"},{"key":"totalBytes","valueType":"bytes","label":"Size (KB)"},{"key":"wastedBytes","valueType":"bytes","label":"Potential Savings (KB)"}],"items":[{"url":"https://www.paulirish.com/assets/wikipedia-flamechart.jpg","fromProtocol":true,"isCrossOrigin":false,"totalBytes":76300,"wastedBytes":48732},{"url":"https://lh6.googleusercontent.com/--WfQB-Tr1sQ/TfHQSfY38FI/AAAAAAAAB8s/DSNAn8F71i8/s800/graphicscontext.png","fromProtocol":true,"isCrossOrigin":true,"totalBytes":44114,"wastedBytes":34708},{"url":"https://www.paulirish.com/assets/webkit-box.png","fromProtocol":true,"isCrossOrigin":false,"totalBytes":38746,"wastedBytes":28232},{"url":"https://www.paulirish.com/assets/webkit-diagram.png","fromProtocol":true,"isCrossOrigin":false,"totalBytes":21022,"wastedBytes":8946}],"overallSavingsMs":460,"overallSavingsBytes":120618}},"uses-optimized-images":{"id":"uses-optimized-images","title":"Efficiently encode images","description":"Optimized images load faster and consume less cellular data. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/optimize-images).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"Potential savings of 12 KB","warnings":[],"details":{"type":"opportunity","headings":[{"key":"url","valueType":"thumbnail","label":""},{"key":"url","valueType":"url","label":"URL"},{"key":"totalBytes","valueType":"bytes","label":"Size (KB)"},{"key":"wastedBytes","valueType":"bytes","label":"Potential Savings (KB)"}],"items":[{"url":"https://www.paulirish.com/assets/wikipedia-flamechart.jpg","fromProtocol":true,"isCrossOrigin":false,"totalBytes":76300,"wastedBytes":12774}],"overallSavingsMs":0,"overallSavingsBytes":12774}},"uses-text-compression":{"id":"uses-text-compression","title":"Enable text compression","description":"Text-based resources should be served with compression (gzip, deflate or brotli) to minimize total network bytes. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/text-compression).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"uses-responsive-images":{"id":"uses-responsive-images","title":"Properly size images","description":"Serve images that are appropriately-sized to save cellular data and improve load time. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/oversized-images).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","warnings":[],"details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"efficient-animated-content":{"id":"efficient-animated-content","title":"Use video formats for animated content","description":"Large GIFs are inefficient for delivering animated content. Consider using MPEG4/WebM videos for animations and PNG/WebP for static images instead of GIF to save network bytes. [Learn more](https://developers.google.com/web/fundamentals/performance/optimizing-content-efficiency/replace-animated-gifs-with-video/)","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"appcache-manifest":{"id":"appcache-manifest","title":"Avoids Application Cache","description":"Application Cache is deprecated. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/appcache).","score":1,"scoreDisplayMode":"binary","rawValue":true,"displayValue":""},"doctype":{"id":"doctype","title":"Page has the HTML doctype","description":"Specifying a doctype prevents the browser from switching to quirks-mode.Read more on the [MDN Web Docs page](https://developer.mozilla.org/en-US/docs/Glossary/Doctype)","score":1,"scoreDisplayMode":"binary","rawValue":true},"dom-size":{"id":"dom-size","title":"Avoids an excessive DOM size","description":"Browser engineers recommend pages contain fewer than ~1,500 DOM nodes. The sweet spot is a tree depth \u003c 32 elements and fewer than 60 children/parent element. A large DOM can increase memory usage, cause longer [style calculations](https://developers.google.com/web/fundamentals/performance/rendering/reduce-the-scope-and-complexity-of-style-calculations), and produce costly [layout reflows](https://developers.google.com/speed/articles/reflow). [Learn more](https://developers.google.com/web/tools/lighthouse/audits/dom-size).","score":1,"scoreDisplayMode":"numeric","rawValue":446,"displayValue":"446 nodes","details":{"type":"table","headings":[{"key":"statistic","itemType":"text","text":"Statistic"},{"key":"element","itemType":"code","text":"Element"},{"key":"value","itemType":"numeric","text":"Value"}],"items":[{"statistic":"Total DOM Nodes","element":"","value":"446"},{"statistic":"Maximum DOM Depth","element":{"type":"code","value":"\u003ca href=\"http://trac.webkit.org/changeset/142163\">"},"value":"12"},{"statistic":"Maximum Child Elements","element":{"type":"code","value":"\u003cdiv class=\"entry-content\">"},"value":"67"}]}},"external-anchors-use-rel-noopener":{"id":"external-anchors-use-rel-noopener","title":"Links to cross-origin destinations are safe","description":"Add `rel=\"noopener\"` or `rel=\"noreferrer\"` to any external links to improve performance and prevent security vulnerabilities. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/noopener).","score":1,"scoreDisplayMode":"binary","rawValue":true,"warnings":[],"details":{"type":"table","headings":[],"items":[]}},"geolocation-on-start":{"id":"geolocation-on-start","title":"Avoids requesting the geolocation permission on page load","description":"Users are mistrustful of or confused by sites that request their location without context. Consider tying the request to user gestures instead. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/geolocation-on-load).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"no-document-write":{"id":"no-document-write","title":"Avoids `document.write()`","description":"For users on slow connections, external scripts dynamically injected via `document.write()` can delay page load by tens of seconds. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/document-write).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"no-vulnerable-libraries":{"id":"no-vulnerable-libraries","title":"Avoids front-end JavaScript libraries with known security vulnerabilities","description":"Some third-party scripts may contain known security vulnerabilities that are easily identified and exploited by attackers. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/vulnerabilities).","score":1,"scoreDisplayMode":"binary","rawValue":true,"displayValue":"","details":{"type":"table","headings":[],"items":[],"summary":{}}},"js-libraries":{"id":"js-libraries","title":"Detected JavaScript libraries","description":"All front-end JavaScript libraries detected on the page.","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[{"key":"name","itemType":"text","text":"Name"},{"key":"version","itemType":"text","text":"Version"}],"items":[{"name":"SWFObject"}],"summary":{}}},"notification-on-start":{"id":"notification-on-start","title":"Avoids requesting the notification permission on page load","description":"Users are mistrustful of or confused by sites that request to send notifications without context. Consider tying the request to user gestures instead. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/notifications-on-load).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"password-inputs-can-be-pasted-into":{"id":"password-inputs-can-be-pasted-into","title":"Allows users to paste into password fields","description":"Preventing password pasting undermines good security policy. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/password-pasting).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"uses-http2":{"id":"uses-http2","title":"Uses HTTP/2 for its own resources","description":"HTTP/2 offers many benefits over HTTP/1.1, including binary headers, multiplexing, and server push. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/http2).","score":1,"scoreDisplayMode":"binary","rawValue":true,"displayValue":"","details":{"type":"table","headings":[],"items":[]}},"uses-passive-event-listeners":{"id":"uses-passive-event-listeners","title":"Uses passive listeners to improve scrolling performance","description":"Consider marking your touch and wheel event listeners as `passive` to improve your page's scroll performance. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/passive-event-listeners).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"meta-description":{"id":"meta-description","title":"Document does not have a meta description","description":"Meta descriptions may be included in search results to concisely summarize page content. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/description).","score":0,"scoreDisplayMode":"binary","rawValue":false},"http-status-code":{"id":"http-status-code","title":"Page has successful HTTP status code","description":"Pages with unsuccessful HTTP status codes may not be indexed properly. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/successful-http-code).","score":1,"scoreDisplayMode":"binary","rawValue":true},"font-size":{"id":"font-size","title":"Document uses legible font sizes","description":"Font sizes less than 12px are too small to be legible and require mobile visitors to “pinch to zoom” in order to read. Strive to have >60% of page text ≥12px. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/font-sizes).","score":1,"scoreDisplayMode":"binary","rawValue":true,"displayValue":"100% legible text","details":{"type":"table","headings":[{"key":"source","itemType":"url","text":"Source"},{"key":"selector","itemType":"code","text":"Selector"},{"key":"coverage","itemType":"text","text":"% of Page Text"},{"key":"fontSize","itemType":"text","text":"Font Size"}],"items":[{"source":"Legible text","selector":"","coverage":"100.00%","fontSize":"≥ 12px"}]}},"link-text":{"id":"link-text","title":"Links have descriptive text","description":"Descriptive link text helps search engines understand your content. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/descriptive-link-text).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[],"summary":{}}},"is-crawlable":{"id":"is-crawlable","title":"Page isn’t blocked from indexing","description":"Search engines are unable to include your pages in search results if they don't have permission to crawl them. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/indexing).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"robots-txt":{"id":"robots-txt","title":"robots.txt is valid","description":"If your robots.txt file is malformed, crawlers may not be able to understand how you want your website to be crawled or indexed.","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[],"summary":{}}},"tap-targets":{"id":"tap-targets","title":"Tap targets are not sized appropriately","description":"Interactive elements like buttons and links should be large enough (48x48px), and have enough space around them, to be easy enough to tap without overlapping onto other elements. [Learn more](https://developers.google.com/web/fundamentals/accessibility/accessible-styles#multi-device_responsive_design).","score":0.64,"scoreDisplayMode":"binary","rawValue":false,"displayValue":"72% appropriately sized tap targets","details":{"type":"table","headings":[{"key":"tapTarget","itemType":"node","text":"Tap Target"},{"key":"size","itemType":"text","text":"Size"},{"key":"overlappingTarget","itemType":"node","text":"Overlapping Target"}],"items":[{"tapTarget":{"type":"node","snippet":"\u003ca href=\"http://www.webkit.org/coding/technical-articles.html\">WebKit internals technical articles | webkit.org\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,0,LI,0,A","selector":"div.entry-content > ul > li > a"},"overlappingTarget":{"type":"node","snippet":"\u003ca href=\"http://robertnyman.com/2013/02/14/webkit-an-objective-view/\">WebKit: An Objective View | Robert Nyman &amp; Rob Hawkes\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,1,LI,0,A","selector":"div.entry-content > ul > li > a"},"tapTargetScore":912,"overlappingTargetScore":456,"overlapScoreRatio":0.5,"size":"334x19","width":334,"height":19},{"tapTarget":{"type":"node","snippet":"\u003ca href=\"http://robertnyman.com/2013/02/14/webkit-an-objective-view/\">WebKit: An Objective View | Robert Nyman &amp; Rob Hawkes\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,1,LI,0,A","selector":"div.entry-content > ul > li > a"},"overlappingTarget":{"type":"node","snippet":"\u003ca href=\"http://ariya.ofilabs.com/2011/06/your-webkit-port-is-special-just-like-every-other-port.html\">your webkit port is special (just like every other port) | Ariya Hidayat\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,2,LI,0,A","selector":"div.entry-content > ul > li > a"},"tapTargetScore":912,"overlappingTargetScore":456,"overlapScoreRatio":0.5,"size":"324x19","width":324,"height":19},{"tapTarget":{"type":"node","snippet":"\u003ca href=\"http://ariya.ofilabs.com/2011/06/your-webkit-port-is-special-just-like-every-other-port.html\">your webkit port is special (just like every other port) | Ariya Hidayat\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,2,LI,0,A","selector":"div.entry-content > ul > li > a"},"overlappingTarget":{"type":"node","snippet":"\u003ca href=\"http://blogs.adobe.com/webplatform/2013/01/21/getting-started-with-the-webkit-layout-code/\">Getting Started With the WebKit Layout Code | Adobe Web Platform Blog\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,3,LI,0,A","selector":"div.entry-content > ul > li > a"},"tapTargetScore":912,"overlappingTargetScore":456,"overlapScoreRatio":0.5,"size":"338x19","width":338,"height":19},{"tapTarget":{"type":"node","snippet":"\u003ca href=\"http://blogs.adobe.com/webplatform/2013/01/21/getting-started-with-the-webkit-layout-code/\">Getting Started With the WebKit Layout Code | Adobe Web Platform Blog\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,3,LI,0,A","selector":"div.entry-content > ul > li > a"},"overlappingTarget":{"type":"node","snippet":"\u003ca href=\"http://arunpatole.com/blog/2011/webkit-documentation/\">WebKit Documentation Overview | Arun Patole\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,4,LI,0,A","selector":"div.entry-content > ul > li > a"},"tapTargetScore":912,"overlappingTargetScore":456,"overlapScoreRatio":0.5,"size":"334x19","width":334,"height":19},{"tapTarget":{"type":"node","snippet":"\u003ca href=\"http://arunpatole.com/blog/2011/webkit-documentation/\">WebKit Documentation Overview | Arun Patole\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,4,LI,0,A","selector":"div.entry-content > ul > li > a"},"overlappingTarget":{"type":"node","snippet":"\u003ca href=\"https://www.youtube.com/watch?v=RVnARGhhs9w\">Rendering in WebKit, by Eric Seidel | YouTube\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,5,LI,0,A","selector":"div.entry-content > ul > li > a"},"tapTargetScore":912,"overlappingTargetScore":456,"overlapScoreRatio":0.5,"size":"338x19","width":338,"height":19},{"tapTarget":{"type":"node","snippet":"\u003ca href=\"https://www.youtube.com/watch?v=RVnARGhhs9w\">Rendering in WebKit, by Eric Seidel | YouTube\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,5,LI,0,A","selector":"div.entry-content > ul > li > a"},"overlappingTarget":{"type":"node","snippet":"\u003ca href=\"http://www.igvita.com/slides/2012/web-performance-for-the-curious/\">web performance for the curious | Ilya Grigorik\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,6,LI,0,A","selector":"div.entry-content > ul > li > a"},"tapTargetScore":912,"overlappingTargetScore":456,"overlapScoreRatio":0.5,"size":"327x19","width":327,"height":19}]}},"hreflang":{"id":"hreflang","title":"Document has a valid `hreflang`","description":"hreflang links tell search engines what version of a page they should list in search results for a given language or region. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/hreflang).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"plugins":{"id":"plugins","title":"Document avoids plugins","description":"Search engines can't index plugin content, and many devices restrict plugins or don't support them. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/plugins).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"canonical":{"id":"canonical","title":"Document has a valid `rel=canonical`","description":"Canonical links suggest which URL to show in search results. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/canonical).","score":1,"scoreDisplayMode":"binary","rawValue":true},"structured-data":{"id":"structured-data","title":"Structured data is valid","description":"Run the [Structured Data Testing Tool](https://search.google.com/structured-data/testing-tool/) and the [Structured Data Linter](http://linter.structured-data.org/) to validate structured data. [Learn more](https://developers.google.com/search/docs/guides/mark-up-content).","score":null,"scoreDisplayMode":"manual","rawValue":false}},"configSettings":{"output":["html"],"maxWaitForFcp":15000,"maxWaitForLoad":45000,"throttlingMethod":"simulate","throttling":{"rttMs":150,"throughputKbps":1638.4,"requestLatencyMs":562.5,"downloadThroughputKbps":1474.5600000000002,"uploadThroughputKbps":675,"cpuSlowdownMultiplier":4},"auditMode":false,"gatherMode":false,"disableStorageReset":false,"disableDeviceEmulation":false,"emulatedFormFactor":"mobile","channel":"cli","locale":"en-US","blockedUrlPatterns":null,"additionalTraceCategories":null,"extraHeaders":null,"precomputedLanternData":null,"onlyAudits":null,"onlyCategories":null,"skipAudits":null},"categories":{"performance":{"title":"Performance","auditRefs":[{"id":"first-contentful-paint","weight":3,"group":"metrics"},{"id":"first-meaningful-paint","weight":1,"group":"metrics"},{"id":"speed-index","weight":4,"group":"metrics"},{"id":"interactive","weight":5,"group":"metrics"},{"id":"first-cpu-idle","weight":2,"group":"metrics"},{"id":"estimated-input-latency","weight":0,"group":"metrics"},{"id":"max-potential-fid","weight":0},{"id":"render-blocking-resources","weight":0,"group":"load-opportunities"},{"id":"uses-responsive-images","weight":0,"group":"load-opportunities"},{"id":"offscreen-images","weight":0,"group":"load-opportunities"},{"id":"unminified-css","weight":0,"group":"load-opportunities"},{"id":"unminified-javascript","weight":0,"group":"load-opportunities"},{"id":"unused-css-rules","weight":0,"group":"load-opportunities"},{"id":"uses-optimized-images","weight":0,"group":"load-opportunities"},{"id":"uses-webp-images","weight":0,"group":"load-opportunities"},{"id":"uses-text-compression","weight":0,"group":"load-opportunities"},{"id":"uses-rel-preconnect","weight":0,"group":"load-opportunities"},{"id":"time-to-first-byte","weight":0,"group":"load-opportunities"},{"id":"redirects","weight":0,"group":"load-opportunities"},{"id":"uses-rel-preload","weight":0,"group":"load-opportunities"},{"id":"efficient-animated-content","weight":0,"group":"load-opportunities"},{"id":"total-byte-weight","weight":0,"group":"diagnostics"},{"id":"uses-long-cache-ttl","weight":0,"group":"diagnostics"},{"id":"dom-size","weight":0,"group":"diagnostics"},{"id":"critical-request-chains","weight":0,"group":"diagnostics"},{"id":"user-timings","weight":0,"group":"diagnostics"},{"id":"bootup-time","weight":0,"group":"diagnostics"},{"id":"mainthread-work-breakdown","weight":0,"group":"diagnostics"},{"id":"font-display","weight":0,"group":"diagnostics"},{"id":"network-requests","weight":0},{"id":"network-rtt","weight":0},{"id":"network-server-latency","weight":0},{"id":"main-thread-tasks","weight":0},{"id":"diagnostics","weight":0},{"id":"metrics","weight":0},{"id":"screenshot-thumbnails","weight":0},{"id":"final-screenshot","weight":0}],"id":"performance","score":0.99},"accessibility":{"title":"Accessibility","description":"These checks highlight opportunities to [improve the accessibility of your web app](https://developers.google.com/web/fundamentals/accessibility). Only a subset of accessibility issues can be automatically detected so manual testing is also encouraged.","manualDescription":"These items address areas which an automated testing tool cannot cover. Learn more in our guide on [conducting an accessibility review](https://developers.google.com/web/fundamentals/accessibility/how-to-review).","auditRefs":[{"id":"accesskeys","weight":0,"group":"a11y-navigation"},{"id":"aria-allowed-attr","weight":0,"group":"a11y-aria"},{"id":"aria-required-attr","weight":2,"group":"a11y-aria"},{"id":"aria-required-children","weight":5,"group":"a11y-aria"},{"id":"aria-required-parent","weight":2,"group":"a11y-aria"},{"id":"aria-roles","weight":3,"group":"a11y-aria"},{"id":"aria-valid-attr-value","weight":0,"group":"a11y-aria"},{"id":"aria-valid-attr","weight":0,"group":"a11y-aria"},{"id":"audio-caption","weight":0,"group":"a11y-audio-video"},{"id":"button-name","weight":0,"group":"a11y-names-labels"},{"id":"bypass","weight":10,"group":"a11y-navigation"},{"id":"color-contrast","weight":6,"group":"a11y-color-contrast"},{"id":"definition-list","weight":0,"group":"a11y-tables-lists"},{"id":"dlitem","weight":0,"group":"a11y-tables-lists"},{"id":"document-title","weight":2,"group":"a11y-names-labels"},{"id":"duplicate-id","weight":5,"group":"a11y-best-practices"},{"id":"frame-title","weight":0,"group":"a11y-names-labels"},{"id":"html-has-lang","weight":4,"group":"a11y-language"},{"id":"html-lang-valid","weight":1,"group":"a11y-language"},{"id":"image-alt","weight":8,"group":"a11y-names-labels"},{"id":"input-image-alt","weight":0,"group":"a11y-names-labels"},{"id":"label","weight":10,"group":"a11y-names-labels"},{"id":"layout-table","weight":0,"group":"a11y-tables-lists"},{"id":"link-name","weight":9,"group":"a11y-names-labels"},{"id":"list","weight":5,"group":"a11y-tables-lists"},{"id":"listitem","weight":4,"group":"a11y-tables-lists"},{"id":"meta-refresh","weight":0,"group":"a11y-best-practices"},{"id":"meta-viewport","weight":3,"group":"a11y-best-practices"},{"id":"object-alt","weight":0,"group":"a11y-names-labels"},{"id":"tabindex","weight":0,"group":"a11y-navigation"},{"id":"td-headers-attr","weight":1,"group":"a11y-tables-lists"},{"id":"th-has-data-cells","weight":1,"group":"a11y-tables-lists"},{"id":"valid-lang","weight":0,"group":"a11y-language"},{"id":"video-caption","weight":0,"group":"a11y-audio-video"},{"id":"video-description","weight":0,"group":"a11y-audio-video"},{"id":"logical-tab-order","weight":0},{"id":"focusable-controls","weight":0},{"id":"interactive-element-affordance","weight":0},{"id":"managed-focus","weight":0},{"id":"focus-traps","weight":0},{"id":"custom-controls-labels","weight":0},{"id":"custom-controls-roles","weight":0},{"id":"visual-order-follows-dom","weight":0},{"id":"offscreen-content-hidden","weight":0},{"id":"heading-levels","weight":0},{"id":"use-landmarks","weight":0}],"id":"accessibility","score":0.56},"best-practices":{"title":"Best Practices","auditRefs":[{"id":"appcache-manifest","weight":1},{"id":"is-on-https","weight":1},{"id":"uses-http2","weight":1},{"id":"uses-passive-event-listeners","weight":1},{"id":"no-document-write","weight":1},{"id":"external-anchors-use-rel-noopener","weight":1},{"id":"geolocation-on-start","weight":1},{"id":"doctype","weight":1},{"id":"no-vulnerable-libraries","weight":1},{"id":"js-libraries","weight":0},{"id":"notification-on-start","weight":1},{"id":"deprecations","weight":1},{"id":"password-inputs-can-be-pasted-into","weight":1},{"id":"errors-in-console","weight":1},{"id":"image-aspect-ratio","weight":1}],"id":"best-practices","score":0.93},"seo":{"title":"SEO","description":"These checks ensure that your page is optimized for search engine results ranking. There are additional factors Lighthouse does not check that may affect your search ranking. [Learn more](https://support.google.com/webmasters/answer/35769).","manualDescription":"Run these additional validators on your site to check additional SEO best practices.","auditRefs":[{"id":"viewport","weight":1,"group":"seo-mobile"},{"id":"document-title","weight":1,"group":"seo-content"},{"id":"meta-description","weight":1,"group":"seo-content"},{"id":"http-status-code","weight":1,"group":"seo-crawl"},{"id":"link-text","weight":1,"group":"seo-content"},{"id":"is-crawlable","weight":1,"group":"seo-crawl"},{"id":"robots-txt","weight":1,"group":"seo-crawl"},{"id":"hreflang","weight":1,"group":"seo-content"},{"id":"canonical","weight":1,"group":"seo-content"},{"id":"font-size","weight":1,"group":"seo-mobile"},{"id":"plugins","weight":1,"group":"seo-content"},{"id":"tap-targets","weight":1,"group":"seo-mobile"},{"id":"structured-data","weight":0}],"id":"seo","score":0.89},"pwa":{"title":"Progressive Web App","description":"These checks validate the aspects of a Progressive Web App. [Learn more](https://developers.google.com/web/progressive-web-apps/checklist).","manualDescription":"These checks are required by the baseline [PWA Checklist](https://developers.google.com/web/progressive-web-apps/checklist) but are not automatically checked by Lighthouse. They do not affect your score but it's important that you verify them manually.","auditRefs":[{"id":"load-fast-enough-for-pwa","weight":7,"group":"pwa-fast-reliable"},{"id":"works-offline","weight":5,"group":"pwa-fast-reliable"},{"id":"offline-start-url","weight":1,"group":"pwa-fast-reliable"},{"id":"is-on-https","weight":2,"group":"pwa-installable"},{"id":"service-worker","weight":1,"group":"pwa-installable"},{"id":"installable-manifest","weight":2,"group":"pwa-installable"},{"id":"redirects-http","weight":2,"group":"pwa-optimized"},{"id":"splash-screen","weight":1,"group":"pwa-optimized"},{"id":"themed-omnibox","weight":1,"group":"pwa-optimized"},{"id":"content-width","weight":1,"group":"pwa-optimized"},{"id":"viewport","weight":2,"group":"pwa-optimized"},{"id":"without-javascript","weight":1,"group":"pwa-optimized"},{"id":"pwa-cross-browser","weight":0},{"id":"pwa-page-transitions","weight":0},{"id":"pwa-each-page-has-url","weight":0}],"id":"pwa","score":0.58}},"categoryGroups":{"metrics":{"title":"Metrics"},"load-opportunities":{"title":"Opportunities","description":"These optimizations can speed up your page load."},"diagnostics":{"title":"Diagnostics","description":"More information about the performance of your application."},"pwa-fast-reliable":{"title":"Fast and reliable"},"pwa-installable":{"title":"Installable"},"pwa-optimized":{"title":"PWA Optimized"},"a11y-best-practices":{"title":"Best practices","description":"These items highlight common accessibility best practices."},"a11y-color-contrast":{"title":"Contrast","description":"These are opportunities to improve the legibility of your content."},"a11y-names-labels":{"title":"Names and labels","description":"These are opportunities to improve the semantics of the controls in your application. This may enhance the experience for users of assistive technology, like a screen reader."},"a11y-navigation":{"title":"Navigation","description":"These are opportunities to improve keyboard navigation in your application."},"a11y-aria":{"title":"ARIA","description":"These are opportunities to improve the usage of ARIA in your application which may enhance the experience for users of assistive technology, like a screen reader."},"a11y-language":{"title":"Internationalization and localization","description":"These are opportunities to improve the interpretation of your content by users in different locales."},"a11y-audio-video":{"title":"Audio and video","description":"These are opportunities to provide alternative content for audio and video. This may improve the experience for users with hearing or vision impairments."},"a11y-tables-lists":{"title":"Tables and lists","description":"These are opportunities to to improve the experience of reading tabular or list data using assistive technology, like a screen reader."},"seo-mobile":{"title":"Mobile Friendly","description":"Make sure your pages are mobile friendly so users don’t have to pinch or zoom in order to read the content pages. [Learn more](https://developers.google.com/search/mobile-sites/)."},"seo-content":{"title":"Content Best Practices","description":"Format your HTML in a way that enables crawlers to better understand your app’s content."},"seo-crawl":{"title":"Crawling and Indexing","description":"To appear in search results, crawlers need access to your app."}},"timing":{"entries":[{"startTime":1057.470395,"name":"lh:init:config","duration":147.37767599999984,"entryType":"measure"},{"startTime":1061.462827,"name":"lh:config:requireGatherers","duration":25.433238999999958,"entryType":"measure"},{"startTime":1087.146782,"name":"lh:config:requireAudits","duration":111.80127599999992,"entryType":"measure"},{"startTime":1205.235191,"name":"lh:runner:run","duration":4395.956848,"entryType":"measure"},{"startTime":1206.108866,"name":"lh:init:connect","duration":199.05716699999994,"entryType":"measure"},{"startTime":1405.336278,"name":"lh:gather:getVersion","duration":18.682731000000103,"entryType":"measure"},{"startTime":1424.221107,"name":"lh:gather:loadBlank","duration":69.02815899999996,"entryType":"measure"},{"startTime":1493.374747,"name":"lh:gather:getBenchmarkIndex","duration":512.6017769999999,"entryType":"measure"},{"startTime":2006.092718,"name":"lh:gather:setupDriver","duration":18.859613999999965,"entryType":"measure"},{"startTime":2026.649251,"name":"lh:gather:beforePass","duration":4.210219000000052,"entryType":"measure"},{"startTime":2027.916593,"name":"lh:gather:beforePass:Scripts","duration":0.08236699999997654,"entryType":"measure"},{"startTime":2028.023467,"name":"lh:gather:beforePass:CSSUsage","duration":0.022510000000011132,"entryType":"measure"},{"startTime":2028.058368,"name":"lh:gather:beforePass:ViewportDimensions","duration":0.019557999999960884,"entryType":"measure"},{"startTime":2028.087842,"name":"lh:gather:beforePass:RuntimeExceptions","duration":0.05566399999997884,"entryType":"measure"},{"startTime":2028.154975,"name":"lh:gather:beforePass:ChromeConsoleMessages","duration":1.5847900000001118,"entryType":"measure"},{"startTime":2029.767835,"name":"lh:gather:beforePass:Accessibility","duration":0.030859999999847787,"entryType":"measure"},{"startTime":2029.804515,"name":"lh:gather:beforePass:AnchorElements","duration":0.01615799999990486,"entryType":"measure"},{"startTime":2029.825338,"name":"lh:gather:beforePass:ImageElements","duration":0.013358999999809384,"entryType":"measure"},{"startTime":2029.842579,"name":"lh:gather:beforePass:LinkElements","duration":0.013700000000198997,"entryType":"measure"},{"startTime":2029.860113,"name":"lh:gather:beforePass:MetaElements","duration":0.015853000000106476,"entryType":"measure"},{"startTime":2029.885319,"name":"lh:gather:beforePass:AppCacheManifest","duration":0.012621999999964828,"entryType":"measure"},{"startTime":2029.901852,"name":"lh:gather:beforePass:Doctype","duration":0.016696000000138156,"entryType":"measure"},{"startTime":2029.925623,"name":"lh:gather:beforePass:DOMStats","duration":0.008916999999883046,"entryType":"measure"},{"startTime":2029.941684,"name":"lh:gather:beforePass:JSLibraries","duration":0.014091000000007625,"entryType":"measure"},{"startTime":2029.959679,"name":"lh:gather:beforePass:OptimizedImages","duration":0.011036999999987529,"entryType":"measure"},{"startTime":2029.974672,"name":"lh:gather:beforePass:PasswordInputsWithPreventedPaste","duration":0.011312999999972817,"entryType":"measure"},{"startTime":2029.989494,"name":"lh:gather:beforePass:ResponseCompression","duration":0.010911000000078275,"entryType":"measure"},{"startTime":2030.004084,"name":"lh:gather:beforePass:TagsBlockingFirstPaint","duration":0.7397150000001602,"entryType":"measure"},{"startTime":2030.755572,"name":"lh:gather:beforePass:FontSize","duration":0.02134699999987788,"entryType":"measure"},{"startTime":2030.78186,"name":"lh:gather:beforePass:Hreflang","duration":0.01435799999990195,"entryType":"measure"},{"startTime":2030.800257,"name":"lh:gather:beforePass:EmbeddedContent","duration":0.011173999999982698,"entryType":"measure"},{"startTime":2030.815007,"name":"lh:gather:beforePass:Canonical","duration":0.01040499999999156,"entryType":"measure"},{"startTime":2030.831034,"name":"lh:gather:beforePass:RobotsTxt","duration":0.006580999999869164,"entryType":"measure"},{"startTime":2030.844021,"name":"lh:gather:beforePass:TapTargets","duration":0.0083319999998821,"entryType":"measure"},{"startTime":2031.146338,"name":"lh:gather:loadPage-defaultPass","duration":1770.360033,"entryType":"measure"},{"startTime":2055.621213,"name":"lh:gather:getVersion","duration":0.397562999999991,"entryType":"measure"},{"startTime":3801.525232,"name":"lh:gather:pass","duration":2.0325219999999717,"entryType":"measure"},{"startTime":3804.951085,"name":"lh:gather:getTrace","duration":60.30983100000003,"entryType":"measure"},{"startTime":3865.26934,"name":"lh:gather:getDevtoolsLog","duration":3.925416000000041,"entryType":"measure"},{"startTime":3870.33371,"name":"lh:gather:afterPass","duration":930.3865889999997,"entryType":"measure"},{"startTime":3870.348352,"name":"lh:gather:afterPass:Scripts","duration":11.78266799999983,"entryType":"measure"},{"startTime":3882.159885,"name":"lh:gather:afterPass:CSSUsage","duration":28.65450299999975,"entryType":"measure"},{"startTime":3910.829962,"name":"lh:gather:afterPass:ViewportDimensions","duration":1.3921290000002955,"entryType":"measure"},{"startTime":3912.237077,"name":"lh:gather:afterPass:RuntimeExceptions","duration":0.2095499999995809,"entryType":"measure"},{"startTime":3912.462924,"name":"lh:gather:afterPass:ChromeConsoleMessages","duration":1.4146430000000692,"entryType":"measure"},{"startTime":3913.894998,"name":"lh:gather:afterPass:Accessibility","duration":355.37064899999996,"entryType":"measure"},{"startTime":4269.277326,"name":"lh:gather:afterPass:AnchorElements","duration":4.828472999999576,"entryType":"measure"},{"startTime":4274.117193,"name":"lh:gather:afterPass:ImageElements","duration":7.284168999999565,"entryType":"measure"},{"startTime":4281.41304,"name":"lh:gather:afterPass:LinkElements","duration":1.7815019999998185,"entryType":"measure"},{"startTime":4283.207979,"name":"lh:gather:afterPass:MetaElements","duration":1.513585000000603,"entryType":"measure"},{"startTime":4284.734676,"name":"lh:gather:afterPass:AppCacheManifest","duration":2.194814000000406,"entryType":"measure"},{"startTime":4286.939785,"name":"lh:gather:afterPass:Doctype","duration":2.113401000000522,"entryType":"measure"},{"startTime":4289.08811,"name":"lh:gather:afterPass:DOMStats","duration":19.573711000000003,"entryType":"measure"},{"startTime":4308.678236,"name":"lh:gather:afterPass:JSLibraries","duration":7.409986000000572,"entryType":"measure"},{"startTime":4316.099703,"name":"lh:gather:afterPass:OptimizedImages","duration":142.67801599999984,"entryType":"measure"},{"startTime":4458.793054,"name":"lh:gather:afterPass:PasswordInputsWithPreventedPaste","duration":1.0651510000006965,"entryType":"measure"},{"startTime":4459.866685,"name":"lh:gather:afterPass:ResponseCompression","duration":0.337865999999849,"entryType":"measure"},{"startTime":4460.212096,"name":"lh:gather:afterPass:TagsBlockingFirstPaint","duration":1.7938829999993686,"entryType":"measure"},{"startTime":4462.014607,"name":"lh:gather:afterPass:FontSize","duration":299.68027600000005,"entryType":"measure"},{"startTime":4761.708613,"name":"lh:gather:afterPass:Hreflang","duration":1.3360090000005584,"entryType":"measure"},{"startTime":4763.056512,"name":"lh:gather:afterPass:EmbeddedContent","duration":1.2667929999997796,"entryType":"measure"},{"startTime":4764.333881,"name":"lh:gather:afterPass:Canonical","duration":1.9413280000007944,"entryType":"measure"},{"startTime":4766.286206,"name":"lh:gather:afterPass:RobotsTxt","duration":26.341521000000284,"entryType":"measure"},{"startTime":4792.646408,"name":"lh:gather:afterPass:TapTargets","duration":8.063930000000255,"entryType":"measure"},{"startTime":4801.439372,"name":"lh:gather:loadBlank","duration":15.563866000000417,"entryType":"measure"},{"startTime":4817.019968,"name":"lh:gather:beforePass","duration":3.07687100000021,"entryType":"measure"},{"startTime":4817.724484,"name":"lh:gather:beforePass:ServiceWorker","duration":1.5663409999997384,"entryType":"measure"},{"startTime":4819.308061,"name":"lh:gather:beforePass:Offline","duration":0.7503950000000259,"entryType":"measure"},{"startTime":4820.073898,"name":"lh:gather:beforePass:StartUrl","duration":0.015836000000490458,"entryType":"measure"},{"startTime":4820.122779,"name":"lh:gather:loadPage-offlinePass","duration":88.13174900000013,"entryType":"measure"},{"startTime":4908.267476,"name":"lh:gather:pass","duration":0.30993599999965227,"entryType":"measure"},{"startTime":4908.589627,"name":"lh:gather:getDevtoolsLog","duration":1.9430349999993268,"entryType":"measure"},{"startTime":4911.454184,"name":"lh:gather:afterPass","duration":1.7188349999996717,"entryType":"measure"},{"startTime":4911.47334,"name":"lh:gather:afterPass:ServiceWorker","duration":0.11534100000062608,"entryType":"measure"},{"startTime":4911.597091,"name":"lh:gather:afterPass:Offline","duration":1.362119000000348,"entryType":"measure"},{"startTime":4912.96983,"name":"lh:gather:afterPass:StartUrl","duration":0.1930869999996503,"entryType":"measure"},{"startTime":4914.249984,"name":"lh:gather:loadBlank","duration":14.558560000000398,"entryType":"measure"},{"startTime":4928.819724,"name":"lh:gather:beforePass","duration":0.8103750000000218,"entryType":"measure"},{"startTime":4929.476768,"name":"lh:gather:beforePass:HTTPRedirect","duration":0.09995199999957549,"entryType":"measure"},{"startTime":4929.587498,"name":"lh:gather:beforePass:HTMLWithoutJavaScript","duration":0.03790099999969243,"entryType":"measure"},{"startTime":4929.650873,"name":"lh:gather:loadPage-redirectPass","duration":117.75598500000069,"entryType":"measure"},{"startTime":5047.414365,"name":"lh:gather:pass","duration":0.13985000000047876,"entryType":"measure"},{"startTime":5047.564089,"name":"lh:gather:getDevtoolsLog","duration":2.7122249999993073,"entryType":"measure"},{"startTime":5050.998959,"name":"lh:gather:afterPass","duration":7.708322000000408,"entryType":"measure"},{"startTime":5051.009826,"name":"lh:gather:afterPass:HTTPRedirect","duration":5.606124999999338,"entryType":"measure"},{"startTime":5056.630784,"name":"lh:gather:afterPass:HTMLWithoutJavaScript","duration":2.0654889999996158,"entryType":"measure"},{"startTime":5061.887229,"name":"lh:gather:disconnect","duration":2.7605329999996684,"entryType":"measure"},{"startTime":5065.379565,"name":"lh:runner:auditing","duration":535.139373,"entryType":"measure"},{"startTime":5066.811752,"name":"lh:audit:is-on-https","duration":2.7938270000004195,"entryType":"measure"},{"startTime":5067.304783,"name":"lh:computed:NetworkRecords","duration":1.7556360000007771,"entryType":"measure"},{"startTime":5069.649485,"name":"lh:audit:redirects-http","duration":0.20216499999969528,"entryType":"measure"},{"startTime":5069.871604,"name":"lh:audit:service-worker","duration":0.25190500000007887,"entryType":"measure"},{"startTime":5070.141215,"name":"lh:audit:works-offline","duration":0.2284460000000763,"entryType":"measure"},{"startTime":5070.450445,"name":"lh:audit:viewport","duration":1.127806999999848,"entryType":"measure"},{"startTime":5070.711247,"name":"lh:computed:ViewportMeta","duration":0.8014960000000428,"entryType":"measure"},{"startTime":5071.607189,"name":"lh:audit:without-javascript","duration":0.2569809999995414,"entryType":"measure"},{"startTime":5076.118175,"name":"lh:audit:first-contentful-paint","duration":20.202503000000434,"entryType":"measure"},{"startTime":5076.383312,"name":"lh:computed:FirstContentfulPaint","duration":19.57310899999993,"entryType":"measure"},{"startTime":5076.551947,"name":"lh:computed:TraceOfTab","duration":8.321171000000504,"entryType":"measure"},{"startTime":5084.990689,"name":"lh:computed:LanternFirstContentfulPaint","duration":10.954499999999825,"entryType":"measure"},{"startTime":5085.306661,"name":"lh:computed:PageDependencyGraph","duration":2.373356000000058,"entryType":"measure"},{"startTime":5087.718762,"name":"lh:computed:LoadSimulator","duration":3.7422929999993357,"entryType":"measure"},{"startTime":5087.864552,"name":"lh:computed:NetworkAnalysis","duration":3.343133000000307,"entryType":"measure"},{"startTime":5096.562545,"name":"lh:audit:first-meaningful-paint","duration":1.9694760000002134,"entryType":"measure"},{"startTime":5096.788694,"name":"lh:computed:FirstMeaningfulPaint","duration":1.5981339999998454,"entryType":"measure"},{"startTime":5096.855082,"name":"lh:computed:LanternFirstMeaningfulPaint","duration":1.5225360000004002,"entryType":"measure"},{"startTime":5098.693246,"name":"lh:audit:load-fast-enough-for-pwa","duration":4.835985000000619,"entryType":"measure"},{"startTime":5098.939662,"name":"lh:computed:Interactive","duration":4.4409450000002835,"entryType":"measure"},{"startTime":5098.997428,"name":"lh:computed:LanternInteractive","duration":4.371960000000399,"entryType":"measure"},{"startTime":5103.650213,"name":"lh:audit:speed-index","duration":248.32604900000024,"entryType":"measure"},{"startTime":5103.854152,"name":"lh:computed:SpeedIndex","duration":248.0036600000003,"entryType":"measure"},{"startTime":5103.911207,"name":"lh:computed:LanternSpeedIndex","duration":247.93587000000025,"entryType":"measure"},{"startTime":5103.980408,"name":"lh:computed:Speedline","duration":224.2617599999994,"entryType":"measure"},{"startTime":5351.994017,"name":"lh:audit:screenshot-thumbnails","duration":107.82949600000029,"entryType":"measure"},{"startTime":5459.840568,"name":"lh:audit:final-screenshot","duration":0.4759040000008099,"entryType":"measure"},{"startTime":5460.039963,"name":"lh:computed:Screenshots","duration":0.23274799999944662,"entryType":"measure"},{"startTime":5460.463944,"name":"lh:audit:estimated-input-latency","duration":10.142394999999851,"entryType":"measure"},{"startTime":5460.636054,"name":"lh:computed:EstimatedInputLatency","duration":9.860083000000486,"entryType":"measure"},{"startTime":5460.686498,"name":"lh:computed:LanternEstimatedInputLatency","duration":9.80015000000003,"entryType":"measure"},{"startTime":5470.752779,"name":"lh:audit:max-potential-fid","duration":9.019664999999804,"entryType":"measure"},{"startTime":5470.996883,"name":"lh:computed:MaxPotentialFID","duration":8.65762900000027,"entryType":"measure"},{"startTime":5471.062047,"name":"lh:computed:LanternMaxPotentialFID","duration":8.582461999999396,"entryType":"measure"},{"startTime":5479.789004,"name":"lh:audit:errors-in-console","duration":0.2475559999993493,"entryType":"measure"},{"startTime":5480.17325,"name":"lh:audit:time-to-first-byte","duration":5.173338000000513,"entryType":"measure"},{"startTime":5480.335885,"name":"lh:computed:MainResource","duration":0.1755539999994653,"entryType":"measure"},{"startTime":5485.469759,"name":"lh:audit:first-cpu-idle","duration":3.6055420000002414,"entryType":"measure"},{"startTime":5485.696087,"name":"lh:computed:FirstCPUIdle","duration":3.17855899999995,"entryType":"measure"},{"startTime":5485.747576,"name":"lh:computed:LanternFirstCPUIdle","duration":3.110247999999956,"entryType":"measure"},{"startTime":5489.239619,"name":"lh:audit:interactive","duration":0.627704999999878,"entryType":"measure"},{"startTime":5490.022286,"name":"lh:audit:user-timings","duration":1.236254999999801,"entryType":"measure"},{"startTime":5490.274085,"name":"lh:computed:UserTimings","duration":0.5852500000000873,"entryType":"measure"},{"startTime":5491.405001,"name":"lh:audit:critical-request-chains","duration":1.4567090000000462,"entryType":"measure"},{"startTime":5491.645529,"name":"lh:computed:CriticalRequestChains","duration":0.5123349999994389,"entryType":"measure"},{"startTime":5493.019282,"name":"lh:audit:redirects","duration":0.8137870000000476,"entryType":"measure"},{"startTime":5493.849696,"name":"lh:audit:installable-manifest","duration":0.4491010000001552,"entryType":"measure"},{"startTime":5494.042786,"name":"lh:computed:ManifestValues","duration":0.0843750000003638,"entryType":"measure"},{"startTime":5494.309527,"name":"lh:audit:splash-screen","duration":0.17922699999962788,"entryType":"measure"},{"startTime":5494.498507,"name":"lh:audit:themed-omnibox","duration":0.2249019999999291,"entryType":"measure"},{"startTime":5494.733039,"name":"lh:audit:content-width","duration":0.13079900000047928,"entryType":"measure"},{"startTime":5494.873167,"name":"lh:audit:image-aspect-ratio","duration":0.44348900000022695,"entryType":"measure"},{"startTime":5495.327876,"name":"lh:audit:deprecations","duration":0.14558799999940675,"entryType":"measure"},{"startTime":5495.603866,"name":"lh:audit:mainthread-work-breakdown","duration":2.6679739999999583,"entryType":"measure"},{"startTime":5495.81344,"name":"lh:computed:MainThreadTasks","duration":2.007032000000436,"entryType":"measure"},{"startTime":5498.376011,"name":"lh:audit:bootup-time","duration":1.0047739999999976,"entryType":"measure"},{"startTime":5499.47006,"name":"lh:audit:uses-rel-preload","duration":0.996063999999933,"entryType":"measure"},{"startTime":5499.728829,"name":"lh:computed:LoadSimulator","duration":0.07226300000002084,"entryType":"measure"},{"startTime":5500.560108,"name":"lh:audit:uses-rel-preconnect","duration":0.7373450000004595,"entryType":"measure"},{"startTime":5501.411916,"name":"lh:audit:font-display","duration":0.6753570000000764,"entryType":"measure"},{"startTime":5502.098705,"name":"lh:audit:diagnostics","duration":0.47818499999993946,"entryType":"measure"},{"startTime":5502.587286,"name":"lh:audit:network-requests","duration":0.5338199999996505,"entryType":"measure"},{"startTime":5503.224725,"name":"lh:audit:network-rtt","duration":0.37558999999964726,"entryType":"measure"},{"startTime":5503.686689,"name":"lh:audit:network-server-latency","duration":0.3780930000002627,"entryType":"measure"},{"startTime":5504.07842,"name":"lh:audit:main-thread-tasks","duration":0.39316299999973126,"entryType":"measure"},{"startTime":5504.492013,"name":"lh:audit:metrics","duration":1.0056800000002113,"entryType":"measure"},{"startTime":5505.524794,"name":"lh:audit:offline-start-url","duration":0.34763399999974354,"entryType":"measure"},{"startTime":5505.919421,"name":"lh:audit:pwa-cross-browser","duration":0.15487900000061927,"entryType":"measure"},{"startTime":5506.093065,"name":"lh:audit:pwa-page-transitions","duration":0.07337900000038644,"entryType":"measure"},{"startTime":5506.181403,"name":"lh:audit:pwa-each-page-has-url","duration":0.04883300000074087,"entryType":"measure"},{"startTime":5506.402687,"name":"lh:audit:accesskeys","duration":0.3418209999999817,"entryType":"measure"},{"startTime":5506.860411,"name":"lh:audit:aria-allowed-attr","duration":0.17518900000050053,"entryType":"measure"},{"startTime":5507.147144,"name":"lh:audit:aria-required-attr","duration":0.5453180000004068,"entryType":"measure"},{"startTime":5507.823444,"name":"lh:audit:aria-required-children","duration":0.49444300000050134,"entryType":"measure"},{"startTime":5508.434958,"name":"lh:audit:aria-required-parent","duration":0.47541499999988446,"entryType":"measure"},{"startTime":5509.006855,"name":"lh:audit:aria-roles","duration":0.4678149999999732,"entryType":"measure"},{"startTime":5509.576567,"name":"lh:audit:aria-valid-attr-value","duration":0.18293799999992189,"entryType":"measure"},{"startTime":5509.877803,"name":"lh:audit:aria-valid-attr","duration":0.19404499999927793,"entryType":"measure"},{"startTime":5510.190669,"name":"lh:audit:audio-caption","duration":10.25999100000081,"entryType":"measure"},{"startTime":5520.58669,"name":"lh:audit:button-name","duration":0.2687209999994593,"entryType":"measure"},{"startTime":5520.996415,"name":"lh:audit:bypass","duration":0.5411819999999352,"entryType":"measure"},{"startTime":5521.67872,"name":"lh:audit:color-contrast","duration":0.5911660000001575,"entryType":"measure"},{"startTime":5522.437169,"name":"lh:audit:definition-list","duration":0.2776610000000801,"entryType":"measure"},{"startTime":5522.84502,"name":"lh:audit:dlitem","duration":0.27742100000068604,"entryType":"measure"},{"startTime":5523.237193,"name":"lh:audit:document-title","duration":0.5317150000000765,"entryType":"measure"},{"startTime":5523.890281,"name":"lh:audit:duplicate-id","duration":0.9060980000003838,"entryType":"measure"},{"startTime":5524.92893,"name":"lh:audit:frame-title","duration":0.3310480000000098,"entryType":"measure"},{"startTime":5525.381153,"name":"lh:audit:html-has-lang","duration":0.5926069999995889,"entryType":"measure"},{"startTime":5526.105023,"name":"lh:audit:html-lang-valid","duration":0.5432209999999031,"entryType":"measure"},{"startTime":5526.754263,"name":"lh:audit:image-alt","duration":0.43577300000015384,"entryType":"measure"},{"startTime":5527.298385,"name":"lh:audit:input-image-alt","duration":0.38340900000002875,"entryType":"measure"},{"startTime":5527.787284,"name":"lh:audit:label","duration":0.4392120000002251,"entryType":"measure"},{"startTime":5528.365065,"name":"lh:audit:layout-table","duration":0.301872000000003,"entryType":"measure"},{"startTime":5528.76215,"name":"lh:audit:link-name","duration":0.4229200000008859,"entryType":"measure"},{"startTime":5529.328094,"name":"lh:audit:list","duration":0.4188559999993231,"entryType":"measure"},{"startTime":5529.872588,"name":"lh:audit:listitem","duration":0.42327800000020943,"entryType":"measure"},{"startTime":5530.406374,"name":"lh:audit:meta-refresh","duration":0.30807699999968463,"entryType":"measure"},{"startTime":5530.874625,"name":"lh:audit:meta-viewport","duration":0.4425409999994372,"entryType":"measure"},{"startTime":5531.414949,"name":"lh:audit:object-alt","duration":0.31945600000017293,"entryType":"measure"},{"startTime":5531.843167,"name":"lh:audit:tabindex","duration":0.33120099999996455,"entryType":"measure"},{"startTime":5532.32225,"name":"lh:audit:td-headers-attr","duration":0.413485999999466,"entryType":"measure"},{"startTime":5532.862142,"name":"lh:audit:th-has-data-cells","duration":0.4144820000001346,"entryType":"measure"},{"startTime":5533.371245,"name":"lh:audit:valid-lang","duration":0.32459599999947386,"entryType":"measure"},{"startTime":5533.805717,"name":"lh:audit:video-caption","duration":0.3363339999996242,"entryType":"measure"},{"startTime":5534.253669,"name":"lh:audit:video-description","duration":0.3556040000003122,"entryType":"measure"},{"startTime":5534.624462,"name":"lh:audit:custom-controls-labels","duration":0.04938800000036281,"entryType":"measure"},{"startTime":5534.683989,"name":"lh:audit:custom-controls-roles","duration":0.042510000000220316,"entryType":"measure"},{"startTime":5534.73625,"name":"lh:audit:focus-traps","duration":0.04320999999981723,"entryType":"measure"},{"startTime":5534.789052,"name":"lh:audit:focusable-controls","duration":0.04853999999977532,"entryType":"measure"},{"startTime":5534.846886,"name":"lh:audit:heading-levels","duration":0.04054399999949965,"entryType":"measure"},{"startTime":5534.896619,"name":"lh:audit:interactive-element-affordance","duration":0.04100699999980861,"entryType":"measure"},{"startTime":5534.94676,"name":"lh:audit:logical-tab-order","duration":0.03876300000047195,"entryType":"measure"},{"startTime":5534.994935,"name":"lh:audit:managed-focus","duration":0.04209700000046723,"entryType":"measure"},{"startTime":5535.046377,"name":"lh:audit:offscreen-content-hidden","duration":0.041031000000657514,"entryType":"measure"},{"startTime":5535.096611,"name":"lh:audit:use-landmarks","duration":0.040420000000267464,"entryType":"measure"},{"startTime":5535.146039,"name":"lh:audit:visual-order-follows-dom","duration":0.03879400000005262,"entryType":"measure"},{"startTime":5535.294166,"name":"lh:audit:uses-long-cache-ttl","duration":1.4019500000003973,"entryType":"measure"},{"startTime":5536.794403,"name":"lh:audit:total-byte-weight","duration":0.3865009999999529,"entryType":"measure"},{"startTime":5537.265827,"name":"lh:audit:offscreen-images","duration":2.9817659999998796,"entryType":"measure"},{"startTime":5540.341305,"name":"lh:audit:render-blocking-resources","duration":4.097705000000133,"entryType":"measure"},{"startTime":5543.030698,"name":"lh:computed:FirstContentfulPaint","duration":0.9069440000002942,"entryType":"measure"},{"startTime":5543.072123,"name":"lh:computed:LanternFirstContentfulPaint","duration":0.8585030000003826,"entryType":"measure"},{"startTime":5544.52102,"name":"lh:audit:unminified-css","duration":12.241367999999966,"entryType":"measure"},{"startTime":5556.853135,"name":"lh:audit:unminified-javascript","duration":18.38481199999933,"entryType":"measure"},{"startTime":5575.37858,"name":"lh:audit:unused-css-rules","duration":2.256040000000212,"entryType":"measure"},{"startTime":5577.748456,"name":"lh:audit:uses-webp-images","duration":2.0804929999994783,"entryType":"measure"},{"startTime":5579.926816,"name":"lh:audit:uses-optimized-images","duration":1.909128000000237,"entryType":"measure"},{"startTime":5581.9276,"name":"lh:audit:uses-text-compression","duration":1.5906279999999242,"entryType":"measure"},{"startTime":5583.60714,"name":"lh:audit:uses-responsive-images","duration":2.1540759999998045,"entryType":"measure"},{"startTime":5586.230892,"name":"lh:audit:efficient-animated-content","duration":2.714899000000514,"entryType":"measure"},{"startTime":5588.960748,"name":"lh:audit:appcache-manifest","duration":0.1443409999992582,"entryType":"measure"},{"startTime":5589.116211,"name":"lh:audit:doctype","duration":0.11845000000084838,"entryType":"measure"},{"startTime":5589.350416,"name":"lh:audit:dom-size","duration":0.7445499999994354,"entryType":"measure"},{"startTime":5590.10646,"name":"lh:audit:external-anchors-use-rel-noopener","duration":0.22071099999993748,"entryType":"measure"},{"startTime":5590.338091,"name":"lh:audit:geolocation-on-start","duration":0.1592160000000149,"entryType":"measure"},{"startTime":5590.507553,"name":"lh:audit:no-document-write","duration":0.14004599999952916,"entryType":"measure"},{"startTime":5590.661084,"name":"lh:audit:no-vulnerable-libraries","duration":0.3568409999998039,"entryType":"measure"},{"startTime":5591.029822,"name":"lh:audit:js-libraries","duration":0.1371739999995043,"entryType":"measure"},{"startTime":5591.177488,"name":"lh:audit:notification-on-start","duration":0.10561099999995349,"entryType":"measure"},{"startTime":5591.295774,"name":"lh:audit:password-inputs-can-be-pasted-into","duration":0.10736499999984517,"entryType":"measure"},{"startTime":5591.412992,"name":"lh:audit:uses-http2","duration":0.31777600000077655,"entryType":"measure"},{"startTime":5591.740736,"name":"lh:audit:uses-passive-event-listeners","duration":0.1062050000000454,"entryType":"measure"},{"startTime":5591.961895,"name":"lh:audit:meta-description","duration":0.20159699999931036,"entryType":"measure"},{"startTime":5592.261596,"name":"lh:audit:http-status-code","duration":0.22621499999968364,"entryType":"measure"},{"startTime":5592.580609,"name":"lh:audit:font-size","duration":0.4493500000007771,"entryType":"measure"},{"startTime":5593.122512,"name":"lh:audit:link-text","duration":1.7355760000000373,"entryType":"measure"},{"startTime":5594.99064,"name":"lh:audit:is-crawlable","duration":1.1711960000002364,"entryType":"measure"},{"startTime":5596.253409,"name":"lh:audit:robots-txt","duration":0.48335800000040763,"entryType":"measure"},{"startTime":5596.832981,"name":"lh:audit:tap-targets","duration":2.107096000000638,"entryType":"measure"},{"startTime":5599.036163,"name":"lh:audit:hreflang","duration":0.3120330000001559,"entryType":"measure"},{"startTime":5599.434176,"name":"lh:audit:plugins","duration":0.22786700000051496,"entryType":"measure"},{"startTime":5599.756319,"name":"lh:audit:canonical","duration":0.5506409999998141,"entryType":"measure"},{"startTime":5600.401291,"name":"lh:audit:structured-data","duration":0.10951299999942421,"entryType":"measure"},{"startTime":5600.525247,"name":"lh:runner:generate","duration":0.6606190000002243,"entryType":"measure"}],"total":4395.956848},"i18n":{"rendererFormattedStrings":{"auditGroupExpandTooltip":"Show audits","crcInitialNavigation":"Initial Navigation","crcLongestDurationLabel":"Maximum critical path latency:","errorLabel":"Error!","errorMissingAuditInfo":"Report error: no audit information","labDataTitle":"Lab Data","lsPerformanceCategoryDescription":"[Lighthouse](https://developers.google.com/web/tools/lighthouse/) analysis of the current page on an emulated mobile network. Values are estimated and may vary.","manualAuditsGroupTitle":"Additional items to manually check","notApplicableAuditsGroupTitle":"Not applicable","opportunityResourceColumnLabel":"Opportunity","opportunitySavingsColumnLabel":"Estimated Savings","passedAuditsGroupTitle":"Passed audits","scorescaleLabel":"Score scale:","snippetCollapseButtonLabel":"Collapse snippet","snippetExpandButtonLabel":"Expand snippet","toplevelWarningsMessage":"There were issues affecting this run of Lighthouse:","varianceDisclaimer":"Values are estimated and may vary.","warningAuditsGroupTitle":"Passed audits but with warnings","warningHeader":"Warnings: "},"icuMessagePaths":{"lighthouse-core/audits/metrics/first-contentful-paint.js | title":["audits[first-contentful-paint].title"],"lighthouse-core/audits/metrics/first-contentful-paint.js | description":["audits[first-contentful-paint].description"],"lighthouse-core/lib/i18n/i18n.js | seconds":[{"values":{"timeInMs":1692.7309999999998},"path":"audits[first-contentful-paint].displayValue"},{"values":{"timeInMs":1692.7309999999998},"path":"audits[first-meaningful-paint].displayValue"},{"values":{"timeInMs":1692.7309999999998},"path":"audits[speed-index].displayValue"},{"values":{"timeInMs":1692.7309999999998},"path":"audits[first-cpu-idle].displayValue"},{"values":{"timeInMs":1934.4504999999997},"path":"audits.interactive.displayValue"},{"values":{"timeInMs":1467.2360000000003},"path":"audits[mainthread-work-breakdown].displayValue"},{"values":{"timeInMs":72.26},"path":"audits[bootup-time].displayValue"}],"lighthouse-core/audits/metrics/first-meaningful-paint.js | title":["audits[first-meaningful-paint].title"],"lighthouse-core/audits/metrics/first-meaningful-paint.js | description":["audits[first-meaningful-paint].description"],"lighthouse-core/audits/load-fast-enough-for-pwa.js | title":["audits[load-fast-enough-for-pwa].title"],"lighthouse-core/audits/load-fast-enough-for-pwa.js | description":["audits[load-fast-enough-for-pwa].description"],"lighthouse-core/audits/metrics/speed-index.js | title":["audits[speed-index].title"],"lighthouse-core/audits/metrics/speed-index.js | description":["audits[speed-index].description"],"lighthouse-core/audits/metrics/estimated-input-latency.js | title":["audits[estimated-input-latency].title"],"lighthouse-core/audits/metrics/estimated-input-latency.js | description":["audits[estimated-input-latency].description"],"lighthouse-core/lib/i18n/i18n.js | ms":[{"values":{"timeInMs":12.8},"path":"audits[estimated-input-latency].displayValue"},{"values":{"timeInMs":58},"path":"audits[max-potential-fid].displayValue"},{"values":{"timeInMs":24.42},"path":"audits[network-rtt].displayValue"},{"values":{"timeInMs":99.891},"path":"audits[network-server-latency].displayValue"}],"lighthouse-core/audits/metrics/max-potential-fid.js | title":["audits[max-potential-fid].title"],"lighthouse-core/audits/metrics/max-potential-fid.js | description":["audits[max-potential-fid].description"],"lighthouse-core/audits/time-to-first-byte.js | title":["audits[time-to-first-byte].title"],"lighthouse-core/audits/time-to-first-byte.js | description":["audits[time-to-first-byte].description"],"lighthouse-core/audits/time-to-first-byte.js | displayValue":[{"values":{"timeInMs":102.16199999999999},"path":"audits[time-to-first-byte].displayValue"}],"lighthouse-core/audits/metrics/first-cpu-idle.js | title":["audits[first-cpu-idle].title"],"lighthouse-core/audits/metrics/first-cpu-idle.js | description":["audits[first-cpu-idle].description"],"lighthouse-core/audits/metrics/interactive.js | title":["audits.interactive.title"],"lighthouse-core/audits/metrics/interactive.js | description":["audits.interactive.description"],"lighthouse-core/audits/user-timings.js | title":["audits[user-timings].title"],"lighthouse-core/audits/user-timings.js | description":["audits[user-timings].description"],"lighthouse-core/audits/user-timings.js | displayValue":[{"values":{"itemCount":4},"path":"audits[user-timings].displayValue"}],"lighthouse-core/audits/user-timings.js | columnName":["audits[user-timings].details.headings[0].text"],"lighthouse-core/audits/user-timings.js | columnType":["audits[user-timings].details.headings[1].text"],"lighthouse-core/audits/user-timings.js | columnStartTime":["audits[user-timings].details.headings[2].text"],"lighthouse-core/audits/user-timings.js | columnDuration":["audits[user-timings].details.headings[3].text"],"lighthouse-core/audits/critical-request-chains.js | title":["audits[critical-request-chains].title"],"lighthouse-core/audits/critical-request-chains.js | description":["audits[critical-request-chains].description"],"lighthouse-core/audits/critical-request-chains.js | displayValue":[{"values":{"itemCount":7},"path":"audits[critical-request-chains].displayValue"}],"lighthouse-core/audits/redirects.js | title":["audits.redirects.title"],"lighthouse-core/audits/redirects.js | description":["audits.redirects.description"],"lighthouse-core/audits/mainthread-work-breakdown.js | title":["audits[mainthread-work-breakdown].title"],"lighthouse-core/audits/mainthread-work-breakdown.js | description":["audits[mainthread-work-breakdown].description"],"lighthouse-core/audits/mainthread-work-breakdown.js | columnCategory":["audits[mainthread-work-breakdown].details.headings[0].text"],"lighthouse-core/lib/i18n/i18n.js | columnTimeSpent":["audits[mainthread-work-breakdown].details.headings[1].text","audits[network-rtt].details.headings[1].text","audits[network-server-latency].details.headings[1].text"],"lighthouse-core/audits/bootup-time.js | title":["audits[bootup-time].title"],"lighthouse-core/audits/bootup-time.js | description":["audits[bootup-time].description"],"lighthouse-core/lib/i18n/i18n.js | columnURL":["audits[bootup-time].details.headings[0].text","audits[uses-rel-preconnect].details.headings[0].label","audits[font-display].details.headings[0].text","audits[network-rtt].details.headings[0].text","audits[network-server-latency].details.headings[0].text","audits[uses-long-cache-ttl].details.headings[0].text","audits[total-byte-weight].details.headings[0].text","audits[offscreen-images].details.headings[1].label","audits[render-blocking-resources].details.headings[0].label","audits[unused-css-rules].details.headings[0].label","audits[uses-webp-images].details.headings[1].label","audits[uses-optimized-images].details.headings[1].label"],"lighthouse-core/audits/bootup-time.js | columnTotal":["audits[bootup-time].details.headings[1].text"],"lighthouse-core/audits/bootup-time.js | columnScriptEval":["audits[bootup-time].details.headings[2].text"],"lighthouse-core/audits/bootup-time.js | columnScriptParse":["audits[bootup-time].details.headings[3].text"],"lighthouse-core/audits/uses-rel-preload.js | title":["audits[uses-rel-preload].title"],"lighthouse-core/audits/uses-rel-preload.js | description":["audits[uses-rel-preload].description"],"lighthouse-core/audits/uses-rel-preconnect.js | title":["audits[uses-rel-preconnect].title"],"lighthouse-core/audits/uses-rel-preconnect.js | description":["audits[uses-rel-preconnect].description"],"lighthouse-core/lib/i18n/i18n.js | displayValueMsSavings":[{"values":{"wastedMs":244.42300000196695},"path":"audits[uses-rel-preconnect].displayValue"},{"values":{"wastedMs":778},"path":"audits[render-blocking-resources].displayValue"}],"lighthouse-core/lib/i18n/i18n.js | columnWastedMs":["audits[uses-rel-preconnect].details.headings[1].label","audits[font-display].details.headings[1].text","audits[render-blocking-resources].details.headings[2].label"],"lighthouse-core/audits/font-display.js | failureTitle":["audits[font-display].title"],"lighthouse-core/audits/font-display.js | description":["audits[font-display].description"],"lighthouse-core/audits/network-rtt.js | title":["audits[network-rtt].title"],"lighthouse-core/audits/network-rtt.js | description":["audits[network-rtt].description"],"lighthouse-core/audits/network-server-latency.js | title":["audits[network-server-latency].title"],"lighthouse-core/audits/network-server-latency.js | description":["audits[network-server-latency].description"],"lighthouse-core/audits/accessibility/accesskeys.js | title":["audits.accesskeys.title"],"lighthouse-core/audits/accessibility/accesskeys.js | description":["audits.accesskeys.description"],"lighthouse-core/audits/accessibility/aria-allowed-attr.js | title":["audits[aria-allowed-attr].title"],"lighthouse-core/audits/accessibility/aria-allowed-attr.js | description":["audits[aria-allowed-attr].description"],"lighthouse-core/audits/accessibility/aria-required-attr.js | title":["audits[aria-required-attr].title"],"lighthouse-core/audits/accessibility/aria-required-attr.js | description":["audits[aria-required-attr].description"],"lighthouse-core/audits/accessibility/aria-required-children.js | title":["audits[aria-required-children].title"],"lighthouse-core/audits/accessibility/aria-required-children.js | description":["audits[aria-required-children].description"],"lighthouse-core/audits/accessibility/aria-required-parent.js | title":["audits[aria-required-parent].title"],"lighthouse-core/audits/accessibility/aria-required-parent.js | description":["audits[aria-required-parent].description"],"lighthouse-core/audits/accessibility/aria-roles.js | title":["audits[aria-roles].title"],"lighthouse-core/audits/accessibility/aria-roles.js | description":["audits[aria-roles].description"],"lighthouse-core/audits/accessibility/aria-valid-attr-value.js | title":["audits[aria-valid-attr-value].title"],"lighthouse-core/audits/accessibility/aria-valid-attr-value.js | description":["audits[aria-valid-attr-value].description"],"lighthouse-core/audits/accessibility/aria-valid-attr.js | title":["audits[aria-valid-attr].title"],"lighthouse-core/audits/accessibility/aria-valid-attr.js | description":["audits[aria-valid-attr].description"],"lighthouse-core/audits/accessibility/audio-caption.js | title":["audits[audio-caption].title"],"lighthouse-core/audits/accessibility/audio-caption.js | description":["audits[audio-caption].description"],"lighthouse-core/audits/accessibility/button-name.js | title":["audits[button-name].title"],"lighthouse-core/audits/accessibility/button-name.js | description":["audits[button-name].description"],"lighthouse-core/audits/accessibility/bypass.js | title":["audits.bypass.title"],"lighthouse-core/audits/accessibility/bypass.js | description":["audits.bypass.description"],"lighthouse-core/audits/accessibility/color-contrast.js | failureTitle":["audits[color-contrast].title"],"lighthouse-core/audits/accessibility/color-contrast.js | description":["audits[color-contrast].description"],"lighthouse-core/audits/accessibility/axe-audit.js | failingElementsHeader":["audits[color-contrast].details.headings[0].text","audits[image-alt].details.headings[0].text","audits.label.details.headings[0].text","audits[link-name].details.headings[0].text","audits[meta-viewport].details.headings[0].text"],"lighthouse-core/audits/accessibility/definition-list.js | title":["audits[definition-list].title"],"lighthouse-core/audits/accessibility/definition-list.js | description":["audits[definition-list].description"],"lighthouse-core/audits/accessibility/dlitem.js | title":["audits.dlitem.title"],"lighthouse-core/audits/accessibility/dlitem.js | description":["audits.dlitem.description"],"lighthouse-core/audits/accessibility/document-title.js | title":["audits[document-title].title"],"lighthouse-core/audits/accessibility/document-title.js | description":["audits[document-title].description"],"lighthouse-core/audits/accessibility/duplicate-id.js | title":["audits[duplicate-id].title"],"lighthouse-core/audits/accessibility/duplicate-id.js | description":["audits[duplicate-id].description"],"lighthouse-core/audits/accessibility/frame-title.js | title":["audits[frame-title].title"],"lighthouse-core/audits/accessibility/frame-title.js | description":["audits[frame-title].description"],"lighthouse-core/audits/accessibility/html-has-lang.js | title":["audits[html-has-lang].title"],"lighthouse-core/audits/accessibility/html-has-lang.js | description":["audits[html-has-lang].description"],"lighthouse-core/audits/accessibility/html-lang-valid.js | title":["audits[html-lang-valid].title"],"lighthouse-core/audits/accessibility/html-lang-valid.js | description":["audits[html-lang-valid].description"],"lighthouse-core/audits/accessibility/image-alt.js | failureTitle":["audits[image-alt].title"],"lighthouse-core/audits/accessibility/image-alt.js | description":["audits[image-alt].description"],"lighthouse-core/audits/accessibility/input-image-alt.js | title":["audits[input-image-alt].title"],"lighthouse-core/audits/accessibility/input-image-alt.js | description":["audits[input-image-alt].description"],"lighthouse-core/audits/accessibility/label.js | failureTitle":["audits.label.title"],"lighthouse-core/audits/accessibility/label.js | description":["audits.label.description"],"lighthouse-core/audits/accessibility/layout-table.js | title":["audits[layout-table].title"],"lighthouse-core/audits/accessibility/layout-table.js | description":["audits[layout-table].description"],"lighthouse-core/audits/accessibility/link-name.js | failureTitle":["audits[link-name].title"],"lighthouse-core/audits/accessibility/link-name.js | description":["audits[link-name].description"],"lighthouse-core/audits/accessibility/list.js | title":["audits.list.title"],"lighthouse-core/audits/accessibility/list.js | description":["audits.list.description"],"lighthouse-core/audits/accessibility/listitem.js | title":["audits.listitem.title"],"lighthouse-core/audits/accessibility/listitem.js | description":["audits.listitem.description"],"lighthouse-core/audits/accessibility/meta-refresh.js | title":["audits[meta-refresh].title"],"lighthouse-core/audits/accessibility/meta-refresh.js | description":["audits[meta-refresh].description"],"lighthouse-core/audits/accessibility/meta-viewport.js | failureTitle":["audits[meta-viewport].title"],"lighthouse-core/audits/accessibility/meta-viewport.js | description":["audits[meta-viewport].description"],"lighthouse-core/audits/accessibility/object-alt.js | title":["audits[object-alt].title"],"lighthouse-core/audits/accessibility/object-alt.js | description":["audits[object-alt].description"],"lighthouse-core/audits/accessibility/tabindex.js | title":["audits.tabindex.title"],"lighthouse-core/audits/accessibility/tabindex.js | description":["audits.tabindex.description"],"lighthouse-core/audits/accessibility/td-headers-attr.js | title":["audits[td-headers-attr].title"],"lighthouse-core/audits/accessibility/td-headers-attr.js | description":["audits[td-headers-attr].description"],"lighthouse-core/audits/accessibility/th-has-data-cells.js | title":["audits[th-has-data-cells].title"],"lighthouse-core/audits/accessibility/th-has-data-cells.js | description":["audits[th-has-data-cells].description"],"lighthouse-core/audits/accessibility/valid-lang.js | title":["audits[valid-lang].title"],"lighthouse-core/audits/accessibility/valid-lang.js | description":["audits[valid-lang].description"],"lighthouse-core/audits/accessibility/video-caption.js | title":["audits[video-caption].title"],"lighthouse-core/audits/accessibility/video-caption.js | description":["audits[video-caption].description"],"lighthouse-core/audits/accessibility/video-description.js | title":["audits[video-description].title"],"lighthouse-core/audits/accessibility/video-description.js | description":["audits[video-description].description"],"lighthouse-core/audits/byte-efficiency/uses-long-cache-ttl.js | failureTitle":["audits[uses-long-cache-ttl].title"],"lighthouse-core/audits/byte-efficiency/uses-long-cache-ttl.js | description":["audits[uses-long-cache-ttl].description"],"lighthouse-core/audits/byte-efficiency/uses-long-cache-ttl.js | displayValue":[{"values":{"itemCount":12},"path":"audits[uses-long-cache-ttl].displayValue"}],"lighthouse-core/lib/i18n/i18n.js | columnCacheTTL":["audits[uses-long-cache-ttl].details.headings[1].text"],"lighthouse-core/lib/i18n/i18n.js | columnSize":["audits[uses-long-cache-ttl].details.headings[2].text","audits[total-byte-weight].details.headings[1].text","audits[offscreen-images].details.headings[2].label","audits[render-blocking-resources].details.headings[1].label","audits[unused-css-rules].details.headings[1].label","audits[uses-webp-images].details.headings[2].label","audits[uses-optimized-images].details.headings[2].label"],"lighthouse-core/audits/byte-efficiency/total-byte-weight.js | title":["audits[total-byte-weight].title"],"lighthouse-core/audits/byte-efficiency/total-byte-weight.js | description":["audits[total-byte-weight].description"],"lighthouse-core/audits/byte-efficiency/total-byte-weight.js | displayValue":[{"values":{"totalBytes":331726},"path":"audits[total-byte-weight].displayValue"}],"lighthouse-core/audits/byte-efficiency/offscreen-images.js | title":["audits[offscreen-images].title"],"lighthouse-core/audits/byte-efficiency/offscreen-images.js | description":["audits[offscreen-images].description"],"lighthouse-core/lib/i18n/i18n.js | displayValueByteSavings":[{"values":{"wastedBytes":120414},"path":"audits[offscreen-images].displayValue"},{"values":{"wastedBytes":9937},"path":"audits[unused-css-rules].displayValue"},{"values":{"wastedBytes":120618},"path":"audits[uses-webp-images].displayValue"},{"values":{"wastedBytes":12774},"path":"audits[uses-optimized-images].displayValue"}],"lighthouse-core/lib/i18n/i18n.js | columnWastedBytes":["audits[offscreen-images].details.headings[3].label","audits[unused-css-rules].details.headings[2].label","audits[uses-webp-images].details.headings[3].label","audits[uses-optimized-images].details.headings[3].label"],"lighthouse-core/audits/byte-efficiency/render-blocking-resources.js | title":["audits[render-blocking-resources].title"],"lighthouse-core/audits/byte-efficiency/render-blocking-resources.js | description":["audits[render-blocking-resources].description"],"lighthouse-core/audits/byte-efficiency/unminified-css.js | title":["audits[unminified-css].title"],"lighthouse-core/audits/byte-efficiency/unminified-css.js | description":["audits[unminified-css].description"],"lighthouse-core/audits/byte-efficiency/unminified-javascript.js | title":["audits[unminified-javascript].title"],"lighthouse-core/audits/byte-efficiency/unminified-javascript.js | description":["audits[unminified-javascript].description"],"lighthouse-core/audits/byte-efficiency/unused-css-rules.js | title":["audits[unused-css-rules].title"],"lighthouse-core/audits/byte-efficiency/unused-css-rules.js | description":["audits[unused-css-rules].description"],"lighthouse-core/audits/byte-efficiency/uses-webp-images.js | title":["audits[uses-webp-images].title"],"lighthouse-core/audits/byte-efficiency/uses-webp-images.js | description":["audits[uses-webp-images].description"],"lighthouse-core/audits/byte-efficiency/uses-optimized-images.js | title":["audits[uses-optimized-images].title"],"lighthouse-core/audits/byte-efficiency/uses-optimized-images.js | description":["audits[uses-optimized-images].description"],"lighthouse-core/audits/byte-efficiency/uses-text-compression.js | title":["audits[uses-text-compression].title"],"lighthouse-core/audits/byte-efficiency/uses-text-compression.js | description":["audits[uses-text-compression].description"],"lighthouse-core/audits/byte-efficiency/uses-responsive-images.js | title":["audits[uses-responsive-images].title"],"lighthouse-core/audits/byte-efficiency/uses-responsive-images.js | description":["audits[uses-responsive-images].description"],"lighthouse-core/audits/byte-efficiency/efficient-animated-content.js | title":["audits[efficient-animated-content].title"],"lighthouse-core/audits/byte-efficiency/efficient-animated-content.js | description":["audits[efficient-animated-content].description"],"lighthouse-core/audits/dobetterweb/dom-size.js | title":["audits[dom-size].title"],"lighthouse-core/audits/dobetterweb/dom-size.js | description":["audits[dom-size].description"],"lighthouse-core/audits/dobetterweb/dom-size.js | displayValue":[{"values":{"itemCount":446},"path":"audits[dom-size].displayValue"}],"lighthouse-core/audits/dobetterweb/dom-size.js | columnStatistic":["audits[dom-size].details.headings[0].text"],"lighthouse-core/audits/dobetterweb/dom-size.js | columnElement":["audits[dom-size].details.headings[1].text"],"lighthouse-core/audits/dobetterweb/dom-size.js | columnValue":["audits[dom-size].details.headings[2].text"],"lighthouse-core/audits/dobetterweb/dom-size.js | statisticDOMNodes":["audits[dom-size].details.items[0].statistic"],"lighthouse-core/audits/dobetterweb/dom-size.js | statisticDOMDepth":["audits[dom-size].details.items[1].statistic"],"lighthouse-core/audits/dobetterweb/dom-size.js | statisticDOMWidth":["audits[dom-size].details.items[2].statistic"],"lighthouse-core/audits/seo/meta-description.js | failureTitle":["audits[meta-description].title"],"lighthouse-core/audits/seo/meta-description.js | description":["audits[meta-description].description"],"lighthouse-core/audits/seo/http-status-code.js | title":["audits[http-status-code].title"],"lighthouse-core/audits/seo/http-status-code.js | description":["audits[http-status-code].description"],"lighthouse-core/audits/seo/font-size.js | title":["audits[font-size].title"],"lighthouse-core/audits/seo/font-size.js | description":["audits[font-size].description"],"lighthouse-core/audits/seo/font-size.js | displayValue":[{"values":{"decimalProportion":1},"path":"audits[font-size].displayValue"}],"lighthouse-core/audits/seo/link-text.js | title":["audits[link-text].title"],"lighthouse-core/audits/seo/link-text.js | description":["audits[link-text].description"],"lighthouse-core/audits/seo/is-crawlable.js | title":["audits[is-crawlable].title"],"lighthouse-core/audits/seo/is-crawlable.js | description":["audits[is-crawlable].description"],"lighthouse-core/audits/seo/robots-txt.js | title":["audits[robots-txt].title"],"lighthouse-core/audits/seo/robots-txt.js | description":["audits[robots-txt].description"],"lighthouse-core/audits/seo/tap-targets.js | failureTitle":["audits[tap-targets].title"],"lighthouse-core/audits/seo/tap-targets.js | description":["audits[tap-targets].description"],"lighthouse-core/audits/seo/tap-targets.js | displayValue":[{"values":{"decimalProportion":0.72},"path":"audits[tap-targets].displayValue"}],"lighthouse-core/audits/seo/tap-targets.js | tapTargetHeader":["audits[tap-targets].details.headings[0].text"],"lighthouse-core/audits/seo/tap-targets.js | sizeHeader":["audits[tap-targets].details.headings[1].text"],"lighthouse-core/audits/seo/tap-targets.js | overlappingTargetHeader":["audits[tap-targets].details.headings[2].text"],"lighthouse-core/audits/seo/hreflang.js | title":["audits.hreflang.title"],"lighthouse-core/audits/seo/hreflang.js | description":["audits.hreflang.description"],"lighthouse-core/audits/seo/plugins.js | title":["audits.plugins.title"],"lighthouse-core/audits/seo/plugins.js | description":["audits.plugins.description"],"lighthouse-core/audits/seo/canonical.js | title":["audits.canonical.title"],"lighthouse-core/audits/seo/canonical.js | description":["audits.canonical.description"],"lighthouse-core/audits/seo/manual/structured-data.js | title":["audits[structured-data].title"],"lighthouse-core/audits/seo/manual/structured-data.js | description":["audits[structured-data].description"],"lighthouse-core/config/default-config.js | performanceCategoryTitle":["categories.performance.title"],"lighthouse-core/config/default-config.js | a11yCategoryTitle":["categories.accessibility.title"],"lighthouse-core/config/default-config.js | a11yCategoryDescription":["categories.accessibility.description"],"lighthouse-core/config/default-config.js | a11yCategoryManualDescription":["categories.accessibility.manualDescription"],"lighthouse-core/config/default-config.js | seoCategoryTitle":["categories.seo.title"],"lighthouse-core/config/default-config.js | seoCategoryDescription":["categories.seo.description"],"lighthouse-core/config/default-config.js | seoCategoryManualDescription":["categories.seo.manualDescription"],"lighthouse-core/config/default-config.js | metricGroupTitle":["categoryGroups.metrics.title"],"lighthouse-core/config/default-config.js | loadOpportunitiesGroupTitle":["categoryGroups[load-opportunities].title"],"lighthouse-core/config/default-config.js | loadOpportunitiesGroupDescription":["categoryGroups[load-opportunities].description"],"lighthouse-core/config/default-config.js | diagnosticsGroupTitle":["categoryGroups.diagnostics.title"],"lighthouse-core/config/default-config.js | diagnosticsGroupDescription":["categoryGroups.diagnostics.description"],"lighthouse-core/config/default-config.js | pwaFastReliableGroupTitle":["categoryGroups[pwa-fast-reliable].title"],"lighthouse-core/config/default-config.js | pwaInstallableGroupTitle":["categoryGroups[pwa-installable].title"],"lighthouse-core/config/default-config.js | pwaOptimizedGroupTitle":["categoryGroups[pwa-optimized].title"],"lighthouse-core/config/default-config.js | a11yBestPracticesGroupTitle":["categoryGroups[a11y-best-practices].title"],"lighthouse-core/config/default-config.js | a11yBestPracticesGroupDescription":["categoryGroups[a11y-best-practices].description"],"lighthouse-core/config/default-config.js | a11yColorContrastGroupTitle":["categoryGroups[a11y-color-contrast].title"],"lighthouse-core/config/default-config.js | a11yColorContrastGroupDescription":["categoryGroups[a11y-color-contrast].description"],"lighthouse-core/config/default-config.js | a11yNamesLabelsGroupTitle":["categoryGroups[a11y-names-labels].title"],"lighthouse-core/config/default-config.js | a11yNamesLabelsGroupDescription":["categoryGroups[a11y-names-labels].description"],"lighthouse-core/config/default-config.js | a11yNavigationGroupTitle":["categoryGroups[a11y-navigation].title"],"lighthouse-core/config/default-config.js | a11yNavigationGroupDescription":["categoryGroups[a11y-navigation].description"],"lighthouse-core/config/default-config.js | a11yAriaGroupTitle":["categoryGroups[a11y-aria].title"],"lighthouse-core/config/default-config.js | a11yAriaGroupDescription":["categoryGroups[a11y-aria].description"],"lighthouse-core/config/default-config.js | a11yLanguageGroupTitle":["categoryGroups[a11y-language].title"],"lighthouse-core/config/default-config.js | a11yLanguageGroupDescription":["categoryGroups[a11y-language].description"],"lighthouse-core/config/default-config.js | a11yAudioVideoGroupTitle":["categoryGroups[a11y-audio-video].title"],"lighthouse-core/config/default-config.js | a11yAudioVideoGroupDescription":["categoryGroups[a11y-audio-video].description"],"lighthouse-core/config/default-config.js | a11yTablesListsVideoGroupTitle":["categoryGroups[a11y-tables-lists].title"],"lighthouse-core/config/default-config.js | a11yTablesListsVideoGroupDescription":["categoryGroups[a11y-tables-lists].description"]}}};</script>
  <script>
    window.addEventListener('DOMContentLoaded', _ => {
      const dom = new DOM(document);
      const renderer = new ReportRenderer(dom);

      const container = document.querySelector('main');
      renderer.renderReport(window.__LIGHTHOUSE_JSON__, container);

      // Hook in JS features and page-level event listeners after the report
      // is in the document.
      const features = new ReportUIFeatures(dom);
      features.initFeatures(window.__LIGHTHOUSE_JSON__);
    });

    document.addEventListener('lh-analytics', e => {
      if (window.ga) {
        ga(e.detail.cmd, e.detail.fields);
      }
    });

    document.addEventListener('lh-log', e => {
      const logger = new Logger(document.querySelector('#lh-log'));

      switch (e.detail.cmd) {
        case 'log':
          logger.log(e.detail.msg);
          break;
        case 'warn':
          logger.warn(e.detail.msg);
          break;
        case 'error':
          logger.error(e.detail.msg);
          break;
        case 'hide':
          logger.hide();
          break;
      }
    });
  </script>
</body>
</html>
