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
  <script>window.__LIGHTHOUSE_JSON__ = {"userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3733.0 Safari/537.36","environment":{"networkUserAgent":"Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3694.0 Mobile Safari/537.36 Chrome-Lighthouse","hostUserAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3733.0 Safari/537.36","benchmarkIndex":1484},"lighthouseVersion":"4.2.0","fetchTime":"2019-03-14T18:12:37.330Z","requestedUrl":"https://www.example.com/","finalUrl":"https://www.example.com/","runWarnings":[],"audits":{"is-on-https":{"id":"is-on-https","title":"Uses HTTPS","description":"All sites should be protected with HTTPS, even ones that don't handle sensitive data. HTTPS prevents intruders from tampering with or passively listening in on the communications between your app and your users, and is a prerequisite for HTTP/2 and many new web platform APIs. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/https).","score":1,"scoreDisplayMode":"binary","rawValue":true,"displayValue":"","details":{"type":"table","headings":[],"items":[]}},"redirects-http":{"id":"redirects-http","title":"Does not redirect HTTP traffic to HTTPS","description":"If you've already set up HTTPS, make sure that you redirect all HTTP traffic to HTTPS. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/http-redirects-to-https).","score":0,"scoreDisplayMode":"binary","rawValue":false},"service-worker":{"id":"service-worker","title":"Does not register a service worker that controls page and start_url","description":"The service worker is the technology that enables your app to use many Progressive Web App features, such as offline, add to homescreen, and push notifications. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/registered-service-worker).","score":0,"scoreDisplayMode":"binary","rawValue":false},"works-offline":{"id":"works-offline","title":"Current page does not respond with a 200 when offline","description":"If you're building a Progressive Web App, consider using a service worker so that your app can work offline. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/http-200-when-offline).","score":0,"scoreDisplayMode":"binary","rawValue":false,"warnings":[]},"viewport":{"id":"viewport","title":"Has a `\u003cmeta name=\"viewport\">` tag with `width` or `initial-scale`","description":"Add a viewport meta tag to optimize your app for mobile screens. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/has-viewport-meta-tag).","score":1,"scoreDisplayMode":"binary","rawValue":true,"warnings":[]},"without-javascript":{"id":"without-javascript","title":"Contains some content when JavaScript is not available","description":"Your app should display some content when JavaScript is disabled, even if it's just a warning to the user that JavaScript is required to use the app. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/no-js).","score":1,"scoreDisplayMode":"binary","rawValue":true},"first-contentful-paint":{"id":"first-contentful-paint","title":"First Contentful Paint","description":"First Contentful Paint marks the time at which the first text or image is painted. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/first-contentful-paint).","score":1,"scoreDisplayMode":"numeric","rawValue":780,"displayValue":"0.8 s"},"first-meaningful-paint":{"id":"first-meaningful-paint","title":"First Meaningful Paint","description":"First Meaningful Paint measures when the primary content of a page is visible. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/first-meaningful-paint).","score":1,"scoreDisplayMode":"numeric","rawValue":850.5,"displayValue":"0.9 s"},"load-fast-enough-for-pwa":{"id":"load-fast-enough-for-pwa","title":"Page load is fast enough on mobile networks","description":"A fast page load over a cellular network ensures a good mobile user experience. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/fast-3g).","score":1,"scoreDisplayMode":"binary","rawValue":921},"speed-index":{"id":"speed-index","title":"Speed Index","description":"Speed Index shows how quickly the contents of a page are visibly populated. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/speed-index).","score":1,"scoreDisplayMode":"numeric","rawValue":780,"displayValue":"0.8 s"},"screenshot-thumbnails":{"id":"screenshot-thumbnails","title":"Screenshot Thumbnails","description":"This is what the load of your site looked like.","score":null,"scoreDisplayMode":"informative","rawValue":true,"details":{"type":"filmstrip","scale":3000,"items":[{"timing":300,"timestamp":18161592458,"data":"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"},{"timing":600,"timestamp":18161892458,"data":"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"},{"timing":900,"timestamp":18162192458,"data":"/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRQBAwQEBQQFCQUFCRQNCw0UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFP/AABEIAMAAeAMBEQACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/AP1ToAKACgAoAKACgAoAKACgAoAKACgAoAKACgDlfiR8TNA+E/h5Na8Rz3MFjJdQWMS2VlPeTzXE0ixwxRwwo8js7sqgKp5NAGHZftB+AptMnvtS10eFI4I2nkh8XW8uh3AhWSOMzeTerFJ5XmTRRiTbsLuFBzxQBo/8Ls+Hgutatv8AhO/DX2jRJUg1WL+17ffp8jyiJEuBvzEzSEIA+CWIXrxQBSj/AGifhVNZSXkfxL8HyWcdoL97hNetDGtsZhB5xYSYEfnMsW/pvYLnJxQA21/aG+G+oXeiw2PjPSNSi1i3vrqzvbC6S4tHis1RrpjcRkxr5YlQncw4PsaANWb4ueDV+HGo+PrbxHYap4NsLO41CfWdKmF7b+RAH85kaHdv2+W4IXJypGM8UAc/4d/aU+H3iBPEbS6xceGx4dgtrrVP+Es0260P7LDcM6Qysb2OIbHaJ1DDIyvuMgG3c/Gr4fWj6Ok3jjw5G+si1bTVbVrcG9W5LrbNCC/7wSmOQIVzu2NjO04AIJ/jz8NLbSNG1ab4heFYtL1qR4tLvn1q2EF+6PsdYH37ZSrfKQhJB4PNAFX/AIaJ+GUWpRadd+O/D+l6nNeT2MNhqepQ2lzNNDdTWjrHDKyu48+3mjBUEMUO0mgD0WgAoAKACgAoA8w/aK+C/wDwvn4ew+Gft1jY+VqtjqmdU03+0LSf7NcJN5M1v5sXmRybNrDevBNAHkviX9i7UvE0Xwxx4h8H+HW+H2sPrWlWvhrwOtnZGQz28uxonu5HVD5U+4RyJueWKQ4aBdwBx/iT/gnDP4t1Xxteap8Qobj/AISZbhXU6JKwjE2t2uqsGja8MJH+jeViOKPcZGkfeeCAch+07/wTq1TUfhH4zb4eva6r4p1HUdWv00q1sILA3iX+q6fdLC8zzKgFtHZsFLcNngJgAgHo3iv9gW+8brrsuo+OtP0i71dNaEq+GPDx0+2ja/0/TbMBI2upDsX+zQ8i7/3vnuuU6kA7nwR+yPD4P/Z5+JHwxj1m1in8aLqH2jV7S1vGCSXVqtuZXjur24eRwEUn96obAGFOSQDF8U/sheK/H+v6l4l8S/ETTLnxOX0Iac+n+G5LfTYrfTbyW7Fvc2rXsjXMcskpZgZUIZEYHChSAcXr3/BNXT/EXgPxlolz4p0yLVPEFnBaQX9t4bVIdIC61darNHZwm4YxQSG5WLyhJx5QYs+doAOe+IP/AAS5u/G0ni21t/ibbaToeu6jqF/DYweFwDYi6vYrnyRLHdRtLGnkooifMW794I1cKQAdt4p/4J5WPjHxT411jUfFNtcx+IfDWt6DBbXOiLL9gmv9budVju1YzfM0DXIjAAUsU3hkztAB9hUAFABQAUAFAGT4l8T6d4R0+K+1Sc21rLd21ijiN5MzXE8dvCuFBPzSyxrnoN2SQATQBz2kfGzwJrnhTTvE1p4r0r+wL+2N3b39xdLAjRLAbhyRIVKlYVaRlYAqqOWA2tgAlHxj8D/vg3i7Q4Hhvl0yRLnUYomS6dtscJDMCHfIKLjLBlK5BGQC/p3xH8Lat4rvfDFl4j0m78R2Sh7nSYL2N7qBSMgvGDuXgg8joynoQSAUh8YfAp8L3HiU+MtATw7bzm1n1Z9ThW1hmGMxtKW2q4yPlJzzQBV1T46fDzRZLdL7xtoNsJrdbxXk1GEItuyO6zs27CRMsUmJGwpKkAk8UAMuvjx8OrDSJNUvPG+gWOnRX39mTXN5qMUKQXezzPs8hYjZLtGdjYOO1AGu3xL8Li61O1XX9OlutLa0W/giuVd7Q3JH2fzQCSnmbgV3YyDu6c0AQaj8WfB2j67Po+oeI9O0/UIba1u2ju5xEpjuJJo4CrthXLtbTDapJGzkDK5AL2pePfDmi3lzaahr2l2N1bRLPNBc3sUckcbEhXZS2QpIYAnrtOKAMG1+O3gHUNXg06z8VabfSzxwSxy2s3mwMkyXbxMJlzGQVsLs/e48rnG5dwBD4g/aF+GvhjTtO1DUfG+iQafqDstvdreLJE4WSKN33rkBEeeEO5IVN43ECgC5c/GzwJZeL5fCtz4t0aDxFBbNdXGntepvtUEkMf74g4iJe5hVVcgvuO0NtbABY0/4u+C9T8R6zoFv4o0tta0aOOW/sWulWWCN1RkkIbGUPmKN4yuTtzkEAA6ewv7fVLG3vLSeK6tLiNZYZ4HDxyIwyrKw4IIIII4OaAOJ+MOpS2Om+HIB4SufF9tea/YRzwW+7/QgkonS8barHEUsMZHQbiu5lXLAA+cNI8X6hqXhxrGH9nKUnQdRtNE07Sr651WO0lgurc2ctyPO00KUhhIhZ9jlY3uNrbGzMAdJ/bP/AAjur61Fa/B6+v7RdTlkOoRvqrrLNZDz4Lq4Mtp5ks8j21sDJFHOpWIATzMIoXAOo8BaPa6L4q8IeO7D4UXWl+JfHlgreJLt7u4a80hmszcJbyrImwqrW6W+GMQQ+UoXBCgA4Xwv4w1N9LsPC6fBPVNL0e91MeYYZ9Zt7MgMYU+X7EHEbRImFnWKIvHK83kq1vJcAEeo6jJeeE/E3idvgDfanY2kp8PafZXWoamdQ1K0gZooZJLR7QvHZvBLM7AeazGWRTG5kckA39S061tvEfiHwvrPwde88D3eo2aSJAb6/hmZmurh7sQiExFVVbXzAu3Ls8e6Xy4g4Bv69aX/AIN8T6houp+CLLWvCWqW5ujfWVxq97e3KWEAlijuYVtZozIzBIsPcZnCscSM3kgA5nxY8gTwfr0HwX1LU3vPCK3klz/a2pRapplxCAY7SQJbs/2jfqEgE7OJ9j3xwcMkgBrJqWg+KvCGq/EHUvhrqa+INS1C2s1t7V7+5luPJH+js4to3ltxAXkLo0SmC6gcYMkccjAHNaDe3syz6lpPwRk8M6tKukvMl1c6pb+V9qsL1nWGSG0PlNBPdzozRA4a6lkl8l2JoAveLPDum6l4V1ey8S/BS21+48L2sa2VqJNQvLe5N7eK12gc2hknRWgimd445mdVyURj5ZAGeD7y+1K80HVbr4Npcatql2PCWtX95daqstvYNF5kkkq3VlmSJtkm8b3jMrQjz5C7SIAYngVtS8azfFfxHqHwVudK1DTrC1u9N1DU31I6hqd9b6YywRxLNGsrtE814i3Ebxv88ZCByXAB9TeALm+vPBmkTajo1v4dumgH/EqtZjKlqnRI9xjjOQm3K7BtOV5xkgHOfGeDz9L0HzPiJ/wrm0h1QXdzcqYEfUIoIJp2tQ83CLiLzpCoJMVvKDhC5AB5poPhq/8AEWhXE0Xx8tb+bUHtNR+1aKx+ypp1swkuliDXkrp50dyoecS4TzICoUKgoAS60if4rRR+JfBXx2g0aHyJr5pNJEF/byJ80atcF55B5cYacFIXiQOwYbWjFAG34w+FV78W/DdnoEHxUlH9m2NlHM+mqrSXE0crrNcXGJSf3jW4Eewo0MsMrB3OVUAt6l8GfHkmpa3c6Z8VLnTLee5s59Ksf7LMkNiiMjXUEg88edHO0akfcaIFlRtjurAF/VPhF4jktdLsNK8a6jpFrYLar53my3UlyiXRluYpRLId3moI08zcXUBgu1SyOASf8Kp8XLP4kli+INxGl9NaDS7U2j+VpdskqPdwjE4MhnCyKJcq8IkxFtChQAJffCjxbfeKHvY/iLf2GitcpIdJtrd8mArJ58fnPKzK0khicOoXyhAqRqivL5oBxGjfst+J/D+jePdP0r4q6zpP/CQ3Ul3p1zZW7CTSpXnlmd2LzsblmJt1Z5MOUhZQwEjYAOyuPg34ht/Dzafo3je+0i6TTHtLa/IuLqaO48lljuHWW5McuyTY+11JYIE3hDtABfufhp4nufGGu6gnj7UbbQ9R0m6so9KithvtbyWRSt7HMXIBiiVI0jVFXIdyS7sSAcT4o/Z18eeIfBEGhxfGK+iu1urS6+332jpdlWt1iCOqtKCr5ton3FyvmSXL7SzxGAA3b/4W+M/E8vjzRNR1qz0/w3KdLl8I6hC0t7qGn3FsFlM9wlwTG7pcRxOvLb9pMm4kigD0vwrotzoVpcW9xfz38ZkUweezM0SCJE2bmZmYFkZ9zktlzktjcQDboA5zxh4M8O+MptEXxBYW2omxu5Z7KG7JKGWS0uLaQFM7ZA1vcXClHDLhicZAIAHaT4J8K2umW0Wm6DpEWniz+yQJbWkQj+ytHEnlLgY8spDAu0cFYox0UYAK9v4G8GQaVY6bB4f0OLTbZPsVpaRWcIhiVElj8mNAMAKkk6bAOA8gxhmBANjS/Duk6GXOm6ZZ6eXXaxtYFi3De8mDtAyN8srY9ZHPVjkAvrIrswUglTg47Hrj9aAHUAFABQAUAFABQAUAFABQAUAcp8QPh1p/xFtNMt7+6vrP+z7s31vNp8/kypN5EsSsHxkFfOLDH8SrnIyDpTqOm7oiUVJWMHR/gbpei2qWkOt+IWs4rIWMFsdSZYrdVmeVJI1UAJIm8Rqw6RxxpjC87/WZXb5Vd+XyI9n5sn1f4N2GtDTGm1jWo5tP15tfjmiulDu5MubZjt5t9szpsGMoSCeWzKrtK1ltYfJ5snl+FMUkeioPEfiEf2bam0ZmvgzXykxbnuGZSXcrG6bxtZVnl2lSQVPbtO/Khezv1ZRtPghY2T23l+IvEQhiv/7Qe3F8BFMxlmlkjkXbho5HnJcHlvLj5+XmniG7+6vuGqfmehQQNEZN8jS7nLDcANo9BgD9cn3rkvc0WhPQMKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgBMj1FABkeooAMj1FABkeooAMj1FABkeooAMj1FABkeooAMj1FABkeooAMj1FABkeooAMj1FABkeooAMj1oA//9k="},{"timing":1200,"timestamp":18162492458,"data":"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"},{"timing":1500,"timestamp":18162792458,"data":"/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRQBAwQEBQQFCQUFCRQNCw0UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFP/AABEIAMAAeAMBEQACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/AP1ToAKACgAoAKACgAoAKACgAoAKACgAoAKACgDlfiR8TNA+E/h5Na8Rz3MFjJdQWMS2VlPeTzXE0ixwxRwwo8js7sqgKp5NAGHZftB+AptMnvtS10eFI4I2nkh8XW8uh3AhWSOMzeTerFJ5XmTRRiTbsLuFBzxQBo/8Ls+Hgutatv8AhO/DX2jRJUg1WL+17ffp8jyiJEuBvzEzSEIA+CWIXrxQBSj/AGifhVNZSXkfxL8HyWcdoL97hNetDGtsZhB5xYSYEfnMsW/pvYLnJxQA21/aG+G+oXeiw2PjPSNSi1i3vrqzvbC6S4tHis1RrpjcRkxr5YlQncw4PsaANWb4ueDV+HGo+PrbxHYap4NsLO41CfWdKmF7b+RAH85kaHdv2+W4IXJypGM8UAc/4d/aU+H3iBPEbS6xceGx4dgtrrVP+Es0260P7LDcM6Qysb2OIbHaJ1DDIyvuMgG3c/Gr4fWj6Ok3jjw5G+si1bTVbVrcG9W5LrbNCC/7wSmOQIVzu2NjO04AIJ/jz8NLbSNG1ab4heFYtL1qR4tLvn1q2EF+6PsdYH37ZSrfKQhJB4PNAFX/AIaJ+GUWpRadd+O/D+l6nNeT2MNhqepQ2lzNNDdTWjrHDKyu48+3mjBUEMUO0mgD0WgAoAKACgAoA8w/aK+C/wDwvn4ew+Gft1jY+VqtjqmdU03+0LSf7NcJN5M1v5sXmRybNrDevBNAHkviX9i7UvE0Xwxx4h8H+HW+H2sPrWlWvhrwOtnZGQz28uxonu5HVD5U+4RyJueWKQ4aBdwBx/iT/gnDP4t1Xxteap8Qobj/AISZbhXU6JKwjE2t2uqsGja8MJH+jeViOKPcZGkfeeCAch+07/wTq1TUfhH4zb4eva6r4p1HUdWv00q1sILA3iX+q6fdLC8zzKgFtHZsFLcNngJgAgHo3iv9gW+8brrsuo+OtP0i71dNaEq+GPDx0+2ja/0/TbMBI2upDsX+zQ8i7/3vnuuU6kA7nwR+yPD4P/Z5+JHwxj1m1in8aLqH2jV7S1vGCSXVqtuZXjur24eRwEUn96obAGFOSQDF8U/sheK/H+v6l4l8S/ETTLnxOX0Iac+n+G5LfTYrfTbyW7Fvc2rXsjXMcskpZgZUIZEYHChSAcXr3/BNXT/EXgPxlolz4p0yLVPEFnBaQX9t4bVIdIC61darNHZwm4YxQSG5WLyhJx5QYs+doAOe+IP/AAS5u/G0ni21t/ibbaToeu6jqF/DYweFwDYi6vYrnyRLHdRtLGnkooifMW794I1cKQAdt4p/4J5WPjHxT411jUfFNtcx+IfDWt6DBbXOiLL9gmv9budVju1YzfM0DXIjAAUsU3hkztAB9hUAFABQAUAFAGT4l8T6d4R0+K+1Sc21rLd21ijiN5MzXE8dvCuFBPzSyxrnoN2SQATQBz2kfGzwJrnhTTvE1p4r0r+wL+2N3b39xdLAjRLAbhyRIVKlYVaRlYAqqOWA2tgAlHxj8D/vg3i7Q4Hhvl0yRLnUYomS6dtscJDMCHfIKLjLBlK5BGQC/p3xH8Lat4rvfDFl4j0m78R2Sh7nSYL2N7qBSMgvGDuXgg8joynoQSAUh8YfAp8L3HiU+MtATw7bzm1n1Z9ThW1hmGMxtKW2q4yPlJzzQBV1T46fDzRZLdL7xtoNsJrdbxXk1GEItuyO6zs27CRMsUmJGwpKkAk8UAMuvjx8OrDSJNUvPG+gWOnRX39mTXN5qMUKQXezzPs8hYjZLtGdjYOO1AGu3xL8Li61O1XX9OlutLa0W/giuVd7Q3JH2fzQCSnmbgV3YyDu6c0AQaj8WfB2j67Po+oeI9O0/UIba1u2ju5xEpjuJJo4CrthXLtbTDapJGzkDK5AL2pePfDmi3lzaahr2l2N1bRLPNBc3sUckcbEhXZS2QpIYAnrtOKAMG1+O3gHUNXg06z8VabfSzxwSxy2s3mwMkyXbxMJlzGQVsLs/e48rnG5dwBD4g/aF+GvhjTtO1DUfG+iQafqDstvdreLJE4WSKN33rkBEeeEO5IVN43ECgC5c/GzwJZeL5fCtz4t0aDxFBbNdXGntepvtUEkMf74g4iJe5hVVcgvuO0NtbABY0/4u+C9T8R6zoFv4o0tta0aOOW/sWulWWCN1RkkIbGUPmKN4yuTtzkEAA6ewv7fVLG3vLSeK6tLiNZYZ4HDxyIwyrKw4IIIII4OaAOJ+MOpS2Om+HIB4SufF9tea/YRzwW+7/QgkonS8barHEUsMZHQbiu5lXLAA+cNI8X6hqXhxrGH9nKUnQdRtNE07Sr651WO0lgurc2ctyPO00KUhhIhZ9jlY3uNrbGzMAdJ/bP/AAjur61Fa/B6+v7RdTlkOoRvqrrLNZDz4Lq4Mtp5ks8j21sDJFHOpWIATzMIoXAOo8BaPa6L4q8IeO7D4UXWl+JfHlgreJLt7u4a80hmszcJbyrImwqrW6W+GMQQ+UoXBCgA4Xwv4w1N9LsPC6fBPVNL0e91MeYYZ9Zt7MgMYU+X7EHEbRImFnWKIvHK83kq1vJcAEeo6jJeeE/E3idvgDfanY2kp8PafZXWoamdQ1K0gZooZJLR7QvHZvBLM7AeazGWRTG5kckA39S061tvEfiHwvrPwde88D3eo2aSJAb6/hmZmurh7sQiExFVVbXzAu3Ls8e6Xy4g4Bv69aX/AIN8T6houp+CLLWvCWqW5ujfWVxq97e3KWEAlijuYVtZozIzBIsPcZnCscSM3kgA5nxY8gTwfr0HwX1LU3vPCK3klz/a2pRapplxCAY7SQJbs/2jfqEgE7OJ9j3xwcMkgBrJqWg+KvCGq/EHUvhrqa+INS1C2s1t7V7+5luPJH+js4to3ltxAXkLo0SmC6gcYMkccjAHNaDe3syz6lpPwRk8M6tKukvMl1c6pb+V9qsL1nWGSG0PlNBPdzozRA4a6lkl8l2JoAveLPDum6l4V1ey8S/BS21+48L2sa2VqJNQvLe5N7eK12gc2hknRWgimd445mdVyURj5ZAGeD7y+1K80HVbr4Npcatql2PCWtX95daqstvYNF5kkkq3VlmSJtkm8b3jMrQjz5C7SIAYngVtS8azfFfxHqHwVudK1DTrC1u9N1DU31I6hqd9b6YywRxLNGsrtE814i3Ebxv88ZCByXAB9TeALm+vPBmkTajo1v4dumgH/EqtZjKlqnRI9xjjOQm3K7BtOV5xkgHOfGeDz9L0HzPiJ/wrm0h1QXdzcqYEfUIoIJp2tQ83CLiLzpCoJMVvKDhC5AB5poPhq/8AEWhXE0Xx8tb+bUHtNR+1aKx+ypp1swkuliDXkrp50dyoecS4TzICoUKgoAS60if4rRR+JfBXx2g0aHyJr5pNJEF/byJ80atcF55B5cYacFIXiQOwYbWjFAG34w+FV78W/DdnoEHxUlH9m2NlHM+mqrSXE0crrNcXGJSf3jW4Eewo0MsMrB3OVUAt6l8GfHkmpa3c6Z8VLnTLee5s59Ksf7LMkNiiMjXUEg88edHO0akfcaIFlRtjurAF/VPhF4jktdLsNK8a6jpFrYLar53my3UlyiXRluYpRLId3moI08zcXUBgu1SyOASf8Kp8XLP4kli+INxGl9NaDS7U2j+VpdskqPdwjE4MhnCyKJcq8IkxFtChQAJffCjxbfeKHvY/iLf2GitcpIdJtrd8mArJ58fnPKzK0khicOoXyhAqRqivL5oBxGjfst+J/D+jePdP0r4q6zpP/CQ3Ul3p1zZW7CTSpXnlmd2LzsblmJt1Z5MOUhZQwEjYAOyuPg34ht/Dzafo3je+0i6TTHtLa/IuLqaO48lljuHWW5McuyTY+11JYIE3hDtABfufhp4nufGGu6gnj7UbbQ9R0m6so9KithvtbyWRSt7HMXIBiiVI0jVFXIdyS7sSAcT4o/Z18eeIfBEGhxfGK+iu1urS6+332jpdlWt1iCOqtKCr5ton3FyvmSXL7SzxGAA3b/4W+M/E8vjzRNR1qz0/w3KdLl8I6hC0t7qGn3FsFlM9wlwTG7pcRxOvLb9pMm4kigD0vwrotzoVpcW9xfz38ZkUweezM0SCJE2bmZmYFkZ9zktlzktjcQDboA5zxh4M8O+MptEXxBYW2omxu5Z7KG7JKGWS0uLaQFM7ZA1vcXClHDLhicZAIAHaT4J8K2umW0Wm6DpEWniz+yQJbWkQj+ytHEnlLgY8spDAu0cFYox0UYAK9v4G8GQaVY6bB4f0OLTbZPsVpaRWcIhiVElj8mNAMAKkk6bAOA8gxhmBANjS/Duk6GXOm6ZZ6eXXaxtYFi3De8mDtAyN8srY9ZHPVjkAvrIrswUglTg47Hrj9aAHUAFABQAUAFABQAUAFABQAUAcp8QPh1p/xFtNMt7+6vrP+z7s31vNp8/kypN5EsSsHxkFfOLDH8SrnIyDpTqOm7oiUVJWMHR/gbpei2qWkOt+IWs4rIWMFsdSZYrdVmeVJI1UAJIm8Rqw6RxxpjC87/WZXb5Vd+XyI9n5sn1f4N2GtDTGm1jWo5tP15tfjmiulDu5MubZjt5t9szpsGMoSCeWzKrtK1ltYfJ5snl+FMUkeioPEfiEf2bam0ZmvgzXykxbnuGZSXcrG6bxtZVnl2lSQVPbtO/Khezv1ZRtPghY2T23l+IvEQhiv/7Qe3F8BFMxlmlkjkXbho5HnJcHlvLj5+XmniG7+6vuGqfmehQQNEZN8jS7nLDcANo9BgD9cn3rkvc0WhPQMKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgBMj1FABkeooAMj1FABkeooAMj1FABkeooAMj1FABkeooAMj1FABkeooAMj1FABkeooAMj1FABkeooAMj1oA//9k="},{"timing":1800,"timestamp":18163092458,"data":"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"},{"timing":2100,"timestamp":18163392458,"data":"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"},{"timing":2400,"timestamp":18163692458,"data":"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"},{"timing":2700,"timestamp":18163992458,"data":"/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRQBAwQEBQQFCQUFCRQNCw0UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFP/AABEIAMAAeAMBEQACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/AP1ToAKACgAoAKACgAoAKACgAoAKACgAoAKACgDlfiR8TNA+E/h5Na8Rz3MFjJdQWMS2VlPeTzXE0ixwxRwwo8js7sqgKp5NAGHZftB+AptMnvtS10eFI4I2nkh8XW8uh3AhWSOMzeTerFJ5XmTRRiTbsLuFBzxQBo/8Ls+Hgutatv8AhO/DX2jRJUg1WL+17ffp8jyiJEuBvzEzSEIA+CWIXrxQBSj/AGifhVNZSXkfxL8HyWcdoL97hNetDGtsZhB5xYSYEfnMsW/pvYLnJxQA21/aG+G+oXeiw2PjPSNSi1i3vrqzvbC6S4tHis1RrpjcRkxr5YlQncw4PsaANWb4ueDV+HGo+PrbxHYap4NsLO41CfWdKmF7b+RAH85kaHdv2+W4IXJypGM8UAc/4d/aU+H3iBPEbS6xceGx4dgtrrVP+Es0260P7LDcM6Qysb2OIbHaJ1DDIyvuMgG3c/Gr4fWj6Ok3jjw5G+si1bTVbVrcG9W5LrbNCC/7wSmOQIVzu2NjO04AIJ/jz8NLbSNG1ab4heFYtL1qR4tLvn1q2EF+6PsdYH37ZSrfKQhJB4PNAFX/AIaJ+GUWpRadd+O/D+l6nNeT2MNhqepQ2lzNNDdTWjrHDKyu48+3mjBUEMUO0mgD0WgAoAKACgAoA8w/aK+C/wDwvn4ew+Gft1jY+VqtjqmdU03+0LSf7NcJN5M1v5sXmRybNrDevBNAHkviX9i7UvE0Xwxx4h8H+HW+H2sPrWlWvhrwOtnZGQz28uxonu5HVD5U+4RyJueWKQ4aBdwBx/iT/gnDP4t1Xxteap8Qobj/AISZbhXU6JKwjE2t2uqsGja8MJH+jeViOKPcZGkfeeCAch+07/wTq1TUfhH4zb4eva6r4p1HUdWv00q1sILA3iX+q6fdLC8zzKgFtHZsFLcNngJgAgHo3iv9gW+8brrsuo+OtP0i71dNaEq+GPDx0+2ja/0/TbMBI2upDsX+zQ8i7/3vnuuU6kA7nwR+yPD4P/Z5+JHwxj1m1in8aLqH2jV7S1vGCSXVqtuZXjur24eRwEUn96obAGFOSQDF8U/sheK/H+v6l4l8S/ETTLnxOX0Iac+n+G5LfTYrfTbyW7Fvc2rXsjXMcskpZgZUIZEYHChSAcXr3/BNXT/EXgPxlolz4p0yLVPEFnBaQX9t4bVIdIC61darNHZwm4YxQSG5WLyhJx5QYs+doAOe+IP/AAS5u/G0ni21t/ibbaToeu6jqF/DYweFwDYi6vYrnyRLHdRtLGnkooifMW794I1cKQAdt4p/4J5WPjHxT411jUfFNtcx+IfDWt6DBbXOiLL9gmv9budVju1YzfM0DXIjAAUsU3hkztAB9hUAFABQAUAFAGT4l8T6d4R0+K+1Sc21rLd21ijiN5MzXE8dvCuFBPzSyxrnoN2SQATQBz2kfGzwJrnhTTvE1p4r0r+wL+2N3b39xdLAjRLAbhyRIVKlYVaRlYAqqOWA2tgAlHxj8D/vg3i7Q4Hhvl0yRLnUYomS6dtscJDMCHfIKLjLBlK5BGQC/p3xH8Lat4rvfDFl4j0m78R2Sh7nSYL2N7qBSMgvGDuXgg8joynoQSAUh8YfAp8L3HiU+MtATw7bzm1n1Z9ThW1hmGMxtKW2q4yPlJzzQBV1T46fDzRZLdL7xtoNsJrdbxXk1GEItuyO6zs27CRMsUmJGwpKkAk8UAMuvjx8OrDSJNUvPG+gWOnRX39mTXN5qMUKQXezzPs8hYjZLtGdjYOO1AGu3xL8Li61O1XX9OlutLa0W/giuVd7Q3JH2fzQCSnmbgV3YyDu6c0AQaj8WfB2j67Po+oeI9O0/UIba1u2ju5xEpjuJJo4CrthXLtbTDapJGzkDK5AL2pePfDmi3lzaahr2l2N1bRLPNBc3sUckcbEhXZS2QpIYAnrtOKAMG1+O3gHUNXg06z8VabfSzxwSxy2s3mwMkyXbxMJlzGQVsLs/e48rnG5dwBD4g/aF+GvhjTtO1DUfG+iQafqDstvdreLJE4WSKN33rkBEeeEO5IVN43ECgC5c/GzwJZeL5fCtz4t0aDxFBbNdXGntepvtUEkMf74g4iJe5hVVcgvuO0NtbABY0/4u+C9T8R6zoFv4o0tta0aOOW/sWulWWCN1RkkIbGUPmKN4yuTtzkEAA6ewv7fVLG3vLSeK6tLiNZYZ4HDxyIwyrKw4IIIII4OaAOJ+MOpS2Om+HIB4SufF9tea/YRzwW+7/QgkonS8barHEUsMZHQbiu5lXLAA+cNI8X6hqXhxrGH9nKUnQdRtNE07Sr651WO0lgurc2ctyPO00KUhhIhZ9jlY3uNrbGzMAdJ/bP/AAjur61Fa/B6+v7RdTlkOoRvqrrLNZDz4Lq4Mtp5ks8j21sDJFHOpWIATzMIoXAOo8BaPa6L4q8IeO7D4UXWl+JfHlgreJLt7u4a80hmszcJbyrImwqrW6W+GMQQ+UoXBCgA4Xwv4w1N9LsPC6fBPVNL0e91MeYYZ9Zt7MgMYU+X7EHEbRImFnWKIvHK83kq1vJcAEeo6jJeeE/E3idvgDfanY2kp8PafZXWoamdQ1K0gZooZJLR7QvHZvBLM7AeazGWRTG5kckA39S061tvEfiHwvrPwde88D3eo2aSJAb6/hmZmurh7sQiExFVVbXzAu3Ls8e6Xy4g4Bv69aX/AIN8T6houp+CLLWvCWqW5ujfWVxq97e3KWEAlijuYVtZozIzBIsPcZnCscSM3kgA5nxY8gTwfr0HwX1LU3vPCK3klz/a2pRapplxCAY7SQJbs/2jfqEgE7OJ9j3xwcMkgBrJqWg+KvCGq/EHUvhrqa+INS1C2s1t7V7+5luPJH+js4to3ltxAXkLo0SmC6gcYMkccjAHNaDe3syz6lpPwRk8M6tKukvMl1c6pb+V9qsL1nWGSG0PlNBPdzozRA4a6lkl8l2JoAveLPDum6l4V1ey8S/BS21+48L2sa2VqJNQvLe5N7eK12gc2hknRWgimd445mdVyURj5ZAGeD7y+1K80HVbr4Npcatql2PCWtX95daqstvYNF5kkkq3VlmSJtkm8b3jMrQjz5C7SIAYngVtS8azfFfxHqHwVudK1DTrC1u9N1DU31I6hqd9b6YywRxLNGsrtE814i3Ebxv88ZCByXAB9TeALm+vPBmkTajo1v4dumgH/EqtZjKlqnRI9xjjOQm3K7BtOV5xkgHOfGeDz9L0HzPiJ/wrm0h1QXdzcqYEfUIoIJp2tQ83CLiLzpCoJMVvKDhC5AB5poPhq/8AEWhXE0Xx8tb+bUHtNR+1aKx+ypp1swkuliDXkrp50dyoecS4TzICoUKgoAS60if4rRR+JfBXx2g0aHyJr5pNJEF/byJ80atcF55B5cYacFIXiQOwYbWjFAG34w+FV78W/DdnoEHxUlH9m2NlHM+mqrSXE0crrNcXGJSf3jW4Eewo0MsMrB3OVUAt6l8GfHkmpa3c6Z8VLnTLee5s59Ksf7LMkNiiMjXUEg88edHO0akfcaIFlRtjurAF/VPhF4jktdLsNK8a6jpFrYLar53my3UlyiXRluYpRLId3moI08zcXUBgu1SyOASf8Kp8XLP4kli+INxGl9NaDS7U2j+VpdskqPdwjE4MhnCyKJcq8IkxFtChQAJffCjxbfeKHvY/iLf2GitcpIdJtrd8mArJ58fnPKzK0khicOoXyhAqRqivL5oBxGjfst+J/D+jePdP0r4q6zpP/CQ3Ul3p1zZW7CTSpXnlmd2LzsblmJt1Z5MOUhZQwEjYAOyuPg34ht/Dzafo3je+0i6TTHtLa/IuLqaO48lljuHWW5McuyTY+11JYIE3hDtABfufhp4nufGGu6gnj7UbbQ9R0m6so9KithvtbyWRSt7HMXIBiiVI0jVFXIdyS7sSAcT4o/Z18eeIfBEGhxfGK+iu1urS6+332jpdlWt1iCOqtKCr5ton3FyvmSXL7SzxGAA3b/4W+M/E8vjzRNR1qz0/w3KdLl8I6hC0t7qGn3FsFlM9wlwTG7pcRxOvLb9pMm4kigD0vwrotzoVpcW9xfz38ZkUweezM0SCJE2bmZmYFkZ9zktlzktjcQDboA5zxh4M8O+MptEXxBYW2omxu5Z7KG7JKGWS0uLaQFM7ZA1vcXClHDLhicZAIAHaT4J8K2umW0Wm6DpEWniz+yQJbWkQj+ytHEnlLgY8spDAu0cFYox0UYAK9v4G8GQaVY6bB4f0OLTbZPsVpaRWcIhiVElj8mNAMAKkk6bAOA8gxhmBANjS/Duk6GXOm6ZZ6eXXaxtYFi3De8mDtAyN8srY9ZHPVjkAvrIrswUglTg47Hrj9aAHUAFABQAUAFABQAUAFABQAUAcp8QPh1p/xFtNMt7+6vrP+z7s31vNp8/kypN5EsSsHxkFfOLDH8SrnIyDpTqOm7oiUVJWMHR/gbpei2qWkOt+IWs4rIWMFsdSZYrdVmeVJI1UAJIm8Rqw6RxxpjC87/WZXb5Vd+XyI9n5sn1f4N2GtDTGm1jWo5tP15tfjmiulDu5MubZjt5t9szpsGMoSCeWzKrtK1ltYfJ5snl+FMUkeioPEfiEf2bam0ZmvgzXykxbnuGZSXcrG6bxtZVnl2lSQVPbtO/Khezv1ZRtPghY2T23l+IvEQhiv/7Qe3F8BFMxlmlkjkXbho5HnJcHlvLj5+XmniG7+6vuGqfmehQQNEZN8jS7nLDcANo9BgD9cn3rkvc0WhPQMKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgBMj1FABkeooAMj1FABkeooAMj1FABkeooAMj1FABkeooAMj1FABkeooAMj1FABkeooAMj1FABkeooAMj1oA//9k="},{"timing":3000,"timestamp":18164292458,"data":"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"}]}},"final-screenshot":{"id":"final-screenshot","title":"Final Screenshot","description":"The last screenshot captured of the pageload.","score":null,"scoreDisplayMode":"informative","rawValue":true,"details":{"type":"screenshot","timestamp":18161528.577,"data":"data:image/jpeg;base64,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AiIgIiICIiDEn03fgokn03fgogyiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgxJ9N34KJJ9N34KIMoiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiIMSfTd+CiSfTd+CiDKIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiDEn03fgokn03fgogyiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgxJ9N34KJJ9N34KIMoiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiIMSfTd+CiSfTd+CiDKIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiDEn03fgokn03fgogyiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgxJ9N34KJJ9N34KIMoiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiIMSfTd+CiSfTd+CiDKIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiDEn03fgokn03fgogyiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgxJ9N34KJJ9N34KIMoiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiIMSfTd+CiSfTd+CiDKIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiDEn03fgokn03fgogyiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgxJ9N34KJJ9N34KIMoiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiIMSfTd+CiSfTd+CiDKIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiDEn03fgokn03fgogyiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgIiICIiAiIgxJ9N34KJJ9N34KINfz3ezU893s1EQPPd7NTz3ezURA893s1PPd7NREDz3ezU893s1EQPPd7NTz3ezURA893s1PPd7NREDz3ezU893s1EQPPd7NTz3ezURA893s1PPd7NREDz3ezU893s1EQPPd7NTz3ezURA893s1PPd7NREDz3ezU893s1EQPPd7NTz3ezURA893s1PPd7NREDz3ezU893s1EQPPd7NTz3ezURA893s1PPd7NREDz3ezU893s1EQfmSd3Q7s30KIiD/2Q=="}},"estimated-input-latency":{"id":"estimated-input-latency","title":"Estimated Input Latency","description":"Estimated Input Latency is an estimate of how long your app takes to respond to user input, in milliseconds, during the busiest 5s window of page load. If your latency is higher than 50 ms, users may perceive your app as laggy. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/estimated-input-latency).","score":1,"scoreDisplayMode":"numeric","rawValue":12.8,"displayValue":"10 ms"},"max-potential-fid":{"id":"max-potential-fid","title":"Max Potential FID","description":"The potential First Input Delay that your users could experience is the duration, in milliseconds, of the longest task.","score":0.87,"scoreDisplayMode":"numeric","rawValue":141,"displayValue":"140 ms"},"errors-in-console":{"id":"errors-in-console","title":"Browser errors were logged to the console","description":"Errors logged to the console indicate unresolved problems. They can come from network request failures and other browser concerns.","score":0,"scoreDisplayMode":"binary","rawValue":1,"details":{"type":"table","headings":[{"key":"url","itemType":"url","text":"URL"},{"key":"description","itemType":"code","text":"Description"}],"items":[{"source":"network","description":"Failed to load resource: the server responded with a status of 404 ()","url":"https://www.example.com/favicon.ico"}]}},"time-to-first-byte":{"id":"time-to-first-byte","title":"Server response times are low (TTFB)","description":"Time To First Byte identifies the time at which your server sends a response. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/ttfb).","score":1,"scoreDisplayMode":"binary","rawValue":24.980999999999995,"displayValue":"Root document took 20 ms","details":{"type":"opportunity","overallSavingsMs":-575.019,"headings":[],"items":[]}},"first-cpu-idle":{"id":"first-cpu-idle","title":"First CPU Idle","description":"First CPU Idle marks the first time at which the page's main thread is quiet enough to handle input. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/first-interactive).","score":1,"scoreDisplayMode":"numeric","rawValue":921,"displayValue":"0.9 s"},"interactive":{"id":"interactive","title":"Time to Interactive","description":"Time to interactive is the amount of time it takes for the page to become fully interactive. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/consistently-interactive).","score":1,"scoreDisplayMode":"numeric","rawValue":921,"displayValue":"0.9 s"},"user-timings":{"id":"user-timings","title":"User Timing marks and measures","description":"Consider instrumenting your app with the User Timing API to measure your app's real-world performance during key user experiences. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/user-timing).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"critical-request-chains":{"id":"critical-request-chains","title":"Minimize Critical Requests Depth","description":"The Critical Request Chains below show you what resources are loaded with a high priority. Consider reducing the length of chains, reducing the download size of resources, or deferring the download of unnecessary resources to improve page load. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/critical-request-chains).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true,"displayValue":"","details":{"type":"criticalrequestchain","chains":{"C5576DBC9A6D8EAEBE9DEE81899AC1D7":{"request":{"url":"https://www.example.com/","startTime":18161.294163,"endTime":18161.428321,"responseReceivedTime":18161.423205,"transferSize":804}},"1000060305.2":{"request":{"url":"https://www.example.com/favicon.ico","startTime":18161.514967,"endTime":18161.527841,"responseReceivedTime":18161.52737,"transferSize":685}}},"longestChain":{"duration":233.6780000005092,"length":1,"transferSize":685}}},"redirects":{"id":"redirects","title":"Avoid multiple page redirects","description":"Redirects introduce additional delays before the page can be loaded. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/redirects).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0}},"installable-manifest":{"id":"installable-manifest","title":"Web app manifest does not meet the installability requirements","description":"Browsers can proactively prompt users to add your app to their homescreen, which can lead to higher engagement. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/install-prompt).","score":0,"scoreDisplayMode":"binary","rawValue":false,"explanation":"Failures: No manifest was fetched.","details":{"type":"diagnostic","items":[{"failures":["No manifest was fetched"],"isParseFailure":true,"parseFailureReason":"No manifest was fetched"}]}},"splash-screen":{"id":"splash-screen","title":"Is not configured for a custom splash screen","description":"A themed splash screen ensures a high-quality experience when users launch your app from their homescreens. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/custom-splash-screen).","score":0,"scoreDisplayMode":"binary","rawValue":false,"explanation":"Failures: No manifest was fetched.","details":{"type":"diagnostic","items":[{"failures":["No manifest was fetched"],"isParseFailure":true,"parseFailureReason":"No manifest was fetched"}]}},"themed-omnibox":{"id":"themed-omnibox","title":"Does not set an address-bar theme color","description":"The browser address bar can be themed to match your site. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/address-bar).","score":0,"scoreDisplayMode":"binary","rawValue":false,"explanation":"Failures: No manifest was fetched,\nNo `\u003cmeta name=\"theme-color\">` tag found.","details":{"type":"diagnostic","items":[{"failures":["No manifest was fetched","No `\u003cmeta name=\"theme-color\">` tag found"],"themeColor":null,"isParseFailure":true,"parseFailureReason":"No manifest was fetched"}]}},"content-width":{"id":"content-width","title":"Content is sized correctly for the viewport","description":"If the width of your app's content doesn't match the width of the viewport, your app might not be optimized for mobile screens. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/content-sized-correctly-for-viewport).","score":1,"scoreDisplayMode":"binary","rawValue":true,"explanation":""},"image-aspect-ratio":{"id":"image-aspect-ratio","title":"Displays images with correct aspect ratio","description":"Image display dimensions should match natural aspect ratio. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/aspect-ratio).","score":1,"scoreDisplayMode":"binary","rawValue":true,"warnings":[],"details":{"type":"table","headings":[],"items":[]}},"deprecations":{"id":"deprecations","title":"Avoids deprecated APIs","description":"Deprecated APIs will eventually be removed from the browser. [Learn more](https://www.chromestatus.com/features#deprecated).","score":1,"scoreDisplayMode":"binary","rawValue":true,"displayValue":"","details":{"type":"table","headings":[],"items":[]}},"mainthread-work-breakdown":{"id":"mainthread-work-breakdown","title":"Minimizes main-thread work","description":"Consider reducing the time spent parsing, compiling and executing JS. You may find delivering smaller JS payloads helps with this.","score":1,"scoreDisplayMode":"numeric","rawValue":361.536,"displayValue":"0.4 s","details":{"type":"table","headings":[{"key":"groupLabel","itemType":"text","text":"Category"},{"key":"duration","itemType":"ms","granularity":1,"text":"Time Spent"}],"items":[{"group":"styleLayout","groupLabel":"Style & Layout","duration":278.42400000000004},{"group":"other","groupLabel":"Other","duration":41.63199999999999},{"group":"paintCompositeRender","groupLabel":"Rendering","duration":24.964},{"group":"scriptEvaluation","groupLabel":"Script Evaluation","duration":11.672000000000002},{"group":"parseHTML","groupLabel":"Parse HTML & CSS","duration":3.412},{"group":"scriptParseCompile","groupLabel":"Script Parsing & Compilation","duration":1.4320000000000002}]}},"bootup-time":{"id":"bootup-time","title":"JavaScript execution time","description":"Consider reducing the time spent parsing, compiling, and executing JS. You may find delivering smaller JS payloads helps with this. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/bootup).","score":1,"scoreDisplayMode":"numeric","rawValue":13.104000000000003,"displayValue":"0.0 s","details":{"type":"table","headings":[{"key":"url","itemType":"url","text":"URL"},{"key":"total","granularity":1,"itemType":"ms","text":"Total CPU Time"},{"key":"scripting","granularity":1,"itemType":"ms","text":"Script Evaluation"},{"key":"scriptParseCompile","granularity":1,"itemType":"ms","text":"Script Parse"}],"items":[{"url":"Other","total":361.536,"scripting":11.672000000000002,"scriptParseCompile":1.4320000000000002}],"summary":{"wastedMs":13.104000000000003}}},"uses-rel-preload":{"id":"uses-rel-preload","title":"Preload key requests","description":"Consider using \u003clink rel=preload> to prioritize fetching resources that are currently requested later in page load. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/preload).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0}},"uses-rel-preconnect":{"id":"uses-rel-preconnect","title":"Preconnect to required origins","description":"Consider adding preconnect or dns-prefetch resource hints to establish early connections to important third-party origins. [Learn more](https://developers.google.com/web/fundamentals/performance/resource-prioritization#preconnect).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","warnings":[],"details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0}},"font-display":{"id":"font-display","title":"All text remains visible during webfont loads","description":"Leverage the font-display CSS feature to ensure text is user-visible while webfonts are loading. [Learn more](https://developers.google.com/web/updates/2016/02/font-display).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"diagnostics":{"id":"diagnostics","title":"Diagnostics","description":"Collection of useful page vitals.","score":null,"scoreDisplayMode":"informative","rawValue":1,"details":{"type":"diagnostic","items":[{"numRequests":2,"numScripts":0,"numStylesheets":0,"numFonts":0,"numTasks":71,"numTasksOver10ms":1,"numTasksOver25ms":1,"numTasksOver50ms":1,"numTasksOver100ms":0,"numTasksOver500ms":0,"rtt":20.631,"throughput":1257232.2125995448,"maxRtt":20.631,"maxServerLatency":0,"totalByteWeight":1489,"totalTaskTime":90.38400000000001,"mainDocumentTransferSize":804}]}},"network-requests":{"id":"network-requests","title":"Network Requests","description":"Lists the network requests that were made during page load.","score":null,"scoreDisplayMode":"informative","rawValue":2,"details":{"type":"table","headings":[{"key":"url","itemType":"url","text":"URL"},{"key":"startTime","itemType":"ms","granularity":1,"text":"Start Time"},{"key":"endTime","itemType":"ms","granularity":1,"text":"End Time"},{"key":"transferSize","itemType":"bytes","displayUnit":"kb","granularity":1,"text":"Transfer Size"},{"key":"resourceSize","itemType":"bytes","displayUnit":"kb","granularity":1,"text":"Resource Size"},{"key":"statusCode","itemType":"text","text":"Status Code"},{"key":"mimeType","itemType":"text","text":"MIME Type"},{"key":"resourceType","itemType":"text","text":"Resource Type"}],"items":[{"url":"https://www.example.com/","startTime":0,"endTime":134.1580000007525,"transferSize":804,"resourceSize":1270,"statusCode":200,"mimeType":"text/html","resourceType":"Document"},{"url":"https://www.example.com/favicon.ico","startTime":220.8040000004985,"endTime":233.6780000005092,"transferSize":685,"resourceSize":1270,"statusCode":404,"mimeType":"text/html","resourceType":"Other"}]}},"network-rtt":{"id":"network-rtt","title":"Network Round Trip Times","description":"Network round trip times (RTT) have a large impact on performance. If the RTT to an origin is high, it's an indication that servers closer to the user could improve performance. [Learn more](https://hpbn.co/primer-on-latency-and-bandwidth/).","score":null,"scoreDisplayMode":"informative","rawValue":20.631,"displayValue":"20 ms","details":{"type":"table","headings":[{"key":"origin","itemType":"text","text":"URL"},{"key":"rtt","itemType":"ms","granularity":1,"text":"Time Spent"}],"items":[{"origin":"https://www.example.com","rtt":20.631}]}},"network-server-latency":{"id":"network-server-latency","title":"Server Backend Latencies","description":"Server latencies can impact web performance. If the server latency of an origin is high, it's an indication the server is overloaded or has poor backend performance. [Learn more](https://hpbn.co/primer-on-web-performance/#analyzing-the-resource-waterfall).","score":null,"scoreDisplayMode":"informative","rawValue":0,"displayValue":"0 ms","details":{"type":"table","headings":[{"key":"origin","itemType":"text","text":"URL"},{"key":"serverReponseTime","itemType":"ms","granularity":1,"text":"Time Spent"}],"items":[{"origin":"https://www.example.com","serverReponseTime":0}]}},"main-thread-tasks":{"id":"main-thread-tasks","title":"Tasks","description":"Lists the toplevel main thread tasks that executed during page load.","score":null,"scoreDisplayMode":"informative","rawValue":3,"details":{"type":"table","headings":[{"key":"type","itemType":"text","text":"Task Type"},{"key":"startTime","itemType":"ms","granularity":1,"text":"Start Time"},{"key":"duration","itemType":"ms","granularity":1,"text":"End Time"}],"items":[{"type":"parseHTML","duration":70.117,"startTime":147.222},{"type":"styleLayout","duration":69.337,"startTime":147.76},{"type":"paintCompositeRender","duration":5.664,"startTime":219.646}]}},"metrics":{"id":"metrics","title":"Metrics","description":"Collects all available metrics.","score":null,"scoreDisplayMode":"informative","rawValue":921,"details":{"type":"diagnostic","items":[{"firstContentfulPaint":780,"firstMeaningfulPaint":851,"firstCPUIdle":921,"interactive":921,"speedIndex":780,"estimatedInputLatency":13,"observedNavigationStart":0,"observedNavigationStartTs":18161292458,"observedFirstPaint":222,"observedFirstPaintTs":18161514330,"observedFirstContentfulPaint":222,"observedFirstContentfulPaintTs":18161514332,"observedFirstMeaningfulPaint":222,"observedFirstMeaningfulPaintTs":18161514332,"observedTraceEnd":1283,"observedTraceEndTs":18162575679,"observedLoad":144,"observedLoadTs":18161436433,"observedDomContentLoaded":144,"observedDomContentLoadedTs":18161436027,"observedFirstVisualChange":236,"observedFirstVisualChangeTs":18161528458,"observedLastVisualChange":236,"observedLastVisualChangeTs":18161528458,"observedSpeedIndex":236,"observedSpeedIndexTs":18161528577}]}},"offline-start-url":{"id":"offline-start-url","title":"start_url does not respond with a 200 when offline","description":"A service worker enables your web app to be reliable in unpredictable network conditions. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/http-200-when-offline).","score":0,"scoreDisplayMode":"binary","rawValue":false,"explanation":"No usable web app manifest found on page.","warnings":[]},"pwa-cross-browser":{"id":"pwa-cross-browser","title":"Site works cross-browser","description":"To reach the most number of users, sites should work across every major browser. [Learn more](https://developers.google.com/web/progressive-web-apps/checklist#site-works-cross-browser).","score":null,"scoreDisplayMode":"manual","rawValue":false},"pwa-page-transitions":{"id":"pwa-page-transitions","title":"Page transitions don't feel like they block on the network","description":"Transitions should feel snappy as you tap around, even on a slow network, a key to perceived performance. [Learn more](https://developers.google.com/web/progressive-web-apps/checklist#page-transitions-dont-feel-like-they-block-on-the-network).","score":null,"scoreDisplayMode":"manual","rawValue":false},"pwa-each-page-has-url":{"id":"pwa-each-page-has-url","title":"Each page has a URL","description":"Ensure individual pages are deep linkable via the URLs and that URLs are unique for the purpose of shareability on social media. [Learn more](https://developers.google.com/web/progressive-web-apps/checklist#each-page-has-a-url).","score":null,"scoreDisplayMode":"manual","rawValue":false},"accesskeys":{"id":"accesskeys","title":"`[accesskey]` values are unique","description":"Access keys let users quickly focus a part of the page. For proper navigation, each access key must be unique. [Learn more](https://dequeuniversity.com/rules/axe/3.1/accesskeys?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"aria-allowed-attr":{"id":"aria-allowed-attr","title":"`[aria-*]` attributes match their roles","description":"Each ARIA `role` supports a specific subset of `aria-*` attributes. Mismatching these invalidates the `aria-*` attributes. [Learn more](https://dequeuniversity.com/rules/axe/3.1/aria-allowed-attr?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"aria-required-attr":{"id":"aria-required-attr","title":"`[role]`s have all required `[aria-*]` attributes","description":"Some ARIA roles have required attributes that describe the state of the element to screen readers. [Learn more](https://dequeuniversity.com/rules/axe/3.1/aria-required-attr?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"aria-required-children":{"id":"aria-required-children","title":"Elements with `[role]` that require specific children `[role]`s, are present","description":"Some ARIA parent roles must contain specific child roles to perform their intended accessibility functions. [Learn more](https://dequeuniversity.com/rules/axe/3.1/aria-required-children?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"aria-required-parent":{"id":"aria-required-parent","title":"`[role]`s are contained by their required parent element","description":"Some ARIA child roles must be contained by specific parent roles to properly perform their intended accessibility functions. [Learn more](https://dequeuniversity.com/rules/axe/3.1/aria-required-parent?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"aria-roles":{"id":"aria-roles","title":"`[role]` values are valid","description":"ARIA roles must have valid values in order to perform their intended accessibility functions. [Learn more](https://dequeuniversity.com/rules/axe/3.1/aria-roles?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"aria-valid-attr-value":{"id":"aria-valid-attr-value","title":"`[aria-*]` attributes have valid values","description":"Assistive technologies, like screen readers, can't interpret ARIA attributes with invalid values. [Learn more](https://dequeuniversity.com/rules/axe/3.1/aria-valid-attr-value?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"aria-valid-attr":{"id":"aria-valid-attr","title":"`[aria-*]` attributes are valid and not misspelled","description":"Assistive technologies, like screen readers, can't interpret ARIA attributes with invalid names. [Learn more](https://dequeuniversity.com/rules/axe/3.1/aria-valid-attr?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"audio-caption":{"id":"audio-caption","title":"`\u003caudio>` elements contain a `\u003ctrack>` element with `[kind=\"captions\"]`","description":"Captions make audio elements usable for deaf or hearing-impaired users, providing critical information such as who is talking, what they're saying, and other non-speech information. [Learn more](https://dequeuniversity.com/rules/axe/3.1/audio-caption?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"button-name":{"id":"button-name","title":"Buttons have an accessible name","description":"When a button doesn't have an accessible name, screen readers announce it as \"button\", making it unusable for users who rely on screen readers. [Learn more](https://dequeuniversity.com/rules/axe/3.1/button-name?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"bypass":{"id":"bypass","title":"The page contains a heading, skip link, or landmark region","description":"Adding ways to bypass repetitive content lets keyboard users navigate the page more efficiently. [Learn more](https://dequeuniversity.com/rules/axe/3.1/bypass?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"color-contrast":{"id":"color-contrast","title":"Background and foreground colors have a sufficient contrast ratio","description":"Low-contrast text is difficult or impossible for many users to read. [Learn more](https://dequeuniversity.com/rules/axe/3.1/color-contrast?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"definition-list":{"id":"definition-list","title":"`\u003cdl>`'s contain only properly-ordered `\u003cdt>` and `\u003cdd>` groups, `\u003cscript>` or `\u003ctemplate>` elements.","description":"When definition lists are not properly marked up, screen readers may produce confusing or inaccurate output. [Learn more](https://dequeuniversity.com/rules/axe/3.1/definition-list?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"dlitem":{"id":"dlitem","title":"Definition list items are wrapped in `\u003cdl>` elements","description":"Definition list items (`\u003cdt>` and `\u003cdd>`) must be wrapped in a parent `\u003cdl>` element to ensure that screen readers can properly announce them. [Learn more](https://dequeuniversity.com/rules/axe/3.1/dlitem?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"document-title":{"id":"document-title","title":"Document has a `\u003ctitle>` element","description":"The title gives screen reader users an overview of the page, and search engine users rely on it heavily to determine if a page is relevant to their search. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/title).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"duplicate-id":{"id":"duplicate-id","title":"`[id]` attributes on the page are unique","description":"The value of an id attribute must be unique to prevent other instances from being overlooked by assistive technologies. [Learn more](https://dequeuniversity.com/rules/axe/3.1/duplicate-id?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"frame-title":{"id":"frame-title","title":"`\u003cframe>` or `\u003ciframe>` elements have a title","description":"Screen reader users rely on frame titles to describe the contents of frames. [Learn more](https://dequeuniversity.com/rules/axe/3.1/frame-title?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"html-has-lang":{"id":"html-has-lang","title":"`\u003chtml>` element does not have a `[lang]` attribute","description":"If a page doesn't specify a lang attribute, a screen reader assumes that the page is in the default language that the user chose when setting up the screen reader. If the page isn't actually in the default language, then the screen reader might not announce the page's text correctly. [Learn more](https://dequeuniversity.com/rules/axe/3.1/html-has-lang?application=lighthouse).","score":0,"scoreDisplayMode":"binary","rawValue":false,"details":{"type":"table","headings":[{"key":"node","itemType":"node","text":"Failing Elements"}],"items":[{"node":{"type":"node","selector":"html","path":"1,HTML","snippet":"\u003chtml>","explanation":"Fix any of the following:\n  The \u003chtml> element does not have a lang attribute"}}],"diagnostic":{"type":"diagnostic","impact":"serious","tags":["cat.language","wcag2a","wcag311"]}}},"html-lang-valid":{"id":"html-lang-valid","title":"`\u003chtml>` element has a valid value for its `[lang]` attribute","description":"Specifying a valid [BCP 47 language](https://www.w3.org/International/questions/qa-choosing-language-tags#question) helps screen readers announce text properly. [Learn more](https://dequeuniversity.com/rules/axe/3.1/valid-lang?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"image-alt":{"id":"image-alt","title":"Image elements have `[alt]` attributes","description":"Informative elements should aim for short, descriptive alternate text. Decorative elements can be ignored with an empty alt attribute. [Learn more](https://dequeuniversity.com/rules/axe/3.1/image-alt?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"input-image-alt":{"id":"input-image-alt","title":"`\u003cinput type=\"image\">` elements have `[alt]` text","description":"When an image is being used as an `\u003cinput>` button, providing alternative text can help screen reader users understand the purpose of the button. [Learn more](https://dequeuniversity.com/rules/axe/3.1/input-image-alt?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"label":{"id":"label","title":"Form elements have associated labels","description":"Labels ensure that form controls are announced properly by assistive technologies, like screen readers. [Learn more](https://dequeuniversity.com/rules/axe/3.1/label?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"layout-table":{"id":"layout-table","title":"Presentational `\u003ctable>` elements avoid using `\u003cth>`, `\u003ccaption>` or the `[summary]` attribute.","description":"A table being used for layout purposes should not include data elements, such as the th or caption elements or the summary attribute, because this can create a confusing experience for screen reader users. [Learn more](https://dequeuniversity.com/rules/axe/3.1/layout-table?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"link-name":{"id":"link-name","title":"Links have a discernible name","description":"Link text (and alternate text for images, when used as links) that is discernible, unique, and focusable improves the navigation experience for screen reader users. [Learn more](https://dequeuniversity.com/rules/axe/3.1/link-name?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"list":{"id":"list","title":"Lists contain only `\u003cli>` elements and script supporting elements (`\u003cscript>` and `\u003ctemplate>`).","description":"Screen readers have a specific way of announcing lists. Ensuring proper list structure aids screen reader output. [Learn more](https://dequeuniversity.com/rules/axe/3.1/list?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"listitem":{"id":"listitem","title":"List items (`\u003cli>`) are contained within `\u003cul>` or `\u003col>` parent elements","description":"Screen readers require list items (`\u003cli>`) to be contained within a parent `\u003cul>` or `\u003col>` to be announced properly. [Learn more](https://dequeuniversity.com/rules/axe/3.1/listitem?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"meta-refresh":{"id":"meta-refresh","title":"The document does not use `\u003cmeta http-equiv=\"refresh\">`","description":"Users do not expect a page to refresh automatically, and doing so will move focus back to the top of the page. This may create a frustrating or confusing experience. [Learn more](https://dequeuniversity.com/rules/axe/3.1/meta-refresh?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"meta-viewport":{"id":"meta-viewport","title":"`[user-scalable=\"no\"]` is not used in the `\u003cmeta name=\"viewport\">` element and the `[maximum-scale]` attribute is not less than 5.","description":"Disabling zooming is problematic for users with low vision who rely on screen magnification to properly see the contents of a web page. [Learn more](https://dequeuniversity.com/rules/axe/3.1/meta-viewport?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"object-alt":{"id":"object-alt","title":"`\u003cobject>` elements have `[alt]` text","description":"Screen readers cannot translate non-text content. Adding alt text to `\u003cobject>` elements helps screen readers convey meaning to users. [Learn more](https://dequeuniversity.com/rules/axe/3.1/object-alt?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"tabindex":{"id":"tabindex","title":"No element has a `[tabindex]` value greater than 0","description":"A value greater than 0 implies an explicit navigation ordering. Although technically valid, this often creates frustrating experiences for users who rely on assistive technologies. [Learn more](https://dequeuniversity.com/rules/axe/3.1/tabindex?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"td-headers-attr":{"id":"td-headers-attr","title":"Cells in a `\u003ctable>` element that use the `[headers]` attribute only refer to other cells of that same table.","description":"Screen readers have features to make navigating tables easier. Ensuring `\u003ctd>` cells using the `[headers]` attribute only refer to other cells in the same table may improve the experience for screen reader users. [Learn more](https://dequeuniversity.com/rules/axe/3.1/td-headers-attr?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"th-has-data-cells":{"id":"th-has-data-cells","title":"`\u003cth>` elements and elements with `[role=\"columnheader\"/\"rowheader\"]` have data cells they describe.","description":"Screen readers have features to make navigating tables easier. Ensuring table headers always refer to some set of cells may improve the experience for screen reader users. [Learn more](https://dequeuniversity.com/rules/axe/3.1/th-has-data-cells?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"valid-lang":{"id":"valid-lang","title":"`[lang]` attributes have a valid value","description":"Specifying a valid [BCP 47 language](https://www.w3.org/International/questions/qa-choosing-language-tags#question) on elements helps ensure that text is pronounced correctly by a screen reader. [Learn more](https://dequeuniversity.com/rules/axe/3.1/valid-lang?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"video-caption":{"id":"video-caption","title":"`\u003cvideo>` elements contain a `\u003ctrack>` element with `[kind=\"captions\"]`","description":"When a video provides a caption it is easier for deaf and hearing impaired users to access its information. [Learn more](https://dequeuniversity.com/rules/axe/3.1/video-caption?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"video-description":{"id":"video-description","title":"`\u003cvideo>` elements contain a `\u003ctrack>` element with `[kind=\"description\"]`","description":"Audio descriptions provide relevant information for videos that dialogue cannot, such as facial expressions and scenes. [Learn more](https://dequeuniversity.com/rules/axe/3.1/video-description?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"custom-controls-labels":{"id":"custom-controls-labels","title":"Custom controls have associated labels","description":"Custom interactive controls have associated labels, provided by aria-label or aria-labelledby. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#try_it_with_a_screen_reader).","score":null,"scoreDisplayMode":"manual","rawValue":false},"custom-controls-roles":{"id":"custom-controls-roles","title":"Custom controls have ARIA roles","description":"Custom interactive controls have appropriate ARIA roles. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#try_it_with_a_screen_reader).","score":null,"scoreDisplayMode":"manual","rawValue":false},"focus-traps":{"id":"focus-traps","title":"User focus is not accidentally trapped in a region","description":"A user can tab into and out of any control or region without accidentally trapping their focus. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#start_with_the_keyboard).","score":null,"scoreDisplayMode":"manual","rawValue":false},"focusable-controls":{"id":"focusable-controls","title":"Interactive controls are keyboard focusable","description":"Custom interactive controls are keyboard focusable and display a focus indicator. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#start_with_the_keyboard).","score":null,"scoreDisplayMode":"manual","rawValue":false},"heading-levels":{"id":"heading-levels","title":"Headings don't skip levels","description":"Headings are used to create an outline for the page and heading levels are not skipped. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#take_advantage_of_headings_and_landmarks).","score":null,"scoreDisplayMode":"manual","rawValue":false},"interactive-element-affordance":{"id":"interactive-element-affordance","title":"Interactive elements indicate their purpose and state","description":"Interactive elements, such as links and buttons, should indicate their state and be distinguishable from non-interactive elements. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#interactive_elements_like_links_and_buttons_should_indicate_their_purpose_and_state).","score":null,"scoreDisplayMode":"manual","rawValue":false},"logical-tab-order":{"id":"logical-tab-order","title":"The page has a logical tab order","description":"Tabbing through the page follows the visual layout. Users cannot focus elements that are offscreen. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#start_with_the_keyboard).","score":null,"scoreDisplayMode":"manual","rawValue":false},"managed-focus":{"id":"managed-focus","title":"The user's focus is directed to new content added to the page","description":"If new content, such as a dialog, is added to the page, the user's focus is directed to it. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#start_with_the_keyboard).","score":null,"scoreDisplayMode":"manual","rawValue":false},"offscreen-content-hidden":{"id":"offscreen-content-hidden","title":"Offscreen content is hidden from assistive technology","description":"Offscreen content is hidden with display: none or aria-hidden=true. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#try_it_with_a_screen_reader).","score":null,"scoreDisplayMode":"manual","rawValue":false},"use-landmarks":{"id":"use-landmarks","title":"HTML5 landmark elements are used to improve navigation","description":"Landmark elements (\u003cmain>, \u003cnav>, etc.) are used to improve the keyboard navigation of the page for assistive technology. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#take_advantage_of_headings_and_landmarks).","score":null,"scoreDisplayMode":"manual","rawValue":false},"visual-order-follows-dom":{"id":"visual-order-follows-dom","title":"Visual order on the page follows DOM order","description":"DOM order matches the visual order, improving navigation for assistive technology. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#try_it_with_a_screen_reader).","score":null,"scoreDisplayMode":"manual","rawValue":false},"uses-long-cache-ttl":{"id":"uses-long-cache-ttl","title":"Uses efficient cache policy on static assets","description":"A long cache lifetime can speed up repeat visits to your page. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/cache-policy).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"0 resources found","details":{"type":"table","headings":[],"items":[],"summary":{"wastedBytes":0}}},"total-byte-weight":{"id":"total-byte-weight","title":"Avoids enormous network payloads","description":"Large network payloads cost users real money and are highly correlated with long load times. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/network-payloads).","score":1,"scoreDisplayMode":"numeric","rawValue":1489,"displayValue":"Total size was 1 KB","details":{"type":"table","headings":[{"key":"url","itemType":"url","text":"URL"},{"key":"totalBytes","itemType":"bytes","text":"Size (KB)"}],"items":[{"url":"https://www.example.com/","totalBytes":804},{"url":"https://www.example.com/favicon.ico","totalBytes":685}]}},"offscreen-images":{"id":"offscreen-images","title":"Defer offscreen images","description":"Consider lazy-loading offscreen and hidden images after all critical resources have finished loading to lower time to interactive. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/offscreen-images).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","warnings":[],"details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"render-blocking-resources":{"id":"render-blocking-resources","title":"Eliminate render-blocking resources","description":"Resources are blocking the first paint of your page. Consider delivering critical JS/CSS inline and deferring all non-critical JS/styles. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/blocking-resources).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0}},"unminified-css":{"id":"unminified-css","title":"Minify CSS","description":"Minifying CSS files can reduce network payload sizes. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/minify-css).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"unminified-javascript":{"id":"unminified-javascript","title":"Minify JavaScript","description":"Minifying JavaScript files can reduce payload sizes and script parse time. [Learn more](https://developers.google.com/speed/docs/insights/MinifyResources).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","warnings":[],"details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"unused-css-rules":{"id":"unused-css-rules","title":"Remove unused CSS","description":"Remove dead rules from stylesheets and defer the loading of CSS not used for above-the-fold content to reduce unnecessary bytes consumed by network activity. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/unused-css).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"uses-webp-images":{"id":"uses-webp-images","title":"Serve images in next-gen formats","description":"Image formats like JPEG 2000, JPEG XR, and WebP often provide better compression than PNG or JPEG, which means faster downloads and less data consumption. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/webp).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","warnings":[],"details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"uses-optimized-images":{"id":"uses-optimized-images","title":"Efficiently encode images","description":"Optimized images load faster and consume less cellular data. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/optimize-images).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","warnings":[],"details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"uses-text-compression":{"id":"uses-text-compression","title":"Enable text compression","description":"Text-based resources should be served with compression (gzip, deflate or brotli) to minimize total network bytes. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/text-compression).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"uses-responsive-images":{"id":"uses-responsive-images","title":"Properly size images","description":"Serve images that are appropriately-sized to save cellular data and improve load time. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/oversized-images).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","warnings":[],"details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"efficient-animated-content":{"id":"efficient-animated-content","title":"Use video formats for animated content","description":"Large GIFs are inefficient for delivering animated content. Consider using MPEG4/WebM videos for animations and PNG/WebP for static images instead of GIF to save network bytes. [Learn more](https://developers.google.com/web/fundamentals/performance/optimizing-content-efficiency/replace-animated-gifs-with-video/)","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"appcache-manifest":{"id":"appcache-manifest","title":"Avoids Application Cache","description":"Application Cache is deprecated. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/appcache).","score":1,"scoreDisplayMode":"binary","rawValue":true,"displayValue":""},"doctype":{"id":"doctype","title":"Page has the HTML doctype","description":"Specifying a doctype prevents the browser from switching to quirks-mode.Read more on the [MDN Web Docs page](https://developer.mozilla.org/en-US/docs/Glossary/Doctype)","score":1,"scoreDisplayMode":"binary","rawValue":true},"dom-size":{"id":"dom-size","title":"Avoids an excessive DOM size","description":"Browser engineers recommend pages contain fewer than ~1,500 DOM nodes. The sweet spot is a tree depth \u003c 32 elements and fewer than 60 children/parent element. A large DOM can increase memory usage, cause longer [style calculations](https://developers.google.com/web/fundamentals/performance/rendering/reduce-the-scope-and-complexity-of-style-calculations), and produce costly [layout reflows](https://developers.google.com/speed/articles/reflow). [Learn more](https://developers.google.com/web/tools/lighthouse/audits/dom-size).","score":1,"scoreDisplayMode":"numeric","rawValue":13,"displayValue":"13 nodes","details":{"type":"table","headings":[{"key":"statistic","itemType":"text","text":"Statistic"},{"key":"element","itemType":"code","text":"Element"},{"key":"value","itemType":"numeric","text":"Value"}],"items":[{"statistic":"Total DOM Nodes","element":"","value":"13"},{"statistic":"Maximum DOM Depth","element":{"type":"code","value":"\u003ca href=\"http://www.iana.org/domains/example\">"},"value":"5"},{"statistic":"Maximum Child Elements","element":{"type":"code","value":"\u003chead>"},"value":"5"}]}},"external-anchors-use-rel-noopener":{"id":"external-anchors-use-rel-noopener","title":"Links to cross-origin destinations are safe","description":"Add `rel=\"noopener\"` or `rel=\"noreferrer\"` to any external links to improve performance and prevent security vulnerabilities. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/noopener).","score":1,"scoreDisplayMode":"binary","rawValue":true,"warnings":[],"details":{"type":"table","headings":[],"items":[]}},"geolocation-on-start":{"id":"geolocation-on-start","title":"Avoids requesting the geolocation permission on page load","description":"Users are mistrustful of or confused by sites that request their location without context. Consider tying the request to user gestures instead. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/geolocation-on-load).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"no-document-write":{"id":"no-document-write","title":"Avoids `document.write()`","description":"For users on slow connections, external scripts dynamically injected via `document.write()` can delay page load by tens of seconds. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/document-write).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"no-vulnerable-libraries":{"id":"no-vulnerable-libraries","title":"Avoids front-end JavaScript libraries with known security vulnerabilities","description":"Some third-party scripts may contain known security vulnerabilities that are easily identified and exploited by attackers. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/vulnerabilities).","score":1,"scoreDisplayMode":"binary","rawValue":true},"js-libraries":{"id":"js-libraries","title":"Detected JavaScript libraries","description":"All front-end JavaScript libraries detected on the page.","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[],"summary":{}}},"notification-on-start":{"id":"notification-on-start","title":"Avoids requesting the notification permission on page load","description":"Users are mistrustful of or confused by sites that request to send notifications without context. Consider tying the request to user gestures instead. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/notifications-on-load).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"password-inputs-can-be-pasted-into":{"id":"password-inputs-can-be-pasted-into","title":"Allows users to paste into password fields","description":"Preventing password pasting undermines good security policy. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/password-pasting).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"uses-http2":{"id":"uses-http2","title":"Uses HTTP/2 for its own resources","description":"HTTP/2 offers many benefits over HTTP/1.1, including binary headers, multiplexing, and server push. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/http2).","score":1,"scoreDisplayMode":"binary","rawValue":true,"displayValue":"","details":{"type":"table","headings":[],"items":[]}},"uses-passive-event-listeners":{"id":"uses-passive-event-listeners","title":"Uses passive listeners to improve scrolling performance","description":"Consider marking your touch and wheel event listeners as `passive` to improve your page's scroll performance. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/passive-event-listeners).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"meta-description":{"id":"meta-description","title":"Document does not have a meta description","description":"Meta descriptions may be included in search results to concisely summarize page content. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/description).","score":0,"scoreDisplayMode":"binary","rawValue":false},"http-status-code":{"id":"http-status-code","title":"Page has successful HTTP status code","description":"Pages with unsuccessful HTTP status codes may not be indexed properly. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/successful-http-code).","score":1,"scoreDisplayMode":"binary","rawValue":true},"font-size":{"id":"font-size","title":"Document uses legible font sizes","description":"Font sizes less than 12px are too small to be legible and require mobile visitors to “pinch to zoom” in order to read. Strive to have >60% of page text ≥12px. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/font-sizes).","score":1,"scoreDisplayMode":"binary","rawValue":true,"displayValue":"100% legible text","details":{"type":"table","headings":[{"key":"source","itemType":"url","text":"Source"},{"key":"selector","itemType":"code","text":"Selector"},{"key":"coverage","itemType":"text","text":"% of Page Text"},{"key":"fontSize","itemType":"text","text":"Font Size"}],"items":[{"source":"Legible text","selector":"","coverage":"100.00%","fontSize":"≥ 12px"}]}},"link-text":{"id":"link-text","title":"Links have descriptive text","description":"Descriptive link text helps search engines understand your content. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/descriptive-link-text).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[],"summary":{}}},"is-crawlable":{"id":"is-crawlable","title":"Page isn’t blocked from indexing","description":"Search engines are unable to include your pages in search results if they don't have permission to crawl them. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/indexing).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"robots-txt":{"id":"robots-txt","title":"robots.txt is valid","description":"If your robots.txt file is malformed, crawlers may not be able to understand how you want your website to be crawled or indexed.","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"tap-targets":{"id":"tap-targets","title":"Tap targets are sized appropriately","description":"Interactive elements like buttons and links should be large enough (48x48px), and have enough space around them, to be easy enough to tap without overlapping onto other elements. [Learn more](https://developers.google.com/web/fundamentals/accessibility/accessible-styles#multi-device_responsive_design).","score":1,"scoreDisplayMode":"binary","rawValue":true,"displayValue":"100% appropriately sized tap targets","details":{"type":"table","headings":[],"items":[]}},"hreflang":{"id":"hreflang","title":"Document has a valid `hreflang`","description":"hreflang links tell search engines what version of a page they should list in search results for a given language or region. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/hreflang).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"plugins":{"id":"plugins","title":"Document avoids plugins","description":"Search engines can't index plugin content, and many devices restrict plugins or don't support them. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/plugins).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"canonical":{"id":"canonical","title":"Document has a valid `rel=canonical`","description":"Canonical links suggest which URL to show in search results. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/canonical).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"structured-data":{"id":"structured-data","title":"Structured data is valid","description":"Run the [Structured Data Testing Tool](https://search.google.com/structured-data/testing-tool/) and the [Structured Data Linter](http://linter.structured-data.org/) to validate structured data. [Learn more](https://developers.google.com/search/docs/guides/mark-up-content).","score":null,"scoreDisplayMode":"manual","rawValue":false}},"configSettings":{"output":["html"],"maxWaitForFcp":15000,"maxWaitForLoad":45000,"throttlingMethod":"simulate","throttling":{"rttMs":150,"throughputKbps":1638.4,"requestLatencyMs":562.5,"downloadThroughputKbps":1474.5600000000002,"uploadThroughputKbps":675,"cpuSlowdownMultiplier":4},"auditMode":false,"gatherMode":false,"disableStorageReset":false,"disableDeviceEmulation":false,"emulatedFormFactor":"mobile","channel":"cli","locale":"en-US","blockedUrlPatterns":null,"additionalTraceCategories":null,"extraHeaders":null,"precomputedLanternData":null,"onlyAudits":null,"onlyCategories":null,"skipAudits":null},"categories":{"performance":{"title":"Performance","auditRefs":[{"id":"first-contentful-paint","weight":3,"group":"metrics"},{"id":"first-meaningful-paint","weight":1,"group":"metrics"},{"id":"speed-index","weight":4,"group":"metrics"},{"id":"interactive","weight":5,"group":"metrics"},{"id":"first-cpu-idle","weight":2,"group":"metrics"},{"id":"estimated-input-latency","weight":0,"group":"metrics"},{"id":"max-potential-fid","weight":0},{"id":"render-blocking-resources","weight":0,"group":"load-opportunities"},{"id":"uses-responsive-images","weight":0,"group":"load-opportunities"},{"id":"offscreen-images","weight":0,"group":"load-opportunities"},{"id":"unminified-css","weight":0,"group":"load-opportunities"},{"id":"unminified-javascript","weight":0,"group":"load-opportunities"},{"id":"unused-css-rules","weight":0,"group":"load-opportunities"},{"id":"uses-optimized-images","weight":0,"group":"load-opportunities"},{"id":"uses-webp-images","weight":0,"group":"load-opportunities"},{"id":"uses-text-compression","weight":0,"group":"load-opportunities"},{"id":"uses-rel-preconnect","weight":0,"group":"load-opportunities"},{"id":"time-to-first-byte","weight":0,"group":"load-opportunities"},{"id":"redirects","weight":0,"group":"load-opportunities"},{"id":"uses-rel-preload","weight":0,"group":"load-opportunities"},{"id":"efficient-animated-content","weight":0,"group":"load-opportunities"},{"id":"total-byte-weight","weight":0,"group":"diagnostics"},{"id":"uses-long-cache-ttl","weight":0,"group":"diagnostics"},{"id":"dom-size","weight":0,"group":"diagnostics"},{"id":"critical-request-chains","weight":0,"group":"diagnostics"},{"id":"user-timings","weight":0,"group":"diagnostics"},{"id":"bootup-time","weight":0,"group":"diagnostics"},{"id":"mainthread-work-breakdown","weight":0,"group":"diagnostics"},{"id":"font-display","weight":0,"group":"diagnostics"},{"id":"network-requests","weight":0},{"id":"network-rtt","weight":0},{"id":"network-server-latency","weight":0},{"id":"main-thread-tasks","weight":0},{"id":"diagnostics","weight":0},{"id":"metrics","weight":0},{"id":"screenshot-thumbnails","weight":0},{"id":"final-screenshot","weight":0}],"id":"performance","score":1},"accessibility":{"title":"Accessibility","description":"These checks highlight opportunities to [improve the accessibility of your web app](https://developers.google.com/web/fundamentals/accessibility). Only a subset of accessibility issues can be automatically detected so manual testing is also encouraged.","manualDescription":"These items address areas which an automated testing tool cannot cover. Learn more in our guide on [conducting an accessibility review](https://developers.google.com/web/fundamentals/accessibility/how-to-review).","auditRefs":[{"id":"accesskeys","weight":0,"group":"a11y-navigation"},{"id":"aria-allowed-attr","weight":0,"group":"a11y-aria"},{"id":"aria-required-attr","weight":0,"group":"a11y-aria"},{"id":"aria-required-children","weight":0,"group":"a11y-aria"},{"id":"aria-required-parent","weight":0,"group":"a11y-aria"},{"id":"aria-roles","weight":0,"group":"a11y-aria"},{"id":"aria-valid-attr-value","weight":0,"group":"a11y-aria"},{"id":"aria-valid-attr","weight":0,"group":"a11y-aria"},{"id":"audio-caption","weight":0,"group":"a11y-audio-video"},{"id":"button-name","weight":0,"group":"a11y-names-labels"},{"id":"bypass","weight":10,"group":"a11y-navigation"},{"id":"color-contrast","weight":6,"group":"a11y-color-contrast"},{"id":"definition-list","weight":0,"group":"a11y-tables-lists"},{"id":"dlitem","weight":0,"group":"a11y-tables-lists"},{"id":"document-title","weight":2,"group":"a11y-names-labels"},{"id":"duplicate-id","weight":0,"group":"a11y-best-practices"},{"id":"frame-title","weight":0,"group":"a11y-names-labels"},{"id":"html-has-lang","weight":4,"group":"a11y-language"},{"id":"html-lang-valid","weight":0,"group":"a11y-language"},{"id":"image-alt","weight":0,"group":"a11y-names-labels"},{"id":"input-image-alt","weight":0,"group":"a11y-names-labels"},{"id":"label","weight":0,"group":"a11y-names-labels"},{"id":"layout-table","weight":0,"group":"a11y-tables-lists"},{"id":"link-name","weight":9,"group":"a11y-names-labels"},{"id":"list","weight":0,"group":"a11y-tables-lists"},{"id":"listitem","weight":0,"group":"a11y-tables-lists"},{"id":"meta-refresh","weight":0,"group":"a11y-best-practices"},{"id":"meta-viewport","weight":3,"group":"a11y-best-practices"},{"id":"object-alt","weight":0,"group":"a11y-names-labels"},{"id":"tabindex","weight":0,"group":"a11y-navigation"},{"id":"td-headers-attr","weight":0,"group":"a11y-tables-lists"},{"id":"th-has-data-cells","weight":0,"group":"a11y-tables-lists"},{"id":"valid-lang","weight":0,"group":"a11y-language"},{"id":"video-caption","weight":0,"group":"a11y-audio-video"},{"id":"video-description","weight":0,"group":"a11y-audio-video"},{"id":"logical-tab-order","weight":0},{"id":"focusable-controls","weight":0},{"id":"interactive-element-affordance","weight":0},{"id":"managed-focus","weight":0},{"id":"focus-traps","weight":0},{"id":"custom-controls-labels","weight":0},{"id":"custom-controls-roles","weight":0},{"id":"visual-order-follows-dom","weight":0},{"id":"offscreen-content-hidden","weight":0},{"id":"heading-levels","weight":0},{"id":"use-landmarks","weight":0}],"id":"accessibility","score":0.88},"best-practices":{"title":"Best Practices","auditRefs":[{"id":"appcache-manifest","weight":1},{"id":"is-on-https","weight":1},{"id":"uses-http2","weight":1},{"id":"uses-passive-event-listeners","weight":1},{"id":"no-document-write","weight":1},{"id":"external-anchors-use-rel-noopener","weight":1},{"id":"geolocation-on-start","weight":1},{"id":"doctype","weight":1},{"id":"no-vulnerable-libraries","weight":1},{"id":"js-libraries","weight":0},{"id":"notification-on-start","weight":1},{"id":"deprecations","weight":1},{"id":"password-inputs-can-be-pasted-into","weight":1},{"id":"errors-in-console","weight":1},{"id":"image-aspect-ratio","weight":1}],"id":"best-practices","score":0.93},"seo":{"title":"SEO","description":"These checks ensure that your page is optimized for search engine results ranking. There are additional factors Lighthouse does not check that may affect your search ranking. [Learn more](https://support.google.com/webmasters/answer/35769).","manualDescription":"Run these additional validators on your site to check additional SEO best practices.","auditRefs":[{"id":"viewport","weight":1,"group":"seo-mobile"},{"id":"document-title","weight":1,"group":"seo-content"},{"id":"meta-description","weight":1,"group":"seo-content"},{"id":"http-status-code","weight":1,"group":"seo-crawl"},{"id":"link-text","weight":1,"group":"seo-content"},{"id":"is-crawlable","weight":1,"group":"seo-crawl"},{"id":"robots-txt","weight":0,"group":"seo-crawl"},{"id":"hreflang","weight":1,"group":"seo-content"},{"id":"canonical","weight":0,"group":"seo-content"},{"id":"font-size","weight":1,"group":"seo-mobile"},{"id":"plugins","weight":1,"group":"seo-content"},{"id":"tap-targets","weight":1,"group":"seo-mobile"},{"id":"structured-data","weight":0}],"id":"seo","score":0.9},"pwa":{"title":"Progressive Web App","description":"These checks validate the aspects of a Progressive Web App. [Learn more](https://developers.google.com/web/progressive-web-apps/checklist).","manualDescription":"These checks are required by the baseline [PWA Checklist](https://developers.google.com/web/progressive-web-apps/checklist) but are not automatically checked by Lighthouse. They do not affect your score but it's important that you verify them manually.","auditRefs":[{"id":"load-fast-enough-for-pwa","weight":7,"group":"pwa-fast-reliable"},{"id":"works-offline","weight":5,"group":"pwa-fast-reliable"},{"id":"offline-start-url","weight":1,"group":"pwa-fast-reliable"},{"id":"is-on-https","weight":2,"group":"pwa-installable"},{"id":"service-worker","weight":1,"group":"pwa-installable"},{"id":"installable-manifest","weight":2,"group":"pwa-installable"},{"id":"redirects-http","weight":2,"group":"pwa-optimized"},{"id":"splash-screen","weight":1,"group":"pwa-optimized"},{"id":"themed-omnibox","weight":1,"group":"pwa-optimized"},{"id":"content-width","weight":1,"group":"pwa-optimized"},{"id":"viewport","weight":2,"group":"pwa-optimized"},{"id":"without-javascript","weight":1,"group":"pwa-optimized"},{"id":"pwa-cross-browser","weight":0},{"id":"pwa-page-transitions","weight":0},{"id":"pwa-each-page-has-url","weight":0}],"id":"pwa","score":0.5}},"categoryGroups":{"metrics":{"title":"Metrics"},"load-opportunities":{"title":"Opportunities","description":"These optimizations can speed up your page load."},"diagnostics":{"title":"Diagnostics","description":"More information about the performance of your application."},"pwa-fast-reliable":{"title":"Fast and reliable"},"pwa-installable":{"title":"Installable"},"pwa-optimized":{"title":"PWA Optimized"},"a11y-best-practices":{"title":"Best practices","description":"These items highlight common accessibility best practices."},"a11y-color-contrast":{"title":"Contrast","description":"These are opportunities to improve the legibility of your content."},"a11y-names-labels":{"title":"Names and labels","description":"These are opportunities to improve the semantics of the controls in your application. This may enhance the experience for users of assistive technology, like a screen reader."},"a11y-navigation":{"title":"Navigation","description":"These are opportunities to improve keyboard navigation in your application."},"a11y-aria":{"title":"ARIA","description":"These are opportunities to improve the usage of ARIA in your application which may enhance the experience for users of assistive technology, like a screen reader."},"a11y-language":{"title":"Internationalization and localization","description":"These are opportunities to improve the interpretation of your content by users in different locales."},"a11y-audio-video":{"title":"Audio and video","description":"These are opportunities to provide alternative content for audio and video. This may improve the experience for users with hearing or vision impairments."},"a11y-tables-lists":{"title":"Tables and lists","description":"These are opportunities to to improve the experience of reading tabular or list data using assistive technology, like a screen reader."},"seo-mobile":{"title":"Mobile Friendly","description":"Make sure your pages are mobile friendly so users don’t have to pinch or zoom in order to read the content pages. [Learn more](https://developers.google.com/search/mobile-sites/)."},"seo-content":{"title":"Content Best Practices","description":"Format your HTML in a way that enables crawlers to better understand your app’s content."},"seo-crawl":{"title":"Crawling and Indexing","description":"To appear in search results, crawlers need access to your app."}},"timing":{"entries":[{"startTime":1056.206941,"name":"lh:init:config","duration":132.40974600000004,"entryType":"measure"},{"startTime":1060.188143,"name":"lh:config:requireGatherers","duration":27.163725999999997,"entryType":"measure"},{"startTime":1087.636368,"name":"lh:config:requireAudits","duration":95.1408100000001,"entryType":"measure"},{"startTime":1188.981901,"name":"lh:runner:run","duration":3166.0307459999995,"entryType":"measure"},{"startTime":1189.934306,"name":"lh:init:connect","duration":218.91741899999988,"entryType":"measure"},{"startTime":1409.07989,"name":"lh:gather:getVersion","duration":20.684848999999986,"entryType":"measure"},{"startTime":1429.925676,"name":"lh:gather:loadBlank","duration":33.860635999999886,"entryType":"measure"},{"startTime":1464.029781,"name":"lh:gather:getBenchmarkIndex","duration":550.5768780000001,"entryType":"measure"},{"startTime":2014.729514,"name":"lh:gather:setupDriver","duration":17.946675999999798,"entryType":"measure"},{"startTime":2034.130994,"name":"lh:gather:beforePass","duration":3.5413719999999103,"entryType":"measure"},{"startTime":2035.396167,"name":"lh:gather:beforePass:Scripts","duration":0.09403299999985393,"entryType":"measure"},{"startTime":2035.513526,"name":"lh:gather:beforePass:CSSUsage","duration":0.023783000000094034,"entryType":"measure"},{"startTime":2035.549167,"name":"lh:gather:beforePass:ViewportDimensions","duration":0.019056000000091444,"entryType":"measure"},{"startTime":2035.580853,"name":"lh:gather:beforePass:RuntimeExceptions","duration":0.06225400000016634,"entryType":"measure"},{"startTime":2035.654924,"name":"lh:gather:beforePass:ChromeConsoleMessages","duration":1.1431210000000647,"entryType":"measure"},{"startTime":2036.819884,"name":"lh:gather:beforePass:Accessibility","duration":0.027732000000014523,"entryType":"measure"},{"startTime":2036.853129,"name":"lh:gather:beforePass:AnchorElements","duration":0.01576399999999012,"entryType":"measure"},{"startTime":2036.873318,"name":"lh:gather:beforePass:ImageElements","duration":0.012639000000035594,"entryType":"measure"},{"startTime":2036.890255,"name":"lh:gather:beforePass:LinkElements","duration":0.013071000000081767,"entryType":"measure"},{"startTime":2036.911056,"name":"lh:gather:beforePass:MetaElements","duration":0.014255000000048312,"entryType":"measure"},{"startTime":2036.92986,"name":"lh:gather:beforePass:AppCacheManifest","duration":0.011862000000064654,"entryType":"measure"},{"startTime":2036.945212,"name":"lh:gather:beforePass:Doctype","duration":0.015185999999857813,"entryType":"measure"},{"startTime":2036.964712,"name":"lh:gather:beforePass:DOMStats","duration":0.010567000000037297,"entryType":"measure"},{"startTime":2036.979135,"name":"lh:gather:beforePass:JSLibraries","duration":0.011019999999916763,"entryType":"measure"},{"startTime":2036.993549,"name":"lh:gather:beforePass:OptimizedImages","duration":0.010508999999956359,"entryType":"measure"},{"startTime":2037.007315,"name":"lh:gather:beforePass:PasswordInputsWithPreventedPaste","duration":0.011917999999923268,"entryType":"measure"},{"startTime":2037.022785,"name":"lh:gather:beforePass:ResponseCompression","duration":0.01054599999997663,"entryType":"measure"},{"startTime":2037.036673,"name":"lh:gather:beforePass:TagsBlockingFirstPaint","duration":0.5280499999998938,"entryType":"measure"},{"startTime":2037.573016,"name":"lh:gather:beforePass:FontSize","duration":0.018714000000045417,"entryType":"measure"},{"startTime":2037.596038,"name":"lh:gather:beforePass:Hreflang","duration":0.015159000000039669,"entryType":"measure"},{"startTime":2037.6151,"name":"lh:gather:beforePass:EmbeddedContent","duration":0.010600000000067666,"entryType":"measure"},{"startTime":2037.62957,"name":"lh:gather:beforePass:Canonical","duration":0.014281999999866457,"entryType":"measure"},{"startTime":2037.647431,"name":"lh:gather:beforePass:RobotsTxt","duration":0.009140999999999622,"entryType":"measure"},{"startTime":2037.660111,"name":"lh:gather:beforePass:TapTargets","duration":0.0087780000001203,"entryType":"measure"},{"startTime":2037.936723,"name":"lh:gather:loadPage-defaultPass","duration":1351.019434,"entryType":"measure"},{"startTime":2061.664915,"name":"lh:gather:getVersion","duration":0.4479180000002998,"entryType":"measure"},{"startTime":3388.977123,"name":"lh:gather:pass","duration":1.9717860000000655,"entryType":"measure"},{"startTime":3392.331185,"name":"lh:gather:getTrace","duration":17.46511099999998,"entryType":"measure"},{"startTime":3409.815225,"name":"lh:gather:getDevtoolsLog","duration":0.7159630000001016,"entryType":"measure"},{"startTime":3412.034082,"name":"lh:gather:afterPass","duration":157.56331999999975,"entryType":"measure"},{"startTime":3412.061755,"name":"lh:gather:afterPass:Scripts","duration":6.3381249999997635,"entryType":"measure"},{"startTime":3418.423652,"name":"lh:gather:afterPass:CSSUsage","duration":10.932189000000108,"entryType":"measure"},{"startTime":3429.371846,"name":"lh:gather:afterPass:ViewportDimensions","duration":1.1902829999999085,"entryType":"measure"},{"startTime":3430.581299,"name":"lh:gather:afterPass:RuntimeExceptions","duration":0.1340770000001612,"entryType":"measure"},{"startTime":3430.732918,"name":"lh:gather:afterPass:ChromeConsoleMessages","duration":0.9669629999998506,"entryType":"measure"},{"startTime":3431.721474,"name":"lh:gather:afterPass:Accessibility","duration":55.64833200000021,"entryType":"measure"},{"startTime":3487.381783,"name":"lh:gather:afterPass:AnchorElements","duration":2.532951000000139,"entryType":"measure"},{"startTime":3489.924726,"name":"lh:gather:afterPass:ImageElements","duration":2.0314959999996063,"entryType":"measure"},{"startTime":3491.964206,"name":"lh:gather:afterPass:LinkElements","duration":1.1312060000000201,"entryType":"measure"},{"startTime":3493.103928,"name":"lh:gather:afterPass:MetaElements","duration":1.2073260000001937,"entryType":"measure"},{"startTime":3494.319014,"name":"lh:gather:afterPass:AppCacheManifest","duration":1.959660999999869,"entryType":"measure"},{"startTime":3496.286783,"name":"lh:gather:afterPass:Doctype","duration":0.9994069999997919,"entryType":"measure"},{"startTime":3497.29422,"name":"lh:gather:afterPass:DOMStats","duration":3.5819119999996474,"entryType":"measure"},{"startTime":3500.885754,"name":"lh:gather:afterPass:JSLibraries","duration":6.604502000000139,"entryType":"measure"},{"startTime":3507.508666,"name":"lh:gather:afterPass:OptimizedImages","duration":0.5750769999999648,"entryType":"measure"},{"startTime":3508.104197,"name":"lh:gather:afterPass:PasswordInputsWithPreventedPaste","duration":1.8033839999998236,"entryType":"measure"},{"startTime":3509.92496,"name":"lh:gather:afterPass:ResponseCompression","duration":0.40296600000010585,"entryType":"measure"},{"startTime":3510.335835,"name":"lh:gather:afterPass:TagsBlockingFirstPaint","duration":1.716675000000123,"entryType":"measure"},{"startTime":3512.062621,"name":"lh:gather:afterPass:FontSize","duration":6.865017999999964,"entryType":"measure"},{"startTime":3518.969225,"name":"lh:gather:afterPass:Hreflang","duration":1.3930970000001253,"entryType":"measure"},{"startTime":3520.370527,"name":"lh:gather:afterPass:EmbeddedContent","duration":1.1613889999998719,"entryType":"measure"},{"startTime":3521.540597,"name":"lh:gather:afterPass:Canonical","duration":1.1430999999997766,"entryType":"measure"},{"startTime":3522.69175,"name":"lh:gather:afterPass:RobotsTxt","duration":42.99173800000017,"entryType":"measure"},{"startTime":3565.697624,"name":"lh:gather:afterPass:TapTargets","duration":3.880764999999883,"entryType":"measure"},{"startTime":3570.462635,"name":"lh:gather:loadBlank","duration":13.238529000000199,"entryType":"measure"},{"startTime":3583.727115,"name":"lh:gather:beforePass","duration":5.409768999999869,"entryType":"measure"},{"startTime":3585.619338,"name":"lh:gather:beforePass:ServiceWorker","duration":2.285641999999825,"entryType":"measure"},{"startTime":3587.924892,"name":"lh:gather:beforePass:Offline","duration":1.1588999999999032,"entryType":"measure"},{"startTime":3589.104908,"name":"lh:gather:beforePass:StartUrl","duration":0.020165000000361033,"entryType":"measure"},{"startTime":3589.184499,"name":"lh:gather:loadPage-offlinePass","duration":16.966026000000056,"entryType":"measure"},{"startTime":3606.165017,"name":"lh:gather:pass","duration":0.19472300000006726,"entryType":"measure"},{"startTime":3606.373308,"name":"lh:gather:getDevtoolsLog","duration":0.16330599999992046,"entryType":"measure"},{"startTime":3607.098408,"name":"lh:gather:afterPass","duration":1.0212970000002315,"entryType":"measure"},{"startTime":3607.108946,"name":"lh:gather:afterPass:ServiceWorker","duration":0.07507699999996476,"entryType":"measure"},{"startTime":3607.195332,"name":"lh:gather:afterPass:Offline","duration":0.7335660000003372,"entryType":"measure"},{"startTime":3607.936001,"name":"lh:gather:afterPass:StartUrl","duration":0.17452599999978702,"entryType":"measure"},{"startTime":3608.646213,"name":"lh:gather:loadBlank","duration":14.699876000000131,"entryType":"measure"},{"startTime":3623.360606,"name":"lh:gather:beforePass","duration":1.4153489999998783,"entryType":"measure"},{"startTime":3624.595071,"name":"lh:gather:beforePass:HTTPRedirect","duration":0.11696499999970911,"entryType":"measure"},{"startTime":3624.7219,"name":"lh:gather:beforePass:HTMLWithoutJavaScript","duration":0.04791299999988041,"entryType":"measure"},{"startTime":3624.805193,"name":"lh:gather:loadPage-redirectPass","duration":392.01456899999994,"entryType":"measure"},{"startTime":4016.830837,"name":"lh:gather:pass","duration":0.16071800000008807,"entryType":"measure"},{"startTime":4017.007387,"name":"lh:gather:getDevtoolsLog","duration":0.15511999999989712,"entryType":"measure"},{"startTime":4017.831165,"name":"lh:gather:afterPass","duration":5.618677999999818,"entryType":"measure"},{"startTime":4017.840678,"name":"lh:gather:afterPass:HTTPRedirect","duration":4.161672000000181,"entryType":"measure"},{"startTime":4022.013305,"name":"lh:gather:afterPass:HTMLWithoutJavaScript","duration":1.4270999999998821,"entryType":"measure"},{"startTime":4026.171149,"name":"lh:gather:disconnect","duration":1.9958110000002307,"entryType":"measure"},{"startTime":4028.834267,"name":"lh:runner:auditing","duration":325.50575000000026,"entryType":"measure"},{"startTime":4029.950495,"name":"lh:audit:is-on-https","duration":1.4834310000001096,"entryType":"measure"},{"startTime":4030.424455,"name":"lh:computed:NetworkRecords","duration":0.49371800000017174,"entryType":"measure"},{"startTime":4031.469205,"name":"lh:audit:redirects-http","duration":0.21661600000015824,"entryType":"measure"},{"startTime":4031.711854,"name":"lh:audit:service-worker","duration":0.24179199999980483,"entryType":"measure"},{"startTime":4031.971949,"name":"lh:audit:works-offline","duration":0.2525679999998829,"entryType":"measure"},{"startTime":4032.260798,"name":"lh:audit:viewport","duration":0.9137580000001435,"entryType":"measure"},{"startTime":4032.52747,"name":"lh:computed:ViewportMeta","duration":0.5992070000002059,"entryType":"measure"},{"startTime":4033.196711,"name":"lh:audit:without-javascript","duration":0.2573469999997542,"entryType":"measure"},{"startTime":4038.411141,"name":"lh:audit:first-contentful-paint","duration":16.813072999999804,"entryType":"measure"},{"startTime":4038.775554,"name":"lh:computed:FirstContentfulPaint","duration":16.100650000000314,"entryType":"measure"},{"startTime":4038.951107,"name":"lh:computed:TraceOfTab","duration":7.650544000000082,"entryType":"measure"},{"startTime":4046.724998,"name":"lh:computed:LanternFirstContentfulPaint","duration":8.13935999999967,"entryType":"measure"},{"startTime":4046.941486,"name":"lh:computed:PageDependencyGraph","duration":1.513140999999905,"entryType":"measure"},{"startTime":4048.499972,"name":"lh:computed:LoadSimulator","duration":2.664248999999927,"entryType":"measure"},{"startTime":4048.639045,"name":"lh:computed:NetworkAnalysis","duration":2.27843299999995,"entryType":"measure"},{"startTime":4055.47647,"name":"lh:audit:first-meaningful-paint","duration":1.527925999999752,"entryType":"measure"},{"startTime":4055.696072,"name":"lh:computed:FirstMeaningfulPaint","duration":1.1543659999997544,"entryType":"measure"},{"startTime":4055.766945,"name":"lh:computed:LanternFirstMeaningfulPaint","duration":1.0741870000001654,"entryType":"measure"},{"startTime":4057.169536,"name":"lh:audit:load-fast-enough-for-pwa","duration":1.63986100000011,"entryType":"measure"},{"startTime":4057.416348,"name":"lh:computed:Interactive","duration":1.2305469999996603,"entryType":"measure"},{"startTime":4057.474964,"name":"lh:computed:LanternInteractive","duration":1.1597929999998087,"entryType":"measure"},{"startTime":4058.939774,"name":"lh:audit:speed-index","duration":150.53949899999998,"entryType":"measure"},{"startTime":4059.119719,"name":"lh:computed:SpeedIndex","duration":150.250681,"entryType":"measure"},{"startTime":4059.176733,"name":"lh:computed:LanternSpeedIndex","duration":150.18541500000038,"entryType":"measure"},{"startTime":4059.240299,"name":"lh:computed:Speedline","duration":149.30063700000028,"entryType":"measure"},{"startTime":4209.493865,"name":"lh:audit:screenshot-thumbnails","duration":48.014978999999585,"entryType":"measure"},{"startTime":4257.523446,"name":"lh:audit:final-screenshot","duration":0.4586589999998978,"entryType":"measure"},{"startTime":4257.707106,"name":"lh:computed:Screenshots","duration":0.21587199999976292,"entryType":"measure"},{"startTime":4258.220473,"name":"lh:audit:estimated-input-latency","duration":1.6045859999994718,"entryType":"measure"},{"startTime":4258.378864,"name":"lh:computed:EstimatedInputLatency","duration":1.356130000000121,"entryType":"measure"},{"startTime":4258.432066,"name":"lh:computed:LanternEstimatedInputLatency","duration":1.2948019999994358,"entryType":"measure"},{"startTime":4259.919973,"name":"lh:audit:max-potential-fid","duration":1.509849000000031,"entryType":"measure"},{"startTime":4260.120538,"name":"lh:computed:MaxPotentialFID","duration":1.0968059999995603,"entryType":"measure"},{"startTime":4260.169767,"name":"lh:computed:LanternMaxPotentialFID","duration":1.0399509999997463,"entryType":"measure"},{"startTime":4261.444495,"name":"lh:audit:errors-in-console","duration":0.21807300000000396,"entryType":"measure"},{"startTime":4261.785983,"name":"lh:audit:time-to-first-byte","duration":0.6102170000003753,"entryType":"measure"},{"startTime":4262.094964,"name":"lh:computed:MainResource","duration":0.1476940000002287,"entryType":"measure"},{"startTime":4262.617624,"name":"lh:audit:first-cpu-idle","duration":1.4377809999996316,"entryType":"measure"},{"startTime":4262.771947,"name":"lh:computed:FirstCPUIdle","duration":1.1859230000000025,"entryType":"measure"},{"startTime":4262.818597,"name":"lh:computed:LanternFirstCPUIdle","duration":1.1315139999996973,"entryType":"measure"},{"startTime":4264.249163,"name":"lh:audit:interactive","duration":0.32103599999936705,"entryType":"measure"},{"startTime":4264.733905,"name":"lh:audit:user-timings","duration":0.635298000000148,"entryType":"measure"},{"startTime":4264.882573,"name":"lh:computed:UserTimings","duration":0.19871800000055373,"entryType":"measure"},{"startTime":4265.471945,"name":"lh:audit:critical-request-chains","duration":1.186808999999812,"entryType":"measure"},{"startTime":4265.623084,"name":"lh:computed:CriticalRequestChains","duration":0.399822000000313,"entryType":"measure"},{"startTime":4266.756839,"name":"lh:audit:redirects","duration":0.6331540000001041,"entryType":"measure"},{"startTime":4267.400013,"name":"lh:audit:installable-manifest","duration":0.40246599999954924,"entryType":"measure"},{"startTime":4267.545799,"name":"lh:computed:ManifestValues","duration":0.07891899999958696,"entryType":"measure"},{"startTime":4267.812733,"name":"lh:audit:splash-screen","duration":0.2780849999999191,"entryType":"measure"},{"startTime":4268.10027,"name":"lh:audit:themed-omnibox","duration":0.22641900000053283,"entryType":"measure"},{"startTime":4268.33507,"name":"lh:audit:content-width","duration":0.1224659999998039,"entryType":"measure"},{"startTime":4268.466341,"name":"lh:audit:image-aspect-ratio","duration":0.20310199999948964,"entryType":"measure"},{"startTime":4268.679369,"name":"lh:audit:deprecations","duration":0.20420500000000175,"entryType":"measure"},{"startTime":4269.092456,"name":"lh:audit:mainthread-work-breakdown","duration":3.1359849999998914,"entryType":"measure"},{"startTime":4269.303011,"name":"lh:computed:MainThreadTasks","duration":2.0678900000002614,"entryType":"measure"},{"startTime":4272.445355,"name":"lh:audit:bootup-time","duration":1.1054119999998875,"entryType":"measure"},{"startTime":4273.760874,"name":"lh:audit:uses-rel-preload","duration":1.4916590000002543,"entryType":"measure"},{"startTime":4274.121855,"name":"lh:computed:LoadSimulator","duration":0.08449799999925744,"entryType":"measure"},{"startTime":4275.393238,"name":"lh:audit:uses-rel-preconnect","duration":0.6929820000004838,"entryType":"measure"},{"startTime":4276.222264,"name":"lh:audit:font-display","duration":0.7171989999997095,"entryType":"measure"},{"startTime":4276.952182,"name":"lh:audit:diagnostics","duration":0.5607389999995576,"entryType":"measure"},{"startTime":4277.52259,"name":"lh:audit:network-requests","duration":0.4018480000004274,"entryType":"measure"},{"startTime":4278.147945,"name":"lh:audit:network-rtt","duration":0.3558160000002317,"entryType":"measure"},{"startTime":4278.704868,"name":"lh:audit:network-server-latency","duration":0.33750400000008085,"entryType":"measure"},{"startTime":4279.052138,"name":"lh:audit:main-thread-tasks","duration":0.3211030000002211,"entryType":"measure"},{"startTime":4279.382496,"name":"lh:audit:metrics","duration":0.7895360000002256,"entryType":"measure"},{"startTime":4280.181863,"name":"lh:audit:offline-start-url","duration":0.13603800000055344,"entryType":"measure"},{"startTime":4280.340076,"name":"lh:audit:pwa-cross-browser","duration":0.08875699999953213,"entryType":"measure"},{"startTime":4280.44355,"name":"lh:audit:pwa-page-transitions","duration":0.05603400000018155,"entryType":"measure"},{"startTime":4280.512482,"name":"lh:audit:pwa-each-page-has-url","duration":0.08258300000034069,"entryType":"measure"},{"startTime":4280.709703,"name":"lh:audit:accesskeys","duration":0.29359699999986333,"entryType":"measure"},{"startTime":4281.112633,"name":"lh:audit:aria-allowed-attr","duration":0.19150200000058248,"entryType":"measure"},{"startTime":4281.435216,"name":"lh:audit:aria-required-attr","duration":0.2090909999997166,"entryType":"measure"},{"startTime":4281.79092,"name":"lh:audit:aria-required-children","duration":2.596639999999752,"entryType":"measure"},{"startTime":4284.621589,"name":"lh:audit:aria-required-parent","duration":0.33083499999975174,"entryType":"measure"},{"startTime":4285.140538,"name":"lh:audit:aria-roles","duration":0.3493379999999888,"entryType":"measure"},{"startTime":4285.699555,"name":"lh:audit:aria-valid-attr-value","duration":10.120883999999933,"entryType":"measure"},{"startTime":4295.975007,"name":"lh:audit:aria-valid-attr","duration":0.4653090000001612,"entryType":"measure"},{"startTime":4296.64517,"name":"lh:audit:audio-caption","duration":0.36188899999979185,"entryType":"measure"},{"startTime":4297.220427,"name":"lh:audit:button-name","duration":0.49331699999947887,"entryType":"measure"},{"startTime":4297.961773,"name":"lh:audit:bypass","duration":1.0943029999998544,"entryType":"measure"},{"startTime":4299.327239,"name":"lh:audit:color-contrast","duration":0.800108999999793,"entryType":"measure"},{"startTime":4300.279466,"name":"lh:audit:definition-list","duration":0.3754980000003343,"entryType":"measure"},{"startTime":4300.81633,"name":"lh:audit:dlitem","duration":0.36997599999995145,"entryType":"measure"},{"startTime":4301.338703,"name":"lh:audit:document-title","duration":0.7588099999993574,"entryType":"measure"},{"startTime":4302.255732,"name":"lh:audit:duplicate-id","duration":0.4854040000000168,"entryType":"measure"},{"startTime":4302.849136,"name":"lh:audit:frame-title","duration":0.8284210000001622,"entryType":"measure"},{"startTime":4303.789405,"name":"lh:audit:html-has-lang","duration":0.9099719999994704,"entryType":"measure"},{"startTime":4304.881812,"name":"lh:audit:html-lang-valid","duration":0.5786700000007841,"entryType":"measure"},{"startTime":4305.568006,"name":"lh:audit:image-alt","duration":0.4977869999993345,"entryType":"measure"},{"startTime":4306.236945,"name":"lh:audit:input-image-alt","duration":0.5814640000007785,"entryType":"measure"},{"startTime":4306.935333,"name":"lh:audit:label","duration":0.591150999999627,"entryType":"measure"},{"startTime":4307.664942,"name":"lh:audit:layout-table","duration":0.5916979999992691,"entryType":"measure"},{"startTime":4308.355362,"name":"lh:audit:link-name","duration":0.7878599999994549,"entryType":"measure"},{"startTime":4309.280601,"name":"lh:audit:list","duration":0.6073059999998804,"entryType":"measure"},{"startTime":4310.069081,"name":"lh:audit:listitem","duration":0.5579880000004778,"entryType":"measure"},{"startTime":4310.794153,"name":"lh:audit:meta-refresh","duration":0.5709530000003724,"entryType":"measure"},{"startTime":4311.57922,"name":"lh:audit:meta-viewport","duration":0.792634000000362,"entryType":"measure"},{"startTime":4312.470489,"name":"lh:audit:object-alt","duration":0.6495269999995799,"entryType":"measure"},{"startTime":4313.285373,"name":"lh:audit:tabindex","duration":0.6471879999999146,"entryType":"measure"},{"startTime":4314.144289,"name":"lh:audit:td-headers-attr","duration":0.6734969999997702,"entryType":"measure"},{"startTime":4314.96128,"name":"lh:audit:th-has-data-cells","duration":0.7546859999993103,"entryType":"measure"},{"startTime":4315.818806,"name":"lh:audit:valid-lang","duration":0.6901019999995697,"entryType":"measure"},{"startTime":4316.695608,"name":"lh:audit:video-caption","duration":0.7203980000003867,"entryType":"measure"},{"startTime":4317.59241,"name":"lh:audit:video-description","duration":0.7032460000000356,"entryType":"measure"},{"startTime":4318.365672,"name":"lh:audit:custom-controls-labels","duration":0.055508000000372704,"entryType":"measure"},{"startTime":4318.431362,"name":"lh:audit:custom-controls-roles","duration":0.04740299999957642,"entryType":"measure"},{"startTime":4318.488227,"name":"lh:audit:focus-traps","duration":0.04675800000040908,"entryType":"measure"},{"startTime":4318.545079,"name":"lh:audit:focusable-controls","duration":0.04382499999974243,"entryType":"measure"},{"startTime":4318.598332,"name":"lh:audit:heading-levels","duration":0.04421600000023318,"entryType":"measure"},{"startTime":4318.651497,"name":"lh:audit:interactive-element-affordance","duration":0.04396900000028836,"entryType":"measure"},{"startTime":4318.704614,"name":"lh:audit:logical-tab-order","duration":0.10347099999944476,"entryType":"measure"},{"startTime":4318.817681,"name":"lh:audit:managed-focus","duration":0.04552299999977549,"entryType":"measure"},{"startTime":4318.872293,"name":"lh:audit:offscreen-content-hidden","duration":0.042872999999417516,"entryType":"measure"},{"startTime":4318.924149,"name":"lh:audit:use-landmarks","duration":0.04478299999937008,"entryType":"measure"},{"startTime":4318.978255,"name":"lh:audit:visual-order-follows-dom","duration":0.0524729999997362,"entryType":"measure"},{"startTime":4319.172347,"name":"lh:audit:uses-long-cache-ttl","duration":0.8448470000002999,"entryType":"measure"},{"startTime":4320.122378,"name":"lh:audit:total-byte-weight","duration":0.6425980000003619,"entryType":"measure"},{"startTime":4320.940953,"name":"lh:audit:offscreen-images","duration":1.5507309999993595,"entryType":"measure"},{"startTime":4322.586321,"name":"lh:audit:render-blocking-resources","duration":2.1621750000003885,"entryType":"measure"},{"startTime":4324.154536,"name":"lh:computed:FirstContentfulPaint","duration":0.34410899999966205,"entryType":"measure"},{"startTime":4324.201721,"name":"lh:computed:LanternFirstContentfulPaint","duration":0.2899619999998322,"entryType":"measure"},{"startTime":4324.84135,"name":"lh:audit:unminified-css","duration":1.0719460000000254,"entryType":"measure"},{"startTime":4326.065809,"name":"lh:audit:unminified-javascript","duration":0.6826399999999921,"entryType":"measure"},{"startTime":4326.897669,"name":"lh:audit:unused-css-rules","duration":0.5679239999999481,"entryType":"measure"},{"startTime":4327.560603,"name":"lh:audit:uses-webp-images","duration":0.8263740000002144,"entryType":"measure"},{"startTime":4328.474948,"name":"lh:audit:uses-optimized-images","duration":0.6869889999998122,"entryType":"measure"},{"startTime":4329.258693,"name":"lh:audit:uses-text-compression","duration":0.6397900000001755,"entryType":"measure"},{"startTime":4329.985489,"name":"lh:audit:uses-responsive-images","duration":0.8258920000007492,"entryType":"measure"},{"startTime":4331.240768,"name":"lh:audit:efficient-animated-content","duration":0.9659160000001066,"entryType":"measure"},{"startTime":4332.217455,"name":"lh:audit:appcache-manifest","duration":0.11442600000009406,"entryType":"measure"},{"startTime":4332.343184,"name":"lh:audit:doctype","duration":0.11715300000014395,"entryType":"measure"},{"startTime":4332.784309,"name":"lh:audit:dom-size","duration":3.1904520000007324,"entryType":"measure"},{"startTime":4335.993601,"name":"lh:audit:external-anchors-use-rel-noopener","duration":0.3274830000000293,"entryType":"measure"},{"startTime":4336.333729,"name":"lh:audit:geolocation-on-start","duration":0.2480310000000827,"entryType":"measure"},{"startTime":4336.602939,"name":"lh:audit:no-document-write","duration":0.18243600000005245,"entryType":"measure"},{"startTime":4336.807037,"name":"lh:audit:no-vulnerable-libraries","duration":0.2577450000007957,"entryType":"measure"},{"startTime":4337.090568,"name":"lh:audit:js-libraries","duration":0.2616100000004735,"entryType":"measure"},{"startTime":4337.380231,"name":"lh:audit:notification-on-start","duration":0.24546899999950256,"entryType":"measure"},{"startTime":4337.651028,"name":"lh:audit:password-inputs-can-be-pasted-into","duration":0.2528839999995398,"entryType":"measure"},{"startTime":4337.935337,"name":"lh:audit:uses-http2","duration":0.5763850000003004,"entryType":"measure"},{"startTime":4338.538173,"name":"lh:audit:uses-passive-event-listeners","duration":0.23502800000005664,"entryType":"measure"},{"startTime":4339.030962,"name":"lh:audit:meta-description","duration":0.4696800000001531,"entryType":"measure"},{"startTime":4339.682229,"name":"lh:audit:http-status-code","duration":0.3090060000004087,"entryType":"measure"},{"startTime":4340.09641,"name":"lh:audit:font-size","duration":0.46573199999966164,"entryType":"measure"},{"startTime":4340.660696,"name":"lh:audit:link-text","duration":0.38511800000014773,"entryType":"measure"},{"startTime":4341.206479,"name":"lh:audit:is-crawlable","duration":0.39146399999935966,"entryType":"measure"},{"startTime":4341.696902,"name":"lh:audit:robots-txt","duration":0.22613600000022416,"entryType":"measure"},{"startTime":4342.023854,"name":"lh:audit:tap-targets","duration":0.9599099999995815,"entryType":"measure"},{"startTime":4343.090194,"name":"lh:audit:hreflang","duration":0.3212009999997463,"entryType":"measure"},{"startTime":4343.499941,"name":"lh:audit:plugins","duration":10.027756000000409,"entryType":"measure"},{"startTime":4353.638191,"name":"lh:audit:canonical","duration":0.47599300000001676,"entryType":"measure"},{"startTime":4354.217424,"name":"lh:audit:structured-data","duration":0.11356999999952677,"entryType":"measure"},{"startTime":4354.346933,"name":"lh:runner:generate","duration":0.6592220000002271,"entryType":"measure"}],"total":3166.0307459999995},"i18n":{"rendererFormattedStrings":{"auditGroupExpandTooltip":"Show audits","crcInitialNavigation":"Initial Navigation","crcLongestDurationLabel":"Maximum critical path latency:","errorLabel":"Error!","errorMissingAuditInfo":"Report error: no audit information","labDataTitle":"Lab Data","lsPerformanceCategoryDescription":"[Lighthouse](https://developers.google.com/web/tools/lighthouse/) analysis of the current page on an emulated mobile network. Values are estimated and may vary.","manualAuditsGroupTitle":"Additional items to manually check","notApplicableAuditsGroupTitle":"Not applicable","opportunityResourceColumnLabel":"Opportunity","opportunitySavingsColumnLabel":"Estimated Savings","passedAuditsGroupTitle":"Passed audits","scorescaleLabel":"Score scale:","snippetCollapseButtonLabel":"Collapse snippet","snippetExpandButtonLabel":"Expand snippet","toplevelWarningsMessage":"There were issues affecting this run of Lighthouse:","varianceDisclaimer":"Values are estimated and may vary.","warningAuditsGroupTitle":"Passed audits but with warnings","warningHeader":"Warnings: "},"icuMessagePaths":{"lighthouse-core/audits/metrics/first-contentful-paint.js | title":["audits[first-contentful-paint].title"],"lighthouse-core/audits/metrics/first-contentful-paint.js | description":["audits[first-contentful-paint].description"],"lighthouse-core/lib/i18n/i18n.js | seconds":[{"values":{"timeInMs":780},"path":"audits[first-contentful-paint].displayValue"},{"values":{"timeInMs":850.5},"path":"audits[first-meaningful-paint].displayValue"},{"values":{"timeInMs":780},"path":"audits[speed-index].displayValue"},{"values":{"timeInMs":921},"path":"audits[first-cpu-idle].displayValue"},{"values":{"timeInMs":921},"path":"audits.interactive.displayValue"},{"values":{"timeInMs":361.536},"path":"audits[mainthread-work-breakdown].displayValue"},{"values":{"timeInMs":13.104000000000003},"path":"audits[bootup-time].displayValue"}],"lighthouse-core/audits/metrics/first-meaningful-paint.js | title":["audits[first-meaningful-paint].title"],"lighthouse-core/audits/metrics/first-meaningful-paint.js | description":["audits[first-meaningful-paint].description"],"lighthouse-core/audits/load-fast-enough-for-pwa.js | title":["audits[load-fast-enough-for-pwa].title"],"lighthouse-core/audits/load-fast-enough-for-pwa.js | description":["audits[load-fast-enough-for-pwa].description"],"lighthouse-core/audits/metrics/speed-index.js | title":["audits[speed-index].title"],"lighthouse-core/audits/metrics/speed-index.js | description":["audits[speed-index].description"],"lighthouse-core/audits/metrics/estimated-input-latency.js | title":["audits[estimated-input-latency].title"],"lighthouse-core/audits/metrics/estimated-input-latency.js | description":["audits[estimated-input-latency].description"],"lighthouse-core/lib/i18n/i18n.js | ms":[{"values":{"timeInMs":12.8},"path":"audits[estimated-input-latency].displayValue"},{"values":{"timeInMs":141},"path":"audits[max-potential-fid].displayValue"},{"values":{"timeInMs":20.631},"path":"audits[network-rtt].displayValue"},{"values":{"timeInMs":0},"path":"audits[network-server-latency].displayValue"}],"lighthouse-core/audits/metrics/max-potential-fid.js | title":["audits[max-potential-fid].title"],"lighthouse-core/audits/metrics/max-potential-fid.js | description":["audits[max-potential-fid].description"],"lighthouse-core/audits/time-to-first-byte.js | title":["audits[time-to-first-byte].title"],"lighthouse-core/audits/time-to-first-byte.js | description":["audits[time-to-first-byte].description"],"lighthouse-core/audits/time-to-first-byte.js | displayValue":[{"values":{"timeInMs":24.980999999999995},"path":"audits[time-to-first-byte].displayValue"}],"lighthouse-core/audits/metrics/first-cpu-idle.js | title":["audits[first-cpu-idle].title"],"lighthouse-core/audits/metrics/first-cpu-idle.js | description":["audits[first-cpu-idle].description"],"lighthouse-core/audits/metrics/interactive.js | title":["audits.interactive.title"],"lighthouse-core/audits/metrics/interactive.js | description":["audits.interactive.description"],"lighthouse-core/audits/user-timings.js | title":["audits[user-timings].title"],"lighthouse-core/audits/user-timings.js | description":["audits[user-timings].description"],"lighthouse-core/audits/critical-request-chains.js | title":["audits[critical-request-chains].title"],"lighthouse-core/audits/critical-request-chains.js | description":["audits[critical-request-chains].description"],"lighthouse-core/audits/redirects.js | title":["audits.redirects.title"],"lighthouse-core/audits/redirects.js | description":["audits.redirects.description"],"lighthouse-core/audits/mainthread-work-breakdown.js | title":["audits[mainthread-work-breakdown].title"],"lighthouse-core/audits/mainthread-work-breakdown.js | description":["audits[mainthread-work-breakdown].description"],"lighthouse-core/audits/mainthread-work-breakdown.js | columnCategory":["audits[mainthread-work-breakdown].details.headings[0].text"],"lighthouse-core/lib/i18n/i18n.js | columnTimeSpent":["audits[mainthread-work-breakdown].details.headings[1].text","audits[network-rtt].details.headings[1].text","audits[network-server-latency].details.headings[1].text"],"lighthouse-core/audits/bootup-time.js | title":["audits[bootup-time].title"],"lighthouse-core/audits/bootup-time.js | description":["audits[bootup-time].description"],"lighthouse-core/lib/i18n/i18n.js | columnURL":["audits[bootup-time].details.headings[0].text","audits[network-rtt].details.headings[0].text","audits[network-server-latency].details.headings[0].text","audits[total-byte-weight].details.headings[0].text"],"lighthouse-core/audits/bootup-time.js | columnTotal":["audits[bootup-time].details.headings[1].text"],"lighthouse-core/audits/bootup-time.js | columnScriptEval":["audits[bootup-time].details.headings[2].text"],"lighthouse-core/audits/bootup-time.js | columnScriptParse":["audits[bootup-time].details.headings[3].text"],"lighthouse-core/audits/uses-rel-preload.js | title":["audits[uses-rel-preload].title"],"lighthouse-core/audits/uses-rel-preload.js | description":["audits[uses-rel-preload].description"],"lighthouse-core/audits/uses-rel-preconnect.js | title":["audits[uses-rel-preconnect].title"],"lighthouse-core/audits/uses-rel-preconnect.js | description":["audits[uses-rel-preconnect].description"],"lighthouse-core/audits/font-display.js | title":["audits[font-display].title"],"lighthouse-core/audits/font-display.js | description":["audits[font-display].description"],"lighthouse-core/audits/network-rtt.js | title":["audits[network-rtt].title"],"lighthouse-core/audits/network-rtt.js | description":["audits[network-rtt].description"],"lighthouse-core/audits/network-server-latency.js | title":["audits[network-server-latency].title"],"lighthouse-core/audits/network-server-latency.js | description":["audits[network-server-latency].description"],"lighthouse-core/audits/accessibility/accesskeys.js | title":["audits.accesskeys.title"],"lighthouse-core/audits/accessibility/accesskeys.js | description":["audits.accesskeys.description"],"lighthouse-core/audits/accessibility/aria-allowed-attr.js | title":["audits[aria-allowed-attr].title"],"lighthouse-core/audits/accessibility/aria-allowed-attr.js | description":["audits[aria-allowed-attr].description"],"lighthouse-core/audits/accessibility/aria-required-attr.js | title":["audits[aria-required-attr].title"],"lighthouse-core/audits/accessibility/aria-required-attr.js | description":["audits[aria-required-attr].description"],"lighthouse-core/audits/accessibility/aria-required-children.js | title":["audits[aria-required-children].title"],"lighthouse-core/audits/accessibility/aria-required-children.js | description":["audits[aria-required-children].description"],"lighthouse-core/audits/accessibility/aria-required-parent.js | title":["audits[aria-required-parent].title"],"lighthouse-core/audits/accessibility/aria-required-parent.js | description":["audits[aria-required-parent].description"],"lighthouse-core/audits/accessibility/aria-roles.js | title":["audits[aria-roles].title"],"lighthouse-core/audits/accessibility/aria-roles.js | description":["audits[aria-roles].description"],"lighthouse-core/audits/accessibility/aria-valid-attr-value.js | title":["audits[aria-valid-attr-value].title"],"lighthouse-core/audits/accessibility/aria-valid-attr-value.js | description":["audits[aria-valid-attr-value].description"],"lighthouse-core/audits/accessibility/aria-valid-attr.js | title":["audits[aria-valid-attr].title"],"lighthouse-core/audits/accessibility/aria-valid-attr.js | description":["audits[aria-valid-attr].description"],"lighthouse-core/audits/accessibility/audio-caption.js | title":["audits[audio-caption].title"],"lighthouse-core/audits/accessibility/audio-caption.js | description":["audits[audio-caption].description"],"lighthouse-core/audits/accessibility/button-name.js | title":["audits[button-name].title"],"lighthouse-core/audits/accessibility/button-name.js | description":["audits[button-name].description"],"lighthouse-core/audits/accessibility/bypass.js | title":["audits.bypass.title"],"lighthouse-core/audits/accessibility/bypass.js | description":["audits.bypass.description"],"lighthouse-core/audits/accessibility/color-contrast.js | title":["audits[color-contrast].title"],"lighthouse-core/audits/accessibility/color-contrast.js | description":["audits[color-contrast].description"],"lighthouse-core/audits/accessibility/definition-list.js | title":["audits[definition-list].title"],"lighthouse-core/audits/accessibility/definition-list.js | description":["audits[definition-list].description"],"lighthouse-core/audits/accessibility/dlitem.js | title":["audits.dlitem.title"],"lighthouse-core/audits/accessibility/dlitem.js | description":["audits.dlitem.description"],"lighthouse-core/audits/accessibility/document-title.js | title":["audits[document-title].title"],"lighthouse-core/audits/accessibility/document-title.js | description":["audits[document-title].description"],"lighthouse-core/audits/accessibility/duplicate-id.js | title":["audits[duplicate-id].title"],"lighthouse-core/audits/accessibility/duplicate-id.js | description":["audits[duplicate-id].description"],"lighthouse-core/audits/accessibility/frame-title.js | title":["audits[frame-title].title"],"lighthouse-core/audits/accessibility/frame-title.js | description":["audits[frame-title].description"],"lighthouse-core/audits/accessibility/html-has-lang.js | failureTitle":["audits[html-has-lang].title"],"lighthouse-core/audits/accessibility/html-has-lang.js | description":["audits[html-has-lang].description"],"lighthouse-core/audits/accessibility/axe-audit.js | failingElementsHeader":["audits[html-has-lang].details.headings[0].text"],"lighthouse-core/audits/accessibility/html-lang-valid.js | title":["audits[html-lang-valid].title"],"lighthouse-core/audits/accessibility/html-lang-valid.js | description":["audits[html-lang-valid].description"],"lighthouse-core/audits/accessibility/image-alt.js | title":["audits[image-alt].title"],"lighthouse-core/audits/accessibility/image-alt.js | description":["audits[image-alt].description"],"lighthouse-core/audits/accessibility/input-image-alt.js | title":["audits[input-image-alt].title"],"lighthouse-core/audits/accessibility/input-image-alt.js | description":["audits[input-image-alt].description"],"lighthouse-core/audits/accessibility/label.js | title":["audits.label.title"],"lighthouse-core/audits/accessibility/label.js | description":["audits.label.description"],"lighthouse-core/audits/accessibility/layout-table.js | title":["audits[layout-table].title"],"lighthouse-core/audits/accessibility/layout-table.js | description":["audits[layout-table].description"],"lighthouse-core/audits/accessibility/link-name.js | title":["audits[link-name].title"],"lighthouse-core/audits/accessibility/link-name.js | description":["audits[link-name].description"],"lighthouse-core/audits/accessibility/list.js | title":["audits.list.title"],"lighthouse-core/audits/accessibility/list.js | description":["audits.list.description"],"lighthouse-core/audits/accessibility/listitem.js | title":["audits.listitem.title"],"lighthouse-core/audits/accessibility/listitem.js | description":["audits.listitem.description"],"lighthouse-core/audits/accessibility/meta-refresh.js | title":["audits[meta-refresh].title"],"lighthouse-core/audits/accessibility/meta-refresh.js | description":["audits[meta-refresh].description"],"lighthouse-core/audits/accessibility/meta-viewport.js | title":["audits[meta-viewport].title"],"lighthouse-core/audits/accessibility/meta-viewport.js | description":["audits[meta-viewport].description"],"lighthouse-core/audits/accessibility/object-alt.js | title":["audits[object-alt].title"],"lighthouse-core/audits/accessibility/object-alt.js | description":["audits[object-alt].description"],"lighthouse-core/audits/accessibility/tabindex.js | title":["audits.tabindex.title"],"lighthouse-core/audits/accessibility/tabindex.js | description":["audits.tabindex.description"],"lighthouse-core/audits/accessibility/td-headers-attr.js | title":["audits[td-headers-attr].title"],"lighthouse-core/audits/accessibility/td-headers-attr.js | description":["audits[td-headers-attr].description"],"lighthouse-core/audits/accessibility/th-has-data-cells.js | title":["audits[th-has-data-cells].title"],"lighthouse-core/audits/accessibility/th-has-data-cells.js | description":["audits[th-has-data-cells].description"],"lighthouse-core/audits/accessibility/valid-lang.js | title":["audits[valid-lang].title"],"lighthouse-core/audits/accessibility/valid-lang.js | description":["audits[valid-lang].description"],"lighthouse-core/audits/accessibility/video-caption.js | title":["audits[video-caption].title"],"lighthouse-core/audits/accessibility/video-caption.js | description":["audits[video-caption].description"],"lighthouse-core/audits/accessibility/video-description.js | title":["audits[video-description].title"],"lighthouse-core/audits/accessibility/video-description.js | description":["audits[video-description].description"],"lighthouse-core/audits/byte-efficiency/uses-long-cache-ttl.js | title":["audits[uses-long-cache-ttl].title"],"lighthouse-core/audits/byte-efficiency/uses-long-cache-ttl.js | description":["audits[uses-long-cache-ttl].description"],"lighthouse-core/audits/byte-efficiency/uses-long-cache-ttl.js | displayValue":[{"values":{"itemCount":0},"path":"audits[uses-long-cache-ttl].displayValue"}],"lighthouse-core/audits/byte-efficiency/total-byte-weight.js | title":["audits[total-byte-weight].title"],"lighthouse-core/audits/byte-efficiency/total-byte-weight.js | description":["audits[total-byte-weight].description"],"lighthouse-core/audits/byte-efficiency/total-byte-weight.js | displayValue":[{"values":{"totalBytes":1489},"path":"audits[total-byte-weight].displayValue"}],"lighthouse-core/lib/i18n/i18n.js | columnSize":["audits[total-byte-weight].details.headings[1].text"],"lighthouse-core/audits/byte-efficiency/offscreen-images.js | title":["audits[offscreen-images].title"],"lighthouse-core/audits/byte-efficiency/offscreen-images.js | description":["audits[offscreen-images].description"],"lighthouse-core/audits/byte-efficiency/render-blocking-resources.js | title":["audits[render-blocking-resources].title"],"lighthouse-core/audits/byte-efficiency/render-blocking-resources.js | description":["audits[render-blocking-resources].description"],"lighthouse-core/audits/byte-efficiency/unminified-css.js | title":["audits[unminified-css].title"],"lighthouse-core/audits/byte-efficiency/unminified-css.js | description":["audits[unminified-css].description"],"lighthouse-core/audits/byte-efficiency/unminified-javascript.js | title":["audits[unminified-javascript].title"],"lighthouse-core/audits/byte-efficiency/unminified-javascript.js | description":["audits[unminified-javascript].description"],"lighthouse-core/audits/byte-efficiency/unused-css-rules.js | title":["audits[unused-css-rules].title"],"lighthouse-core/audits/byte-efficiency/unused-css-rules.js | description":["audits[unused-css-rules].description"],"lighthouse-core/audits/byte-efficiency/uses-webp-images.js | title":["audits[uses-webp-images].title"],"lighthouse-core/audits/byte-efficiency/uses-webp-images.js | description":["audits[uses-webp-images].description"],"lighthouse-core/audits/byte-efficiency/uses-optimized-images.js | title":["audits[uses-optimized-images].title"],"lighthouse-core/audits/byte-efficiency/uses-optimized-images.js | description":["audits[uses-optimized-images].description"],"lighthouse-core/audits/byte-efficiency/uses-text-compression.js | title":["audits[uses-text-compression].title"],"lighthouse-core/audits/byte-efficiency/uses-text-compression.js | description":["audits[uses-text-compression].description"],"lighthouse-core/audits/byte-efficiency/uses-responsive-images.js | title":["audits[uses-responsive-images].title"],"lighthouse-core/audits/byte-efficiency/uses-responsive-images.js | description":["audits[uses-responsive-images].description"],"lighthouse-core/audits/byte-efficiency/efficient-animated-content.js | title":["audits[efficient-animated-content].title"],"lighthouse-core/audits/byte-efficiency/efficient-animated-content.js | description":["audits[efficient-animated-content].description"],"lighthouse-core/audits/dobetterweb/dom-size.js | title":["audits[dom-size].title"],"lighthouse-core/audits/dobetterweb/dom-size.js | description":["audits[dom-size].description"],"lighthouse-core/audits/dobetterweb/dom-size.js | displayValue":[{"values":{"itemCount":13},"path":"audits[dom-size].displayValue"}],"lighthouse-core/audits/dobetterweb/dom-size.js | columnStatistic":["audits[dom-size].details.headings[0].text"],"lighthouse-core/audits/dobetterweb/dom-size.js | columnElement":["audits[dom-size].details.headings[1].text"],"lighthouse-core/audits/dobetterweb/dom-size.js | columnValue":["audits[dom-size].details.headings[2].text"],"lighthouse-core/audits/dobetterweb/dom-size.js | statisticDOMNodes":["audits[dom-size].details.items[0].statistic"],"lighthouse-core/audits/dobetterweb/dom-size.js | statisticDOMDepth":["audits[dom-size].details.items[1].statistic"],"lighthouse-core/audits/dobetterweb/dom-size.js | statisticDOMWidth":["audits[dom-size].details.items[2].statistic"],"lighthouse-core/audits/seo/meta-description.js | failureTitle":["audits[meta-description].title"],"lighthouse-core/audits/seo/meta-description.js | description":["audits[meta-description].description"],"lighthouse-core/audits/seo/http-status-code.js | title":["audits[http-status-code].title"],"lighthouse-core/audits/seo/http-status-code.js | description":["audits[http-status-code].description"],"lighthouse-core/audits/seo/font-size.js | title":["audits[font-size].title"],"lighthouse-core/audits/seo/font-size.js | description":["audits[font-size].description"],"lighthouse-core/audits/seo/font-size.js | displayValue":[{"values":{"decimalProportion":1},"path":"audits[font-size].displayValue"}],"lighthouse-core/audits/seo/link-text.js | title":["audits[link-text].title"],"lighthouse-core/audits/seo/link-text.js | description":["audits[link-text].description"],"lighthouse-core/audits/seo/is-crawlable.js | title":["audits[is-crawlable].title"],"lighthouse-core/audits/seo/is-crawlable.js | description":["audits[is-crawlable].description"],"lighthouse-core/audits/seo/robots-txt.js | title":["audits[robots-txt].title"],"lighthouse-core/audits/seo/robots-txt.js | description":["audits[robots-txt].description"],"lighthouse-core/audits/seo/tap-targets.js | title":["audits[tap-targets].title"],"lighthouse-core/audits/seo/tap-targets.js | description":["audits[tap-targets].description"],"lighthouse-core/audits/seo/tap-targets.js | displayValue":[{"values":{"decimalProportion":1},"path":"audits[tap-targets].displayValue"}],"lighthouse-core/audits/seo/hreflang.js | title":["audits.hreflang.title"],"lighthouse-core/audits/seo/hreflang.js | description":["audits.hreflang.description"],"lighthouse-core/audits/seo/plugins.js | title":["audits.plugins.title"],"lighthouse-core/audits/seo/plugins.js | description":["audits.plugins.description"],"lighthouse-core/audits/seo/canonical.js | title":["audits.canonical.title"],"lighthouse-core/audits/seo/canonical.js | description":["audits.canonical.description"],"lighthouse-core/audits/seo/manual/structured-data.js | title":["audits[structured-data].title"],"lighthouse-core/audits/seo/manual/structured-data.js | description":["audits[structured-data].description"],"lighthouse-core/config/default-config.js | performanceCategoryTitle":["categories.performance.title"],"lighthouse-core/config/default-config.js | a11yCategoryTitle":["categories.accessibility.title"],"lighthouse-core/config/default-config.js | a11yCategoryDescription":["categories.accessibility.description"],"lighthouse-core/config/default-config.js | a11yCategoryManualDescription":["categories.accessibility.manualDescription"],"lighthouse-core/config/default-config.js | seoCategoryTitle":["categories.seo.title"],"lighthouse-core/config/default-config.js | seoCategoryDescription":["categories.seo.description"],"lighthouse-core/config/default-config.js | seoCategoryManualDescription":["categories.seo.manualDescription"],"lighthouse-core/config/default-config.js | metricGroupTitle":["categoryGroups.metrics.title"],"lighthouse-core/config/default-config.js | loadOpportunitiesGroupTitle":["categoryGroups[load-opportunities].title"],"lighthouse-core/config/default-config.js | loadOpportunitiesGroupDescription":["categoryGroups[load-opportunities].description"],"lighthouse-core/config/default-config.js | diagnosticsGroupTitle":["categoryGroups.diagnostics.title"],"lighthouse-core/config/default-config.js | diagnosticsGroupDescription":["categoryGroups.diagnostics.description"],"lighthouse-core/config/default-config.js | pwaFastReliableGroupTitle":["categoryGroups[pwa-fast-reliable].title"],"lighthouse-core/config/default-config.js | pwaInstallableGroupTitle":["categoryGroups[pwa-installable].title"],"lighthouse-core/config/default-config.js | pwaOptimizedGroupTitle":["categoryGroups[pwa-optimized].title"],"lighthouse-core/config/default-config.js | a11yBestPracticesGroupTitle":["categoryGroups[a11y-best-practices].title"],"lighthouse-core/config/default-config.js | a11yBestPracticesGroupDescription":["categoryGroups[a11y-best-practices].description"],"lighthouse-core/config/default-config.js | a11yColorContrastGroupTitle":["categoryGroups[a11y-color-contrast].title"],"lighthouse-core/config/default-config.js | a11yColorContrastGroupDescription":["categoryGroups[a11y-color-contrast].description"],"lighthouse-core/config/default-config.js | a11yNamesLabelsGroupTitle":["categoryGroups[a11y-names-labels].title"],"lighthouse-core/config/default-config.js | a11yNamesLabelsGroupDescription":["categoryGroups[a11y-names-labels].description"],"lighthouse-core/config/default-config.js | a11yNavigationGroupTitle":["categoryGroups[a11y-navigation].title"],"lighthouse-core/config/default-config.js | a11yNavigationGroupDescription":["categoryGroups[a11y-navigation].description"],"lighthouse-core/config/default-config.js | a11yAriaGroupTitle":["categoryGroups[a11y-aria].title"],"lighthouse-core/config/default-config.js | a11yAriaGroupDescription":["categoryGroups[a11y-aria].description"],"lighthouse-core/config/default-config.js | a11yLanguageGroupTitle":["categoryGroups[a11y-language].title"],"lighthouse-core/config/default-config.js | a11yLanguageGroupDescription":["categoryGroups[a11y-language].description"],"lighthouse-core/config/default-config.js | a11yAudioVideoGroupTitle":["categoryGroups[a11y-audio-video].title"],"lighthouse-core/config/default-config.js | a11yAudioVideoGroupDescription":["categoryGroups[a11y-audio-video].description"],"lighthouse-core/config/default-config.js | a11yTablesListsVideoGroupTitle":["categoryGroups[a11y-tables-lists].title"],"lighthouse-core/config/default-config.js | a11yTablesListsVideoGroupDescription":["categoryGroups[a11y-tables-lists].description"]}}};</script>
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