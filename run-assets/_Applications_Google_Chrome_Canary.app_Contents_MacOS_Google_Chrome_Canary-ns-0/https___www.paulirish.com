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
  <script>window.__LIGHTHOUSE_JSON__ = {"userAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3733.0 Safari/537.36","environment":{"networkUserAgent":"Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5 Build/MRA58N) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/74.0.3694.0 Mobile Safari/537.36 Chrome-Lighthouse","hostUserAgent":"Mozilla/5.0 (Macintosh; Intel Mac OS X 10_14_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3733.0 Safari/537.36","benchmarkIndex":1484},"lighthouseVersion":"4.2.0","fetchTime":"2019-03-14T18:12:25.308Z","requestedUrl":"https://www.paulirish.com/","finalUrl":"https://www.paulirish.com/","runWarnings":[],"audits":{"is-on-https":{"id":"is-on-https","title":"Uses HTTPS","description":"All sites should be protected with HTTPS, even ones that don't handle sensitive data. HTTPS prevents intruders from tampering with or passively listening in on the communications between your app and your users, and is a prerequisite for HTTP/2 and many new web platform APIs. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/https).","score":1,"scoreDisplayMode":"binary","rawValue":true,"displayValue":"","details":{"type":"table","headings":[],"items":[]}},"redirects-http":{"id":"redirects-http","title":"Redirects HTTP traffic to HTTPS","description":"If you've already set up HTTPS, make sure that you redirect all HTTP traffic to HTTPS. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/http-redirects-to-https).","score":1,"scoreDisplayMode":"binary","rawValue":true},"service-worker":{"id":"service-worker","title":"Does not register a service worker that controls page and start_url","description":"The service worker is the technology that enables your app to use many Progressive Web App features, such as offline, add to homescreen, and push notifications. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/registered-service-worker).","score":0,"scoreDisplayMode":"binary","rawValue":false},"works-offline":{"id":"works-offline","title":"Current page does not respond with a 200 when offline","description":"If you're building a Progressive Web App, consider using a service worker so that your app can work offline. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/http-200-when-offline).","score":0,"scoreDisplayMode":"binary","rawValue":false,"warnings":[]},"viewport":{"id":"viewport","title":"Has a `\u003cmeta name=\"viewport\">` tag with `width` or `initial-scale`","description":"Add a viewport meta tag to optimize your app for mobile screens. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/has-viewport-meta-tag).","score":1,"scoreDisplayMode":"binary","rawValue":true,"warnings":[]},"without-javascript":{"id":"without-javascript","title":"Contains some content when JavaScript is not available","description":"Your app should display some content when JavaScript is disabled, even if it's just a warning to the user that JavaScript is required to use the app. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/no-js).","score":1,"scoreDisplayMode":"binary","rawValue":true},"first-contentful-paint":{"id":"first-contentful-paint","title":"First Contentful Paint","description":"First Contentful Paint marks the time at which the first text or image is painted. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/first-contentful-paint).","score":0.98,"scoreDisplayMode":"numeric","rawValue":1699.7000000000003,"displayValue":"1.7 s"},"first-meaningful-paint":{"id":"first-meaningful-paint","title":"First Meaningful Paint","description":"First Meaningful Paint measures when the primary content of a page is visible. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/first-meaningful-paint).","score":0.98,"scoreDisplayMode":"numeric","rawValue":1699.7000000000003,"displayValue":"1.7 s"},"load-fast-enough-for-pwa":{"id":"load-fast-enough-for-pwa","title":"Page load is fast enough on mobile networks","description":"A fast page load over a cellular network ensures a good mobile user experience. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/fast-3g).","score":1,"scoreDisplayMode":"binary","rawValue":1943.3435000000004},"speed-index":{"id":"speed-index","title":"Speed Index","description":"Speed Index shows how quickly the contents of a page are visibly populated. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/speed-index).","score":1,"scoreDisplayMode":"numeric","rawValue":1699.7000000000003,"displayValue":"1.7 s"},"screenshot-thumbnails":{"id":"screenshot-thumbnails","title":"Screenshot Thumbnails","description":"This is what the load of your site looked like.","score":null,"scoreDisplayMode":"informative","rawValue":true,"details":{"type":"filmstrip","scale":3000,"items":[{"timing":300,"timestamp":18149619409,"data":"/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRQBAwQEBQQFCQUFCRQNCw0UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFP/AABEIAMAAeAMBEQACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/AP1ToAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgAoAKACgD/9k="},{"timing":600,"timestamp":18149919409,"data":"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"},{"timing":900,"timestamp":18150219409,"data":"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"},{"timing":1200,"timestamp":18150519409,"data":"/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRQBAwQEBQQFCQUFCRQNCw0UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFP/AABEIAMAAeAMBEQACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/APjKgAoAKACgAoAKACgAoAKACgAoAKACgAoAKAPRf2dfCWlePPjj4M8Pa5am+0jUb9YLm3EjR+YpB43IQw/AigD2+b9nbwF8UrvwbBomoWngrWLi38vxBZeHWn8R6fZXEt6ILFTdJJJFGZlLlg9xxsUBdxAYA8t8Z/s6XXgn+2oL/WY/7R0rw/LrNxBDb7oxLHrB0x4FfeCRuUybyOnG3vQAzxX4C0PTvHXx6062sBFaeGPtP9kR+dIfs2zW7S2Xkkl/3MsifOT97P3gCADrNW/Z78H6Lc6t4bj8a2N/eWninS9EvvEtxazWkGleY2prcxlHcK+BZwvuOFyxUPj5yAdQv7I3h660Cbw4NcuLDxr/AMJLc6VptxfaTcRSai66Za3UdrJD5hjt0DyyDzsvncpXehDAA+TD1OKACgAoAKACgAoAKACgAoA3PBOqa5oXiez1Xw3cSWms6cJL2C4jKgxeUjSO/wA3HCKx5oA6nwTqHxF8EXF3ZeG5rnSDqa2c80S+UIpNrxy20v7zKh42kjdZBhoyScr8xoALz4l/EjxTpl7pFzqGo6nZ6zLLJNC9uH+0Gab7U67tudhlzKFB2qzOwA3NkAyNe1bxda+IPFUmqm4/tPWJpYdZkdAftD+cty4ZgMf62JJMrx8g7ZoAJ/F/i6+ub67nee5fV9Sj1m7aW0V0vLtS+2R1K7XB+0uNuCredgghgKANpfi58SV1Czvk1S/F3Zai9/aSR26nyLny44P3YC4G2OOKMRgbVVVAA4oA8/ubK5gj8+W2khiZtu8oQueeM/gfyNAFegAoAKACgAoAKACgAoAvaJruoeHL9b7S7uSxvUV0S4hOHTcpUlT2OGIyMEZ4IPNAHQN8XPGBmtpv7Z8y4t4xHHNPawyuQDGQXLLl2BhiIdssDGpByM0AC/FPXl8LaboPmWxtdOv/AO0LaQ26l0kw4xg/KVzI5wVOdxBJX5aAFf4ueLn8gf2zKqw3Ut6oREB86TzN7ZxnnzZMg5B3dMcUAVp/iZ4nuZ0ml1id5Yt/kuQuYQwkUhMAbRiVxhcYyMY2rtAJLj4ma5cwaIHmjN3o8009vfMpeZmklMrby5IPzFuwyG5zgYAKHiLxrrPizB1W7S7cbQJGt41cKrSMACqgjLSyM2PvFsnJAwAYlABQAUAFABQAUAFABQB+ky/sHfCiZ1it7XW7m4fIjgj1ABpCBnAJAA4BPJA460AU7z9hz4Xadq8OlXWla3banNbvdR2cuvWSzPCuN0gQy5KjPJxgUAX7T/gn74Bv4BNbeGvEk8RLLvj1i0YblJVhxJ1DAgjsQRQBN/w7y8Ef9Cp4n/8ABta//HKAD/h3l4I/6FTxP/4NrX/45QAf8O8vBH/QqeKP/Bta/wDxygA/4d5eCP8AoVPFH/g2tf8A45QBD/wwN8LlmFvLY67b3ZIX7PJqC7gT0GQCDnI5BI96ANmP/gnH8MJlYxf2hNsYoxj1MnBH3h/q+2efSgAX/gnF8MJXlSNr93ibZIq6oSY22htrDy+DhgcH1oAf/wAO3Php/c1L/wAGR/8AjdAB/wAO3Php/c1L/wAGR/8AjdAB/wAO3Php/c1L/wAGR/8AjdAB/wAO3Php/c1L/wAGR/8AjdAFTU/+CeHwu0mBJp49V2MwQbNRzzyf7g9KAParHwR4y02+gu4LeFJ4WJQi4XuCp/MEjI5GeOaAJbnwR4kuLyzuY9CsLGW0t47WIafeSWsawxypKkeyKRQVDIOCMFSynKuwIBpeHtM8beF9Ht9N03TLCG1h3H95ctLJI7MWeSSR3Z3dmJZnYlmYkkkkmgDR+3fEUf8ALjp34OP/AIqgA+3fEQ/8uOnfi4/+KoAPt3xFH/Llp34OP/iqAD7b8Rev2HT8f74z/wChUAYFx4X8cXmsf2nNFA115gk3eagAI6AAdhgD19cnmgCtq/wzv9e1PUNQvvC1lPdX2z7RINSmUuEGFU4k+6ODt6ZVT/CMAG9pGleJtCNwbHw7p8Hn7PM/0tmzsUKvVzgBQBgYHFAGh9r8a/8AQF0//wACP/sqAD7X41/6Aun/APgR/wDZUAH2vxr/ANAXT/8AwI/+yoAPtfjX/oC6f/4Ef/ZUAZfiDTfGviG1jtpNOsoI0cSAR3HU4I5JJ9TQB6dnmgAzigBMHFAB0oAUYPagBOtAC54oATsRQAdB9aAAnFAC4NACd+BzQAGgBaAE7j60AVtUs31Cz+zpO9qTJG5lj64V1Yr+OMHrwTQBjaJ4Z1LSLS5STXWv5W8oRSXFtnYqgAj7+ckAc5GDluSaAILTwffW7WhbX75/KkV3LOSX2vM2DknORKoPf92v4AFjXvDV/rMjyrrMlk4EqILdGUYeNRk4cbmDLkEnvjBFAGnpWmvpq3Ye6kuzPcSTqZP+Was2QgGTwOlAF4e9AB2oAXtigAHPWgBM8UALigBKAFxzigBKAAn7v1oA53x/c+J7Tw3u8HW9lc69Je2UC/2jGZIIrd7qJLqZlEkZYx27TSBQ4JKADJOCAeMT+F/jbq3jOOK+1FIPDV14sj1OSSwvBFLaaWba/j+yNjB+XytMYiPeDPPMdxiHygFDWZf2jrC9+J9roenWU+nz3N5L4cvLuS3kuV3WF2YREWuAiKt1DYoFljI/0iRm+UEqAadj4t/aK1BPGzXPgnw/pn9nQX0vh4mZZH1eVWnFnDKgvNtvkfZmdi7qQJBlCwKAHK+K9d/al1HXorSx8I6PHZ6Vc6hcw6jBPHaxX7Ql0skkT7dI7wTKyyOpCMG+XACb3APQ7fXvi1J8UvA8l14NmXwxdaFbnWri31a1SOwv5N5nja3LsziPZGNyu/LJsYr528ApX1z8dfDuozJp2lad4mt3e2WGW8uYVxC1vfySB1V4tjx3P2KFnAkzCySASSb1QAn8J+IPjYvivSV1bwhp6aRqGoS/2vLJeoP7OiW0sRH9m2TyGRGm+2csqsduSsf8YBwnhu8/aQ8I6LpB03w1N4glkOkQava+MNSs3kSXyrk6nc20sE/EJYWiorlmBLbYgMmgCr4Y8dftP+CPAMlvq/w+sNafR9BtvIvpJUuLy7nh0iV7jzljvneWR79LeNSi5dWkJClgVAK3hT4t/tCfEW/0+E+Bn0S90uH+0ZGudKudPs7p5fD8pWB/PuVMgj1KWONkByRtbMZjdgAdfoPxJ+MviTxh8TPCOqeErnRl0kyvo+s6bp/lrqVtuttptrmeZ7cXRie4ZUkHliQxByBFMCAYt9q/7Q621r4c0fwNqEejm/t/+Jzrut2M+oR2i3F40nmSwXEfzlY9OwqpJhJLhWkdtpABd+DPiH9pZvifZx+NvBWk2Pg3WLk3OqXj30Tz6YU0mFPJtoku5QsLXkbFTmRjvdmWPcMAH076euaAMHx341svh74bl1rULa9urWOe2tjFp8BnmZ5544IwsY5b55V4GTjOATxQBST4reEmvZ7Ea3btqkFnHfTaYm57xIZH8tSYAC+d5CbQu4MygjLDIBasPiHoOraXYalpl8ur6ffM6213p48+CQq20/vFyoGQcEkBsfKTQBy8v7RPga1n1z7ZqkmnWOiQxTX+qXdu6WcLSXUtr5bS42hlmhZTnA54J2vtAOk0j4l+HNdeyFpqKOmoXLWthIykJelYPPLxHHzIYssH4DDDKSrKSAYvg/46+DPGi2UNtq0NjrFysBOiX0saXsDSwrNGskaswBKMOhI3ZXO4baAL6/GHwg3iO00FNZWXVbq7ksUhjglYJMn2rcruF2p/x43eCxGfJbGeMgFGw+Ovg2+8S6z4eOqC01vTJ7eGXT7kBbh1nW18qVYsl/LZ72GIMyr8+4dBmgDph4w0kanZadJd/Z729uJbW1guYnia4kjRndY9ygP8qOcjIIRsHg0AczZfHfwXPexWd1qw0i+uGRbSy1OMwXF2Wht5QIom+dm/0qNNmN5cMoUlTQBrRfEzQJdNv74XMrRWOpPpM6QQPcSJcq+3ZtiDnnKkf7yg4Y4oArv8YfCawapMNTeS30zm6u4rWaS2jX7Il4D5yqUIMEiOCCc5x14oAkh+K3hafTrPUE1InT7y6ns4LsW0zQu8Lukh3hCFQeW7eYSE2Iz7toLUAXfCXxB0Dx1aLc6DqKanbNu2zQo3lttIVsMRjhty/wC8ki9Y3AAOg67T70AcD8dvHmj/AAw+GOpeKde0ca9pWlT2lzLZqkbyZFzEFkjD8eZGxEi8j5kX5l+8ADhvFvjr4YW3iCw8M654Id9T167TS5beDTreXLtLbXTxXTRyEbRLeiR0YkMzSNhxKhlAMT4f/HT4ReM7y21Lw14HWW+MF7rsTLYadFPFcFGWdVBmDi5mjhbBA/eJHncUUsADoNV8bfDSyvtc8N6n8N1tk1GG71C6hk0i0mtdUjs1W68xmjd45N3nb0DncGbLBC6FwDNT48/DTw7JqIi8FXOm6l4bvrlXtX02yglt7lpLeOaVT5oCB3u0DTsyowSRi5UBmANXw54z8AeKrzxTdeH/AIepdajoOrLo95L/AGdZwyPcwXNvHFGjlsn5oomjJwq/Z0DGMquACp8M/jb8O/HWhHxp4e8F3ltp761Hp76nNpUEMou5ZIxHIQHL4ZtRlYPj+O4JwZB5gB6J4W8C+AtV0PS9b0vwd4ftYr61t7mB4bC0dhERDJGvmRbkYL5MBUozLmGMqSEU0Ablh4J8OaZeNd2egaZaXRvH1EzQWcaObl02STEhc+YyZQv94qSCSKAK03w28IXDTGbwpos3nm4aQSafCwY3DBrg/d6ykKXP8e0FskUAW7TwZ4fsNTvNRtNC0y2vL6RJrq4htEWS4kQkpJIwA3spZiGbJBYnvQBDH4B8NR2l3ajw7pAt7uJbe5i+wRBJ41Xy1SRduHURgIAeAowMDigCay8G6Bp+mPptvoenRac7ySNZR2sawlpNwkbYFA3OHcMcfMGOepyAM8NeB/D/AIMj8vQNE0/Q4PIS2EGm2qW8axo8jqiqgACh5pWwOMyMe5oA2+hH1oAOV6HH0oAFCgnCKCRgkKBx6UAAG1lPJ29CTnHOe/8AnigBeC5YqNxxzgUAIyguzdGbhmXgn8qABgCRn6AZ4+lADmYuckktnv8A56e1ACMd3PpxwKAGigBT6AUALmgAPIoABgUAANACHqPXNAGfr13f2OlyzaZpy6neh41S2acQqwLqHYuQcbVLN0OduBya0pqMn72iMqkpRXu6s4e28d+P5tUntJPhu0Ma6Z9qS6OsQmH7Xk4t92MkYH3wvBIBULhz1KjQav7T8P8Ah/6+44nXxKbXsr+kv87EU3i74lGe0ZPAdssar5lxF/akT7syFPLSTcuGCtHKSUxiKRRlmUhqnh0veqa+n+Y3VxV1an+P+Rp+JfFfjbSL+CDSvAw121dXD3MOpQQmNwE2kpIwyrMzZwcqI2OGLAFxpYZ6uo/u9fMU62Jj/wAu19/p/mVU8XePorvxNHJ4EFxFZMzaVMupwRrqS9lxuYwkHHLA5yThMbSSp4bTkn0V/XqTGtipNr2fV9VtpbqyifGvxQtNBtZZPh1b6jq7GNJre21mGKJf3UDPIGckj55Jk2fN/qM7mDKTmoYeUmud/df/ACNubFxim6ab9bf5m3qnibxnZ6lfRWvhAXtnDPCttcQ30ObqJlbzWKu6GIoQMD5t+4D5Rl1mMKDfvTsrb9n59xyqV0tIa9rrVet1b7jO1Lxb8RTYauLPwLCJhZ3EthJNqUJdp9zCGKSEPt6FSzCbH3sdADtGlhm1ep+H9fkYyr4mz5ad/O6/zJ7Xxn44/wCEL1PV7zwEYNXhjeSDQ11SKSSUhmCqZVyuSqq3A/i2gE0lTw7koOp+DCdbEwhzqnf5+va5Lo3ifxtd6wRf+EYYtLuGQwzpqC+ZbL9mt3ZZEb73717lNw2n90nyANvqXToXaU9V/mWp4vSXs9Hb8tfxINJ8RfEVfGYsdQ8JWTeH5Zbj/icQ6kqvDGs04hzCclmdFhJAIA3k55KIlDDuN1PUFUxXNb2d1935nQ+EtY8Qav5x1zQBoapGhjH2tJy8hZ94Gz+FQI8McFsnKrjFZVYQjbklf5P9TopTqS+ONtuq/wAzo+vFYHQJ9KAAr0+tAFDXNesfDVlHeajMYLaS6trNXCFszTzpBCvAON0kqLk8DOSQATQ9dwWmxzng/wCL3hLx9oFprGgalJqVjeQyXEDwWkzNKkY+chdm7IOVxjO5WX7ykUkrbDbvuQ6X8bfA2vPaLpGvxaul5KYbSfT4ZLiK6YR3Eh8qSNWWT5bS4AKkgtEyA7uKq7JsjS034meFtZuNNh07Wra9bU5biGxaAllumgx55jYDDLGTtZwdob5Sc5FIZH/wtPwmt3pFpPrltZXescadBe7rd7s5IIjDgbiMDIHQOh6OpLuKyHX/AMUPCml+JotAvddtLLVZEldYLljGD5USzSjcRt3JE6SMucqrqxGCDSeu41psXNO8aaPrF+1tY3YvduzdNaxvLCpaLzUBkVSgJTDYz0eP++uRabCsmcz4X+PXgjxj4Y0vX9N1Z303VZXt7GSa0miNxKrOpjVWQEsWjkVFGS5RggYggO4WR03/AAmejNHfvDPNeRWW4SyWdrLOmVkMbqrIpDMsiMrKpJUo2QNpwgSS0RHP8QfDdq0qSarCJEO3y1yzOwlEJjQDl3ErRxlFyQ0sa9XXLu2FkUbX4s+E72/0yyt9btp7nU322EUe5nvF2q3mQDH71Nrq5dcqEYOSFIJLsGr7lPSfjf4I1qyhu7PXobiGW7ubFPLjdmM9v/rY9u3OeVAGMsXQAEsAS7YWSNz/AITrQxph1E6hGmnm6WzW7cMIjKxAQB8YIZmCKwJVmZVBJYCkMm0jxfpOu6hdWFjdiW+s1je7tWUrLbeYodFlUjKOUZW2HDAMCQMigDYPb60Ac94/1bQtC8Mz33iOLztLhlhYp5RmZpvNTyBGgyzSmbyvLCjdv2becUAcT4V8W/C6HVNP0HR49L0q6azlutMhsYRHFPayyTMz27xjYRI0c8gUHdhGfbtG4gGnLceCo9JutXuNCVLfSZriSJ5LUPNHNJLPve3QbnEszmTBjG+RpAvL5VQBPA998P7uPwfLoOkWlha3C3Z0C5fTfsqgyZmnSHeqsplVWlwABIiFxuVcgAh8SSeAPFWq6JpOv+HLTUtSvraYaRY6rYxmSeExeZJ5Ky9AVjj3jgqfJ8zaWTIBZv8A4xeBdHstc1a6vobS20zVPsmo3M0flBL5YoSibmxudonhClcg8Jnd8tADtO1vwdqXjzWRZaf5/iPTLlNPv5bazbzYpZUhyrEDLKY1s9zDK7UiLcRHywDF8LxfDdtEmstI8NQxweGmt77+zF08A6dLPGJ4mjX7qybZmfeh+QySHIJagCXUvHnwxv8Axrp/h27+yXnifUnMFrp8Ns1wzK7LclwUDIkb+SkxckBvJBYlkwACxZfEnwB4l1Q+GdmX1i/1LRxaz2rJDeT2rN9uQr0wpB3MwAfIwWxwAZ/h/wAR/C/UvEfhSzg0W2sNZW61DTdBik01RJbm0eS2uFhdAVijK2bKBlcxhUwB8gANTwxpngGbQdP1jQvC8FvppEt5DMmm/ZGgLSjzJgrhHDMV8wSqMusauCR5eQDB8I/Fj4a/E/wh4Y1GbT1s7bxLcyXumafrEMQkubiG5EbttDMjSLIqy4BJwA45RtoB1Hh7xj4T/wCE3v8ATrPTF0zXr24WOa5FosZvHW0imAeVfvOsRACsdxWNyoKxuVAO/PO0e9AGT4q16bw5o0l9b6Rfa7OskUUenaYENxMzyLGNu9lQAbtzMzAKqsScA0AcjqnxQubGWW5b4feKbprSC+MUsNtE4cxNKNir5hcmYWxMRC4YSRhihkAoA3bPxdqV5qU0EfhfUTapdy232xnijRUSMMJmV2VjG7ZRTGH5wW2ruKgGRp/xKutaeO7g8H+IYLUaTPqS/brR7ecshiH2cQkcTEtIoDEE+WduUfdQA7xT8TL/AETwxreo6d4Q1jU9Q0/SYNVisJIWi+1mUSkW6MqufOUxYdQp2+ZH13cAG1b+Kb6aW8U+G9Tjit7mK385xGBMpx5ksalt7Inf5ctxtDc4AObsfi/dalp93dQ+BvEytb6wdGFvNaLHLM4QN9oTLbTbbmCiYsBwTjjkA6KfxZd21rfzS6Df77eZY47aNN8sq+RHKzZXKDaWkThyC0e0MWZVoAzvDnxIuNfvtGtj4Q8R6aNRhu55J76zEUVksEnl4mYtw8jEGNV3Fk+fgA4AO1//AFUANMEbTpOUXzURkVyOQpKkjPoSq/kKAHYoAM80AGKAE54+tADgxVWXoG64oATp04A6e3T/AAoAUtlQvYHIHYUANwOR0B4wOB+VADyTjqaAGZ5JLHnqM8fl70AKPkJYHGepB60AGMcglfYHFACn5iTjknJoAOM0ABbNAB25oASgAx6UAB6jHTNAHP8Ajuz8QX/hqaHwzeRafrBmgKTzMoAjEyGYAtFKoYxCQAlGwSK1pOCl+8WnYxrKpKP7t2Zy3hi1+Kttc3E2v3Pha6iaMRwwadFPGEbcw8wlySSRsLDOPlwuDknqtg0rRUl66/icUljW7txf4L+vn8jn/BuofHHW572fXtP8P6CLfT5FtbRl3RXF63llGYxzSt5a4kXOUOHDbWOAmslg4Jcrb1+4mH12V+ZKNvxN66h+KeoWGk3tjPoOm6gqhb7Tb+BmhZgZgxR43ZgpBhI5ydoJ2fMjZp4WM5LVro/uLf1ucYS0XdffYXxKPioujWf9lf8ACPf2izWouCiyMkb/AGmHzWAcjdCIRNlciQ5BVlYAGYrC26r/AIYuo8VfSz3/AKd+hp6rafEK98QabJZXmgafokM8f2u3ZJZZ54/K/eMH4C/OxAQLn92rGQh2iGK+r8r5k7+um5bWJck00vlrs/6RzcejfGMaRprPrHh46xa2ipKIyVs7m4EshZ5VNuZGDRiFcRtFtZ5jggIK6VPCu6lF2b/rW6/JnM6eNTTU1dL+tOV/mjUs4/i4dRvxdS+C1sFsAbRoo7syPebEysmWwsW/zBuGW27TtzkVm5YdraX3r/I15cUnpy/c/wDMhu9N+K5u7K+t9W8PecllDFcWBif7G03muZpEG3zc7DFtJl2/K4MeWDq08PqmmElib3TQz+yfitHfajqEes6LNK9rDDbaXcx/6BHMsriaUFIhOoeNYmVWlcK7yqdwCNRGWGulKLsuq36d9AlHE2bi1d9Ht17anV+BofF0NgV8Xz6RcXZVXU6OsqojEfMh38lQeFPUrjPILNjVdJ607/M6KKqq/tbfJHSiuc6AB5oAPpQAdwB0zQAjMVH3SxPAxjr+NAGBYeOtJ1HxFNoEL3B1iCxh1Ge2+zSYigmZ1iJkx5eWaOQBQ275GOMCgDO1r4v+E/D97DZahqMtrcz6tb6FEjWsh3306looQQpHIVstnaMEE54oA2H8ZaPFHNJNdi2hiV3aa4UxoFRN7MSeAAoYknGMGgChafE/w5fWXhe7tr2Sa28TW63emOltJ+9gYRFZXBUGNT58Iy+ADIoOGIBAKvh74u+GfFFxfw6XdXF89jrE2g3X2ezlfybyIr5iNheFAZT5n3MHlhQBd1D4keH9Kh1CW7vGgj0/UYNKumaFz5VxM0CxKcA9ftduc9AJBkjDbQDEuPjv4Ltde13Rn1lf7R0TTZtX1C3WGRmtraLl3cBTg7SjhfvMsiMFKsGoA2rz4haVp8NhPcpewQ3WlT6yWltHRoIIvJ3iSJgJFf8Afr8mzdwwIBGKAGaz8R9K8Pafa6lfw39tpdypdbqW1aMxqLeW4bzIn2yoVjhYkFM5IGM5AAH23xG0S68OW2uQzySadcvaRQyeUwZ3ujELcbSMjd58PUfLv+bGGwAQx/FDQ7vTlv7D7ZeWragunea1sbZS52/Opn8sSJh/vRltxVkXc4K0AZK/HbwtLq+laYjaj9v1C9WyWC5sJbRoi8N1LHK6ziNvKcWVwokVWBKZHy/NQBS0T9pLwH4jvfCkOm6nNdW3iaG4l07UPsksdsfKuI7YrI7qvls80gjTcAGcBAdzxq4B6f3H1oAyPFeu3Ph/SYrq002bVZ3v7K1MEAJZI5rqKGSY4VvliSRpTxjEZyQMkAHDeHPif4j8Q+HPDGp6r4K1HRWv9Hv9U1LT3gkkuLaSF4litMFU/eSq7MuQN3lkAHkgA2j8Sbm4fSfK8La+Yrq3sryV5rQKIFuBPhNxYASxGFRLuIVBKnJ3YoAiPxZaK+8QWNx4T8Ub9EitHN2mn/uL5poi+LVy2H8sjZIzBFRiNzBcsACla+M/DfiO40LXoNA1LU5hYXGox39pbGdLPakOUk8otmZ47tjFsDh0MzRsVfLgF0/ElvslzqcejX2paStml9YSaMhvJb+Py45HKFV8n/lqgUiVvMKybeEJoAvHx1PDquv2cug6nDBpkEd0l/5IFtOhiZ2RXYgvIrRyBgowu9MnLHABleJfGl9J4e8PNB4V1jUIvEGpLo1/aSRPDcaXG/miWeVlDjy0dNpdX8tgwaORlKswBa1Txjd6DZaXpmh+FtXnMszWAlEQa201I7hLfzrgFwzIQ4kUJlnRWJ2AMygCx/EC7lvvDQtvDOsrbavcX0Esk9qYzYrbLJiWT7wCTNGBHkqGWVTkdCAYukfF7Ur3w74jmvPCWs2+uaNqTRnRlh33FzZm9eGK4hCsdwaOORuoBaNsfJsdgDr5vGn2TxDNpEOg6vdXS2Ut/wDaYrYC1KxsirF5+7yzK5ZtsZYH5HLbBtyAbem38ep2FreRed5c6JOi3MLwypuUEB45FV0YA4KsqsDwQDxQBZ3bRgYAAwMDt/nP60ANI6euaAM7xBfX+m2Cz6dpjavObi3ia2SdYmETzIksgLcHy42eTbkbtm0HLCgDn9O8VeLLg2Iu/BRs/O0r7VORqccgt73co+yHC/MvLHzl4wvKjPABGnifxhJpk0jeE1tLlrieGC3+2pIywKZEhmOBtJfELlCylVlcZJjwwBa8JeLtd1jxXrem6t4WfQ7CyhtZrPUHvEmF6ZFPmrsUAxmN1ZeSdw2sMBqAOg0meS80+KeSOSJ5Mv5csZjdASSFIJPIHGe+Mjg0AWwcUAHQ+tAC9eaAAdKAAcGgAJoATqMUAGNpoAPegAJzj60AR3FzDaRh55o4UzjdIwUZ9MmgCudasOn262x/11X/ABoAP7a0/H/H9bf9/V/xoAX+2rAYxf24wc/65ev50AINZ08c/brb/v8AL/jQAf2xYDre23/f1f8AGgA/tnT8f8ftv/39X/GgA/tnT8f8f1tj/rqv+NAC/wBs2H/P9bf9/V/xoAQazp/e+tv+/q/40AA1nT+99b/9/l/xoAP7Z0//AJ/rf/v6v+NAB/bVgf8Al+tv+/y/40AB1nT/APn9tv8Av6v+NAFiC5iuow8E0cyZxujYMAfT+VAGP42fxF/wjN2nhOPTn8QSbUtX1cv9kiyw3PKE+dgF3EKvJOBkAkgA88n8S/FqTxGlzD4Z+zaJNpVxN9kmitJpoL1JbgwRHF8gG9BBkqzqzEcw5ZkAJtcn+K9rZWeqWBs715NKgafRm0mJ5Yb0NEJDGDqESZYSz5BndVECBWZiTIAbcN78QE1LxGl3ZWE1gmp2kWkPZQhJHsma3Nw8u+5ILKJbhRgIf9GLBH8xUIBm+CvEXxTbX9TtPFmgWK6Tb6gLayvdKiQG6tcXGJ2Vrtmj6WwKbSQWPUMTCAUNI1D4w6fqdm9zp+n6ppN1qdwLgXbRR3un2i3bpDtEbiKUPAYpCcq0e2TKysViABRTX/jXZz3UCeH7O7t11XVhDNPBbkmyWRmsSCt6nJjKgZTc5GyQQ4+0OAdVrl38RraHw/JYRWN3JL4kjXUIo7NEWDR2Vw27fc/NIp2N5iHOQMQsMggGb4R8cfES88eyWHiDwh/ZXh+53mzmZYRLGm6c7pJI7qVDtVbRCuFZ3uWKApA7EAp23iH4zXd5cxyeFtEsrSWWya1mkkEjQwyzxG5WZBcYMkEMkigI22VoXcMg8uKQAyNW8ZfGbwv4C8WazdeHrfUtZt9SeLS9NtLL7Y72nl24jkVYpw8g8zzwc7XbeJCsSqUoA7DV9Y+JMfjSaHTNIsZ/DkVxp4EtxbojywySRrdtHILwkmNHeT54U/1RRRKWDUAekUAHf8KAD0470AYfjKx1fUdDCaFLHFqMd5aTr5s7wpIkdzHJLGzorEB40dPukHdg8E1cWo/F2ZnNOXwd0cXoOh+Pbu4vv7S16+09rVjbWMcRtPJul+zxKHZmhkf/AFyytlvmwwyp5Wu6dTD/AGI76/noedClinrKVrafkRaX4Z+KGkaVLajxBZai0Og/Zrea6nGTf7UHms32YsQv7zBLHcNm5N25zhKVGXRo3UMRH7SNDS7D4kWumXJvdQ06+uZLW7EQjkVXgl8yZrcj/R0WRtphRi3lqcZ2jBMkVHTa9xGtKNaLbqMzvA3hD4oTza5F4z8bhIHuoW019CjthIkIR1dJTJZgEklGLrjcUBVYgShwOkrX/hD4s3vgmGCz8appniYCJXuZWtbqPAuWMrFhp8YJNu+BiJRvijByN5cAt3/hn4p3Wu6hdW/imzj0qV4BaWKmOJlQ3k0kzO7WjlWFv9niVRkHEoY7ystAD7Twx8TLjwd4Z+1+MI4fE9m9xJqhhhtza32RIYoz/ooZVDiEfIEIRnyzsFegDP0Pwz8X4dJiN/4tsZtQbR7xGifyZYU1IsgtJMiziYxKolZ+RlnAC7RyANTw38YrrwtrtjJr+mW2si/s7vRb9rxZ/wByoiFxBdBLGFSuUkcbAGfzdm6MLuIBLe+D/ilfeEPEtoPFFrDrsq2R0a9e5Rkt2TaZd6pZocschi3mLIeRHbqfKABLpdj8T18WeNrOS5EmgrYW0Ph/V7+5t0ka4ECLI5higJ3NIZmd5RtUrEI4WBfABZ8J+F/iRaT+FZvEfieLVJYL6+uNYjtZI4bdoXjdLaKJBaK8qoSh+Z0IO4kyjYFAPUPxoADwRQB//9k="},{"timing":1500,"timestamp":18150819409,"data":"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"},{"timing":1800,"timestamp":18151119409,"data":"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"},{"timing":2100,"timestamp":18151419409,"data":"/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRQBAwQEBQQFCQUFCRQNCw0UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFP/AABEIAMAAeAMBEQACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/APjKgAoAKACgAoAKACgAoAKACgAoAKACgAoAKAPRf2dfCWlePPjj4M8Pa5am+0jUb9YLm3EjR+YpB43IQw/AigD2+b9nbwF8UrvwbBomoWngrWLi38vxBZeHWn8R6fZXEt6ILFTdJJJFGZlLlg9xxsUBdxAYA8t8Z/s6XXgn+2oL/WY/7R0rw/LrNxBDb7oxLHrB0x4FfeCRuUybyOnG3vQAzxX4C0PTvHXx6062sBFaeGPtP9kR+dIfs2zW7S2Xkkl/3MsifOT97P3gCADrNW/Z78H6Lc6t4bj8a2N/eWninS9EvvEtxazWkGleY2prcxlHcK+BZwvuOFyxUPj5yAdQv7I3h660Cbw4NcuLDxr/AMJLc6VptxfaTcRSai66Za3UdrJD5hjt0DyyDzsvncpXehDAA+TD1OKACgAoAKACgAoAKACgAoA3PBOqa5oXiez1Xw3cSWms6cJL2C4jKgxeUjSO/wA3HCKx5oA6nwTqHxF8EXF3ZeG5rnSDqa2c80S+UIpNrxy20v7zKh42kjdZBhoyScr8xoALz4l/EjxTpl7pFzqGo6nZ6zLLJNC9uH+0Gab7U67tudhlzKFB2qzOwA3NkAyNe1bxda+IPFUmqm4/tPWJpYdZkdAftD+cty4ZgMf62JJMrx8g7ZoAJ/F/i6+ub67nee5fV9Sj1m7aW0V0vLtS+2R1K7XB+0uNuCredgghgKANpfi58SV1Czvk1S/F3Zai9/aSR26nyLny44P3YC4G2OOKMRgbVVVAA4oA8/ubK5gj8+W2khiZtu8oQueeM/gfyNAFegAoAKACgAoAKACgAoAvaJruoeHL9b7S7uSxvUV0S4hOHTcpUlT2OGIyMEZ4IPNAHQN8XPGBmtpv7Z8y4t4xHHNPawyuQDGQXLLl2BhiIdssDGpByM0AC/FPXl8LaboPmWxtdOv/AO0LaQ26l0kw4xg/KVzI5wVOdxBJX5aAFf4ueLn8gf2zKqw3Ut6oREB86TzN7ZxnnzZMg5B3dMcUAVp/iZ4nuZ0ml1id5Yt/kuQuYQwkUhMAbRiVxhcYyMY2rtAJLj4ma5cwaIHmjN3o8009vfMpeZmklMrby5IPzFuwyG5zgYAKHiLxrrPizB1W7S7cbQJGt41cKrSMACqgjLSyM2PvFsnJAwAYlABQAUAFABQAUAFABQB+ky/sHfCiZ1it7XW7m4fIjgj1ABpCBnAJAA4BPJA460AU7z9hz4Xadq8OlXWla3banNbvdR2cuvWSzPCuN0gQy5KjPJxgUAX7T/gn74Bv4BNbeGvEk8RLLvj1i0YblJVhxJ1DAgjsQRQBN/w7y8Ef9Cp4n/8ABta//HKAD/h3l4I/6FTxP/4NrX/45QAf8O8vBH/QqeKP/Bta/wDxygA/4d5eCP8AoVPFH/g2tf8A45QBD/wwN8LlmFvLY67b3ZIX7PJqC7gT0GQCDnI5BI96ANmP/gnH8MJlYxf2hNsYoxj1MnBH3h/q+2efSgAX/gnF8MJXlSNr93ibZIq6oSY22htrDy+DhgcH1oAf/wAO3Php/c1L/wAGR/8AjdAB/wAO3Php/c1L/wAGR/8AjdAB/wAO3Php/c1L/wAGR/8AjdAB/wAO3Php/c1L/wAGR/8AjdAFTU/+CeHwu0mBJp49V2MwQbNRzzyf7g9KAParHwR4y02+gu4LeFJ4WJQi4XuCp/MEjI5GeOaAJbnwR4kuLyzuY9CsLGW0t47WIafeSWsawxypKkeyKRQVDIOCMFSynKuwIBpeHtM8beF9Ht9N03TLCG1h3H95ctLJI7MWeSSR3Z3dmJZnYlmYkkkkmgDR+3fEUf8ALjp34OP/AIqgA+3fEQ/8uOnfi4/+KoAPt3xFH/Llp34OP/iqAD7b8Rev2HT8f74z/wChUAYFx4X8cXmsf2nNFA115gk3eagAI6AAdhgD19cnmgCtq/wzv9e1PUNQvvC1lPdX2z7RINSmUuEGFU4k+6ODt6ZVT/CMAG9pGleJtCNwbHw7p8Hn7PM/0tmzsUKvVzgBQBgYHFAGh9r8a/8AQF0//wACP/sqAD7X41/6Aun/APgR/wDZUAH2vxr/ANAXT/8AwI/+yoAPtfjX/oC6f/4Ef/ZUAZfiDTfGviG1jtpNOsoI0cSAR3HU4I5JJ9TQB6dnmgAzigBMHFAB0oAUYPagBOtAC54oATsRQAdB9aAAnFAC4NACd+BzQAGgBaAE7j60AVtUs31Cz+zpO9qTJG5lj64V1Yr+OMHrwTQBjaJ4Z1LSLS5STXWv5W8oRSXFtnYqgAj7+ckAc5GDluSaAILTwffW7WhbX75/KkV3LOSX2vM2DknORKoPf92v4AFjXvDV/rMjyrrMlk4EqILdGUYeNRk4cbmDLkEnvjBFAGnpWmvpq3Ye6kuzPcSTqZP+Was2QgGTwOlAF4e9AB2oAXtigAHPWgBM8UALigBKAFxzigBKAAn7v1oA53x/c+J7Tw3u8HW9lc69Je2UC/2jGZIIrd7qJLqZlEkZYx27TSBQ4JKADJOCAeMT+F/jbq3jOOK+1FIPDV14sj1OSSwvBFLaaWba/j+yNjB+XytMYiPeDPPMdxiHygFDWZf2jrC9+J9roenWU+nz3N5L4cvLuS3kuV3WF2YREWuAiKt1DYoFljI/0iRm+UEqAadj4t/aK1BPGzXPgnw/pn9nQX0vh4mZZH1eVWnFnDKgvNtvkfZmdi7qQJBlCwKAHK+K9d/al1HXorSx8I6PHZ6Vc6hcw6jBPHaxX7Ql0skkT7dI7wTKyyOpCMG+XACb3APQ7fXvi1J8UvA8l14NmXwxdaFbnWri31a1SOwv5N5nja3LsziPZGNyu/LJsYr528ApX1z8dfDuozJp2lad4mt3e2WGW8uYVxC1vfySB1V4tjx3P2KFnAkzCySASSb1QAn8J+IPjYvivSV1bwhp6aRqGoS/2vLJeoP7OiW0sRH9m2TyGRGm+2csqsduSsf8YBwnhu8/aQ8I6LpB03w1N4glkOkQava+MNSs3kSXyrk6nc20sE/EJYWiorlmBLbYgMmgCr4Y8dftP+CPAMlvq/w+sNafR9BtvIvpJUuLy7nh0iV7jzljvneWR79LeNSi5dWkJClgVAK3hT4t/tCfEW/0+E+Bn0S90uH+0ZGudKudPs7p5fD8pWB/PuVMgj1KWONkByRtbMZjdgAdfoPxJ+MviTxh8TPCOqeErnRl0kyvo+s6bp/lrqVtuttptrmeZ7cXRie4ZUkHliQxByBFMCAYt9q/7Q621r4c0fwNqEejm/t/+Jzrut2M+oR2i3F40nmSwXEfzlY9OwqpJhJLhWkdtpABd+DPiH9pZvifZx+NvBWk2Pg3WLk3OqXj30Tz6YU0mFPJtoku5QsLXkbFTmRjvdmWPcMAH076euaAMHx341svh74bl1rULa9urWOe2tjFp8BnmZ5544IwsY5b55V4GTjOATxQBST4reEmvZ7Ea3btqkFnHfTaYm57xIZH8tSYAC+d5CbQu4MygjLDIBasPiHoOraXYalpl8ur6ffM6213p48+CQq20/vFyoGQcEkBsfKTQBy8v7RPga1n1z7ZqkmnWOiQxTX+qXdu6WcLSXUtr5bS42hlmhZTnA54J2vtAOk0j4l+HNdeyFpqKOmoXLWthIykJelYPPLxHHzIYssH4DDDKSrKSAYvg/46+DPGi2UNtq0NjrFysBOiX0saXsDSwrNGskaswBKMOhI3ZXO4baAL6/GHwg3iO00FNZWXVbq7ksUhjglYJMn2rcruF2p/x43eCxGfJbGeMgFGw+Ovg2+8S6z4eOqC01vTJ7eGXT7kBbh1nW18qVYsl/LZ72GIMyr8+4dBmgDph4w0kanZadJd/Z729uJbW1guYnia4kjRndY9ygP8qOcjIIRsHg0AczZfHfwXPexWd1qw0i+uGRbSy1OMwXF2Wht5QIom+dm/0qNNmN5cMoUlTQBrRfEzQJdNv74XMrRWOpPpM6QQPcSJcq+3ZtiDnnKkf7yg4Y4oArv8YfCawapMNTeS30zm6u4rWaS2jX7Il4D5yqUIMEiOCCc5x14oAkh+K3hafTrPUE1InT7y6ns4LsW0zQu8Lukh3hCFQeW7eYSE2Iz7toLUAXfCXxB0Dx1aLc6DqKanbNu2zQo3lttIVsMRjhty/wC8ki9Y3AAOg67T70AcD8dvHmj/AAw+GOpeKde0ca9pWlT2lzLZqkbyZFzEFkjD8eZGxEi8j5kX5l+8ADhvFvjr4YW3iCw8M654Id9T167TS5beDTreXLtLbXTxXTRyEbRLeiR0YkMzSNhxKhlAMT4f/HT4ReM7y21Lw14HWW+MF7rsTLYadFPFcFGWdVBmDi5mjhbBA/eJHncUUsADoNV8bfDSyvtc8N6n8N1tk1GG71C6hk0i0mtdUjs1W68xmjd45N3nb0DncGbLBC6FwDNT48/DTw7JqIi8FXOm6l4bvrlXtX02yglt7lpLeOaVT5oCB3u0DTsyowSRi5UBmANXw54z8AeKrzxTdeH/AIepdajoOrLo95L/AGdZwyPcwXNvHFGjlsn5oomjJwq/Z0DGMquACp8M/jb8O/HWhHxp4e8F3ltp761Hp76nNpUEMou5ZIxHIQHL4ZtRlYPj+O4JwZB5gB6J4W8C+AtV0PS9b0vwd4ftYr61t7mB4bC0dhERDJGvmRbkYL5MBUozLmGMqSEU0Ablh4J8OaZeNd2egaZaXRvH1EzQWcaObl02STEhc+YyZQv94qSCSKAK03w28IXDTGbwpos3nm4aQSafCwY3DBrg/d6ykKXP8e0FskUAW7TwZ4fsNTvNRtNC0y2vL6RJrq4htEWS4kQkpJIwA3spZiGbJBYnvQBDH4B8NR2l3ajw7pAt7uJbe5i+wRBJ41Xy1SRduHURgIAeAowMDigCay8G6Bp+mPptvoenRac7ySNZR2sawlpNwkbYFA3OHcMcfMGOepyAM8NeB/D/AIMj8vQNE0/Q4PIS2EGm2qW8axo8jqiqgACh5pWwOMyMe5oA2+hH1oAOV6HH0oAFCgnCKCRgkKBx6UAAG1lPJ29CTnHOe/8AnigBeC5YqNxxzgUAIyguzdGbhmXgn8qABgCRn6AZ4+lADmYuckktnv8A56e1ACMd3PpxwKAGigBT6AUALmgAPIoABgUAANACHqPXNAGfr13f2OlyzaZpy6neh41S2acQqwLqHYuQcbVLN0OduBya0pqMn72iMqkpRXu6s4e28d+P5tUntJPhu0Ma6Z9qS6OsQmH7Xk4t92MkYH3wvBIBULhz1KjQav7T8P8Ah/6+44nXxKbXsr+kv87EU3i74lGe0ZPAdssar5lxF/akT7syFPLSTcuGCtHKSUxiKRRlmUhqnh0veqa+n+Y3VxV1an+P+Rp+JfFfjbSL+CDSvAw121dXD3MOpQQmNwE2kpIwyrMzZwcqI2OGLAFxpYZ6uo/u9fMU62Jj/wAu19/p/mVU8XePorvxNHJ4EFxFZMzaVMupwRrqS9lxuYwkHHLA5yThMbSSp4bTkn0V/XqTGtipNr2fV9VtpbqyifGvxQtNBtZZPh1b6jq7GNJre21mGKJf3UDPIGckj55Jk2fN/qM7mDKTmoYeUmud/df/ACNubFxim6ab9bf5m3qnibxnZ6lfRWvhAXtnDPCttcQ30ObqJlbzWKu6GIoQMD5t+4D5Rl1mMKDfvTsrb9n59xyqV0tIa9rrVet1b7jO1Lxb8RTYauLPwLCJhZ3EthJNqUJdp9zCGKSEPt6FSzCbH3sdADtGlhm1ep+H9fkYyr4mz5ad/O6/zJ7Xxn44/wCEL1PV7zwEYNXhjeSDQ11SKSSUhmCqZVyuSqq3A/i2gE0lTw7koOp+DCdbEwhzqnf5+va5Lo3ifxtd6wRf+EYYtLuGQwzpqC+ZbL9mt3ZZEb73717lNw2n90nyANvqXToXaU9V/mWp4vSXs9Hb8tfxINJ8RfEVfGYsdQ8JWTeH5Zbj/icQ6kqvDGs04hzCclmdFhJAIA3k55KIlDDuN1PUFUxXNb2d1935nQ+EtY8Qav5x1zQBoapGhjH2tJy8hZ94Gz+FQI8McFsnKrjFZVYQjbklf5P9TopTqS+ONtuq/wAzo+vFYHQJ9KAAr0+tAFDXNesfDVlHeajMYLaS6trNXCFszTzpBCvAON0kqLk8DOSQATQ9dwWmxzng/wCL3hLx9oFprGgalJqVjeQyXEDwWkzNKkY+chdm7IOVxjO5WX7ykUkrbDbvuQ6X8bfA2vPaLpGvxaul5KYbSfT4ZLiK6YR3Eh8qSNWWT5bS4AKkgtEyA7uKq7JsjS034meFtZuNNh07Wra9bU5biGxaAllumgx55jYDDLGTtZwdob5Sc5FIZH/wtPwmt3pFpPrltZXescadBe7rd7s5IIjDgbiMDIHQOh6OpLuKyHX/AMUPCml+JotAvddtLLVZEldYLljGD5USzSjcRt3JE6SMucqrqxGCDSeu41psXNO8aaPrF+1tY3YvduzdNaxvLCpaLzUBkVSgJTDYz0eP++uRabCsmcz4X+PXgjxj4Y0vX9N1Z303VZXt7GSa0miNxKrOpjVWQEsWjkVFGS5RggYggO4WR03/AAmejNHfvDPNeRWW4SyWdrLOmVkMbqrIpDMsiMrKpJUo2QNpwgSS0RHP8QfDdq0qSarCJEO3y1yzOwlEJjQDl3ErRxlFyQ0sa9XXLu2FkUbX4s+E72/0yyt9btp7nU322EUe5nvF2q3mQDH71Nrq5dcqEYOSFIJLsGr7lPSfjf4I1qyhu7PXobiGW7ubFPLjdmM9v/rY9u3OeVAGMsXQAEsAS7YWSNz/AITrQxph1E6hGmnm6WzW7cMIjKxAQB8YIZmCKwJVmZVBJYCkMm0jxfpOu6hdWFjdiW+s1je7tWUrLbeYodFlUjKOUZW2HDAMCQMigDYPb60Ac94/1bQtC8Mz33iOLztLhlhYp5RmZpvNTyBGgyzSmbyvLCjdv2becUAcT4V8W/C6HVNP0HR49L0q6azlutMhsYRHFPayyTMz27xjYRI0c8gUHdhGfbtG4gGnLceCo9JutXuNCVLfSZriSJ5LUPNHNJLPve3QbnEszmTBjG+RpAvL5VQBPA998P7uPwfLoOkWlha3C3Z0C5fTfsqgyZmnSHeqsplVWlwABIiFxuVcgAh8SSeAPFWq6JpOv+HLTUtSvraYaRY6rYxmSeExeZJ5Ky9AVjj3jgqfJ8zaWTIBZv8A4xeBdHstc1a6vobS20zVPsmo3M0flBL5YoSibmxudonhClcg8Jnd8tADtO1vwdqXjzWRZaf5/iPTLlNPv5bazbzYpZUhyrEDLKY1s9zDK7UiLcRHywDF8LxfDdtEmstI8NQxweGmt77+zF08A6dLPGJ4mjX7qybZmfeh+QySHIJagCXUvHnwxv8Axrp/h27+yXnifUnMFrp8Ns1wzK7LclwUDIkb+SkxckBvJBYlkwACxZfEnwB4l1Q+GdmX1i/1LRxaz2rJDeT2rN9uQr0wpB3MwAfIwWxwAZ/h/wAR/C/UvEfhSzg0W2sNZW61DTdBik01RJbm0eS2uFhdAVijK2bKBlcxhUwB8gANTwxpngGbQdP1jQvC8FvppEt5DMmm/ZGgLSjzJgrhHDMV8wSqMusauCR5eQDB8I/Fj4a/E/wh4Y1GbT1s7bxLcyXumafrEMQkubiG5EbttDMjSLIqy4BJwA45RtoB1Hh7xj4T/wCE3v8ATrPTF0zXr24WOa5FosZvHW0imAeVfvOsRACsdxWNyoKxuVAO/PO0e9AGT4q16bw5o0l9b6Rfa7OskUUenaYENxMzyLGNu9lQAbtzMzAKqsScA0AcjqnxQubGWW5b4feKbprSC+MUsNtE4cxNKNir5hcmYWxMRC4YSRhihkAoA3bPxdqV5qU0EfhfUTapdy232xnijRUSMMJmV2VjG7ZRTGH5wW2ruKgGRp/xKutaeO7g8H+IYLUaTPqS/brR7ecshiH2cQkcTEtIoDEE+WduUfdQA7xT8TL/AETwxreo6d4Q1jU9Q0/SYNVisJIWi+1mUSkW6MqufOUxYdQp2+ZH13cAG1b+Kb6aW8U+G9Tjit7mK385xGBMpx5ksalt7Inf5ctxtDc4AObsfi/dalp93dQ+BvEytb6wdGFvNaLHLM4QN9oTLbTbbmCiYsBwTjjkA6KfxZd21rfzS6Df77eZY47aNN8sq+RHKzZXKDaWkThyC0e0MWZVoAzvDnxIuNfvtGtj4Q8R6aNRhu55J76zEUVksEnl4mYtw8jEGNV3Fk+fgA4AO1//AFUANMEbTpOUXzURkVyOQpKkjPoSq/kKAHYoAM80AGKAE54+tADgxVWXoG64oATp04A6e3T/AAoAUtlQvYHIHYUANwOR0B4wOB+VADyTjqaAGZ5JLHnqM8fl70AKPkJYHGepB60AGMcglfYHFACn5iTjknJoAOM0ABbNAB25oASgAx6UAB6jHTNAHP8Ajuz8QX/hqaHwzeRafrBmgKTzMoAjEyGYAtFKoYxCQAlGwSK1pOCl+8WnYxrKpKP7t2Zy3hi1+Kttc3E2v3Pha6iaMRwwadFPGEbcw8wlySSRsLDOPlwuDknqtg0rRUl66/icUljW7txf4L+vn8jn/BuofHHW572fXtP8P6CLfT5FtbRl3RXF63llGYxzSt5a4kXOUOHDbWOAmslg4Jcrb1+4mH12V+ZKNvxN66h+KeoWGk3tjPoOm6gqhb7Tb+BmhZgZgxR43ZgpBhI5ydoJ2fMjZp4WM5LVro/uLf1ucYS0XdffYXxKPioujWf9lf8ACPf2izWouCiyMkb/AGmHzWAcjdCIRNlciQ5BVlYAGYrC26r/AIYuo8VfSz3/AKd+hp6rafEK98QabJZXmgafokM8f2u3ZJZZ54/K/eMH4C/OxAQLn92rGQh2iGK+r8r5k7+um5bWJck00vlrs/6RzcejfGMaRprPrHh46xa2ipKIyVs7m4EshZ5VNuZGDRiFcRtFtZ5jggIK6VPCu6lF2b/rW6/JnM6eNTTU1dL+tOV/mjUs4/i4dRvxdS+C1sFsAbRoo7syPebEysmWwsW/zBuGW27TtzkVm5YdraX3r/I15cUnpy/c/wDMhu9N+K5u7K+t9W8PecllDFcWBif7G03muZpEG3zc7DFtJl2/K4MeWDq08PqmmElib3TQz+yfitHfajqEes6LNK9rDDbaXcx/6BHMsriaUFIhOoeNYmVWlcK7yqdwCNRGWGulKLsuq36d9AlHE2bi1d9Ht17anV+BofF0NgV8Xz6RcXZVXU6OsqojEfMh38lQeFPUrjPILNjVdJ607/M6KKqq/tbfJHSiuc6AB5oAPpQAdwB0zQAjMVH3SxPAxjr+NAGBYeOtJ1HxFNoEL3B1iCxh1Ge2+zSYigmZ1iJkx5eWaOQBQ275GOMCgDO1r4v+E/D97DZahqMtrcz6tb6FEjWsh3306looQQpHIVstnaMEE54oA2H8ZaPFHNJNdi2hiV3aa4UxoFRN7MSeAAoYknGMGgChafE/w5fWXhe7tr2Sa28TW63emOltJ+9gYRFZXBUGNT58Iy+ADIoOGIBAKvh74u+GfFFxfw6XdXF89jrE2g3X2ezlfybyIr5iNheFAZT5n3MHlhQBd1D4keH9Kh1CW7vGgj0/UYNKumaFz5VxM0CxKcA9ftduc9AJBkjDbQDEuPjv4Ltde13Rn1lf7R0TTZtX1C3WGRmtraLl3cBTg7SjhfvMsiMFKsGoA2rz4haVp8NhPcpewQ3WlT6yWltHRoIIvJ3iSJgJFf8Afr8mzdwwIBGKAGaz8R9K8Pafa6lfw39tpdypdbqW1aMxqLeW4bzIn2yoVjhYkFM5IGM5AAH23xG0S68OW2uQzySadcvaRQyeUwZ3ujELcbSMjd58PUfLv+bGGwAQx/FDQ7vTlv7D7ZeWragunea1sbZS52/Opn8sSJh/vRltxVkXc4K0AZK/HbwtLq+laYjaj9v1C9WyWC5sJbRoi8N1LHK6ziNvKcWVwokVWBKZHy/NQBS0T9pLwH4jvfCkOm6nNdW3iaG4l07UPsksdsfKuI7YrI7qvls80gjTcAGcBAdzxq4B6f3H1oAyPFeu3Ph/SYrq002bVZ3v7K1MEAJZI5rqKGSY4VvliSRpTxjEZyQMkAHDeHPif4j8Q+HPDGp6r4K1HRWv9Hv9U1LT3gkkuLaSF4litMFU/eSq7MuQN3lkAHkgA2j8Sbm4fSfK8La+Yrq3sryV5rQKIFuBPhNxYASxGFRLuIVBKnJ3YoAiPxZaK+8QWNx4T8Ub9EitHN2mn/uL5poi+LVy2H8sjZIzBFRiNzBcsACla+M/DfiO40LXoNA1LU5hYXGox39pbGdLPakOUk8otmZ47tjFsDh0MzRsVfLgF0/ElvslzqcejX2paStml9YSaMhvJb+Py45HKFV8n/lqgUiVvMKybeEJoAvHx1PDquv2cug6nDBpkEd0l/5IFtOhiZ2RXYgvIrRyBgowu9MnLHABleJfGl9J4e8PNB4V1jUIvEGpLo1/aSRPDcaXG/miWeVlDjy0dNpdX8tgwaORlKswBa1Txjd6DZaXpmh+FtXnMszWAlEQa201I7hLfzrgFwzIQ4kUJlnRWJ2AMygCx/EC7lvvDQtvDOsrbavcX0Esk9qYzYrbLJiWT7wCTNGBHkqGWVTkdCAYukfF7Ur3w74jmvPCWs2+uaNqTRnRlh33FzZm9eGK4hCsdwaOORuoBaNsfJsdgDr5vGn2TxDNpEOg6vdXS2Ut/wDaYrYC1KxsirF5+7yzK5ZtsZYH5HLbBtyAbem38ep2FreRed5c6JOi3MLwypuUEB45FV0YA4KsqsDwQDxQBZ3bRgYAAwMDt/nP60ANI6euaAM7xBfX+m2Cz6dpjavObi3ia2SdYmETzIksgLcHy42eTbkbtm0HLCgDn9O8VeLLg2Iu/BRs/O0r7VORqccgt73co+yHC/MvLHzl4wvKjPABGnifxhJpk0jeE1tLlrieGC3+2pIywKZEhmOBtJfELlCylVlcZJjwwBa8JeLtd1jxXrem6t4WfQ7CyhtZrPUHvEmF6ZFPmrsUAxmN1ZeSdw2sMBqAOg0meS80+KeSOSJ5Mv5csZjdASSFIJPIHGe+Mjg0AWwcUAHQ+tAC9eaAAdKAAcGgAJoATqMUAGNpoAPegAJzj60AR3FzDaRh55o4UzjdIwUZ9MmgCudasOn262x/11X/ABoAP7a0/H/H9bf9/V/xoAX+2rAYxf24wc/65ev50AINZ08c/brb/v8AL/jQAf2xYDre23/f1f8AGgA/tnT8f8ftv/39X/GgA/tnT8f8f1tj/rqv+NAC/wBs2H/P9bf9/V/xoAQazp/e+tv+/q/40AA1nT+99b/9/l/xoAP7Z0//AJ/rf/v6v+NAB/bVgf8Al+tv+/y/40AB1nT/APn9tv8Av6v+NAFiC5iuow8E0cyZxujYMAfT+VAGP42fxF/wjN2nhOPTn8QSbUtX1cv9kiyw3PKE+dgF3EKvJOBkAkgA88n8S/FqTxGlzD4Z+zaJNpVxN9kmitJpoL1JbgwRHF8gG9BBkqzqzEcw5ZkAJtcn+K9rZWeqWBs715NKgafRm0mJ5Yb0NEJDGDqESZYSz5BndVECBWZiTIAbcN78QE1LxGl3ZWE1gmp2kWkPZQhJHsma3Nw8u+5ILKJbhRgIf9GLBH8xUIBm+CvEXxTbX9TtPFmgWK6Tb6gLayvdKiQG6tcXGJ2Vrtmj6WwKbSQWPUMTCAUNI1D4w6fqdm9zp+n6ppN1qdwLgXbRR3un2i3bpDtEbiKUPAYpCcq0e2TKysViABRTX/jXZz3UCeH7O7t11XVhDNPBbkmyWRmsSCt6nJjKgZTc5GyQQ4+0OAdVrl38RraHw/JYRWN3JL4kjXUIo7NEWDR2Vw27fc/NIp2N5iHOQMQsMggGb4R8cfES88eyWHiDwh/ZXh+53mzmZYRLGm6c7pJI7qVDtVbRCuFZ3uWKApA7EAp23iH4zXd5cxyeFtEsrSWWya1mkkEjQwyzxG5WZBcYMkEMkigI22VoXcMg8uKQAyNW8ZfGbwv4C8WazdeHrfUtZt9SeLS9NtLL7Y72nl24jkVYpw8g8zzwc7XbeJCsSqUoA7DV9Y+JMfjSaHTNIsZ/DkVxp4EtxbojywySRrdtHILwkmNHeT54U/1RRRKWDUAekUAHf8KAD0470AYfjKx1fUdDCaFLHFqMd5aTr5s7wpIkdzHJLGzorEB40dPukHdg8E1cWo/F2ZnNOXwd0cXoOh+Pbu4vv7S16+09rVjbWMcRtPJul+zxKHZmhkf/AFyytlvmwwyp5Wu6dTD/AGI76/noedClinrKVrafkRaX4Z+KGkaVLajxBZai0Og/Zrea6nGTf7UHms32YsQv7zBLHcNm5N25zhKVGXRo3UMRH7SNDS7D4kWumXJvdQ06+uZLW7EQjkVXgl8yZrcj/R0WRtphRi3lqcZ2jBMkVHTa9xGtKNaLbqMzvA3hD4oTza5F4z8bhIHuoW019CjthIkIR1dJTJZgEklGLrjcUBVYgShwOkrX/hD4s3vgmGCz8appniYCJXuZWtbqPAuWMrFhp8YJNu+BiJRvijByN5cAt3/hn4p3Wu6hdW/imzj0qV4BaWKmOJlQ3k0kzO7WjlWFv9niVRkHEoY7ystAD7Twx8TLjwd4Z+1+MI4fE9m9xJqhhhtza32RIYoz/ooZVDiEfIEIRnyzsFegDP0Pwz8X4dJiN/4tsZtQbR7xGifyZYU1IsgtJMiziYxKolZ+RlnAC7RyANTw38YrrwtrtjJr+mW2si/s7vRb9rxZ/wByoiFxBdBLGFSuUkcbAGfzdm6MLuIBLe+D/ilfeEPEtoPFFrDrsq2R0a9e5Rkt2TaZd6pZocschi3mLIeRHbqfKABLpdj8T18WeNrOS5EmgrYW0Ph/V7+5t0ka4ECLI5higJ3NIZmd5RtUrEI4WBfABZ8J+F/iRaT+FZvEfieLVJYL6+uNYjtZI4bdoXjdLaKJBaK8qoSh+Z0IO4kyjYFAPUPxoADwRQB//9k="},{"timing":2400,"timestamp":18151719409,"data":"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"},{"timing":2700,"timestamp":18152019409,"data":"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"},{"timing":3000,"timestamp":18152319409,"data":"/9j/4AAQSkZJRgABAQAAAQABAAD/2wCEAAMCAgMCAgMDAwMEAwMEBQgFBQQEBQoHBwYIDAoMDAsKCwsNDhIQDQ4RDgsLEBYQERMUFRUVDA8XGBYUGBIUFRQBAwQEBQQFCQUFCRQNCw0UFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFBQUFP/AABEIAMAAeAMBEQACEQEDEQH/xAGiAAABBQEBAQEBAQAAAAAAAAAAAQIDBAUGBwgJCgsQAAIBAwMCBAMFBQQEAAABfQECAwAEEQUSITFBBhNRYQcicRQygZGhCCNCscEVUtHwJDNicoIJChYXGBkaJSYnKCkqNDU2Nzg5OkNERUZHSElKU1RVVldYWVpjZGVmZ2hpanN0dXZ3eHl6g4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2drh4uPk5ebn6Onq8fLz9PX29/j5+gEAAwEBAQEBAQEBAQAAAAAAAAECAwQFBgcICQoLEQACAQIEBAMEBwUEBAABAncAAQIDEQQFITEGEkFRB2FxEyIygQgUQpGhscEJIzNS8BVictEKFiQ04SXxFxgZGiYnKCkqNTY3ODk6Q0RFRkdISUpTVFVWV1hZWmNkZWZnaGlqc3R1dnd4eXqCg4SFhoeIiYqSk5SVlpeYmZqio6Slpqeoqaqys7S1tre4ubrCw8TFxsfIycrS09TV1tfY2dri4+Tl5ufo6ery8/T19vf4+fr/2gAMAwEAAhEDEQA/APjKgAoAKACgAoAKACgAoAKACgAoAKACgAoAKAPRf2dfCWlePPjj4M8Pa5am+0jUb9YLm3EjR+YpB43IQw/AigD2+b9nbwF8UrvwbBomoWngrWLi38vxBZeHWn8R6fZXEt6ILFTdJJJFGZlLlg9xxsUBdxAYA8t8Z/s6XXgn+2oL/WY/7R0rw/LrNxBDb7oxLHrB0x4FfeCRuUybyOnG3vQAzxX4C0PTvHXx6062sBFaeGPtP9kR+dIfs2zW7S2Xkkl/3MsifOT97P3gCADrNW/Z78H6Lc6t4bj8a2N/eWninS9EvvEtxazWkGleY2prcxlHcK+BZwvuOFyxUPj5yAdQv7I3h660Cbw4NcuLDxr/AMJLc6VptxfaTcRSai66Za3UdrJD5hjt0DyyDzsvncpXehDAA+TD1OKACgAoAKACgAoAKACgAoA3PBOqa5oXiez1Xw3cSWms6cJL2C4jKgxeUjSO/wA3HCKx5oA6nwTqHxF8EXF3ZeG5rnSDqa2c80S+UIpNrxy20v7zKh42kjdZBhoyScr8xoALz4l/EjxTpl7pFzqGo6nZ6zLLJNC9uH+0Gab7U67tudhlzKFB2qzOwA3NkAyNe1bxda+IPFUmqm4/tPWJpYdZkdAftD+cty4ZgMf62JJMrx8g7ZoAJ/F/i6+ub67nee5fV9Sj1m7aW0V0vLtS+2R1K7XB+0uNuCredgghgKANpfi58SV1Czvk1S/F3Zai9/aSR26nyLny44P3YC4G2OOKMRgbVVVAA4oA8/ubK5gj8+W2khiZtu8oQueeM/gfyNAFegAoAKACgAoAKACgAoAvaJruoeHL9b7S7uSxvUV0S4hOHTcpUlT2OGIyMEZ4IPNAHQN8XPGBmtpv7Z8y4t4xHHNPawyuQDGQXLLl2BhiIdssDGpByM0AC/FPXl8LaboPmWxtdOv/AO0LaQ26l0kw4xg/KVzI5wVOdxBJX5aAFf4ueLn8gf2zKqw3Ut6oREB86TzN7ZxnnzZMg5B3dMcUAVp/iZ4nuZ0ml1id5Yt/kuQuYQwkUhMAbRiVxhcYyMY2rtAJLj4ma5cwaIHmjN3o8009vfMpeZmklMrby5IPzFuwyG5zgYAKHiLxrrPizB1W7S7cbQJGt41cKrSMACqgjLSyM2PvFsnJAwAYlABQAUAFABQAUAFABQB+ky/sHfCiZ1it7XW7m4fIjgj1ABpCBnAJAA4BPJA460AU7z9hz4Xadq8OlXWla3banNbvdR2cuvWSzPCuN0gQy5KjPJxgUAX7T/gn74Bv4BNbeGvEk8RLLvj1i0YblJVhxJ1DAgjsQRQBN/w7y8Ef9Cp4n/8ABta//HKAD/h3l4I/6FTxP/4NrX/45QAf8O8vBH/QqeKP/Bta/wDxygA/4d5eCP8AoVPFH/g2tf8A45QBD/wwN8LlmFvLY67b3ZIX7PJqC7gT0GQCDnI5BI96ANmP/gnH8MJlYxf2hNsYoxj1MnBH3h/q+2efSgAX/gnF8MJXlSNr93ibZIq6oSY22htrDy+DhgcH1oAf/wAO3Php/c1L/wAGR/8AjdAB/wAO3Php/c1L/wAGR/8AjdAB/wAO3Php/c1L/wAGR/8AjdAB/wAO3Php/c1L/wAGR/8AjdAFTU/+CeHwu0mBJp49V2MwQbNRzzyf7g9KAParHwR4y02+gu4LeFJ4WJQi4XuCp/MEjI5GeOaAJbnwR4kuLyzuY9CsLGW0t47WIafeSWsawxypKkeyKRQVDIOCMFSynKuwIBpeHtM8beF9Ht9N03TLCG1h3H95ctLJI7MWeSSR3Z3dmJZnYlmYkkkkmgDR+3fEUf8ALjp34OP/AIqgA+3fEQ/8uOnfi4/+KoAPt3xFH/Llp34OP/iqAD7b8Rev2HT8f74z/wChUAYFx4X8cXmsf2nNFA115gk3eagAI6AAdhgD19cnmgCtq/wzv9e1PUNQvvC1lPdX2z7RINSmUuEGFU4k+6ODt6ZVT/CMAG9pGleJtCNwbHw7p8Hn7PM/0tmzsUKvVzgBQBgYHFAGh9r8a/8AQF0//wACP/sqAD7X41/6Aun/APgR/wDZUAH2vxr/ANAXT/8AwI/+yoAPtfjX/oC6f/4Ef/ZUAZfiDTfGviG1jtpNOsoI0cSAR3HU4I5JJ9TQB6dnmgAzigBMHFAB0oAUYPagBOtAC54oATsRQAdB9aAAnFAC4NACd+BzQAGgBaAE7j60AVtUs31Cz+zpO9qTJG5lj64V1Yr+OMHrwTQBjaJ4Z1LSLS5STXWv5W8oRSXFtnYqgAj7+ckAc5GDluSaAILTwffW7WhbX75/KkV3LOSX2vM2DknORKoPf92v4AFjXvDV/rMjyrrMlk4EqILdGUYeNRk4cbmDLkEnvjBFAGnpWmvpq3Ye6kuzPcSTqZP+Was2QgGTwOlAF4e9AB2oAXtigAHPWgBM8UALigBKAFxzigBKAAn7v1oA53x/c+J7Tw3u8HW9lc69Je2UC/2jGZIIrd7qJLqZlEkZYx27TSBQ4JKADJOCAeMT+F/jbq3jOOK+1FIPDV14sj1OSSwvBFLaaWba/j+yNjB+XytMYiPeDPPMdxiHygFDWZf2jrC9+J9roenWU+nz3N5L4cvLuS3kuV3WF2YREWuAiKt1DYoFljI/0iRm+UEqAadj4t/aK1BPGzXPgnw/pn9nQX0vh4mZZH1eVWnFnDKgvNtvkfZmdi7qQJBlCwKAHK+K9d/al1HXorSx8I6PHZ6Vc6hcw6jBPHaxX7Ql0skkT7dI7wTKyyOpCMG+XACb3APQ7fXvi1J8UvA8l14NmXwxdaFbnWri31a1SOwv5N5nja3LsziPZGNyu/LJsYr528ApX1z8dfDuozJp2lad4mt3e2WGW8uYVxC1vfySB1V4tjx3P2KFnAkzCySASSb1QAn8J+IPjYvivSV1bwhp6aRqGoS/2vLJeoP7OiW0sRH9m2TyGRGm+2csqsduSsf8YBwnhu8/aQ8I6LpB03w1N4glkOkQava+MNSs3kSXyrk6nc20sE/EJYWiorlmBLbYgMmgCr4Y8dftP+CPAMlvq/w+sNafR9BtvIvpJUuLy7nh0iV7jzljvneWR79LeNSi5dWkJClgVAK3hT4t/tCfEW/0+E+Bn0S90uH+0ZGudKudPs7p5fD8pWB/PuVMgj1KWONkByRtbMZjdgAdfoPxJ+MviTxh8TPCOqeErnRl0kyvo+s6bp/lrqVtuttptrmeZ7cXRie4ZUkHliQxByBFMCAYt9q/7Q621r4c0fwNqEejm/t/+Jzrut2M+oR2i3F40nmSwXEfzlY9OwqpJhJLhWkdtpABd+DPiH9pZvifZx+NvBWk2Pg3WLk3OqXj30Tz6YU0mFPJtoku5QsLXkbFTmRjvdmWPcMAH076euaAMHx341svh74bl1rULa9urWOe2tjFp8BnmZ5544IwsY5b55V4GTjOATxQBST4reEmvZ7Ea3btqkFnHfTaYm57xIZH8tSYAC+d5CbQu4MygjLDIBasPiHoOraXYalpl8ur6ffM6213p48+CQq20/vFyoGQcEkBsfKTQBy8v7RPga1n1z7ZqkmnWOiQxTX+qXdu6WcLSXUtr5bS42hlmhZTnA54J2vtAOk0j4l+HNdeyFpqKOmoXLWthIykJelYPPLxHHzIYssH4DDDKSrKSAYvg/46+DPGi2UNtq0NjrFysBOiX0saXsDSwrNGskaswBKMOhI3ZXO4baAL6/GHwg3iO00FNZWXVbq7ksUhjglYJMn2rcruF2p/x43eCxGfJbGeMgFGw+Ovg2+8S6z4eOqC01vTJ7eGXT7kBbh1nW18qVYsl/LZ72GIMyr8+4dBmgDph4w0kanZadJd/Z729uJbW1guYnia4kjRndY9ygP8qOcjIIRsHg0AczZfHfwXPexWd1qw0i+uGRbSy1OMwXF2Wht5QIom+dm/0qNNmN5cMoUlTQBrRfEzQJdNv74XMrRWOpPpM6QQPcSJcq+3ZtiDnnKkf7yg4Y4oArv8YfCawapMNTeS30zm6u4rWaS2jX7Il4D5yqUIMEiOCCc5x14oAkh+K3hafTrPUE1InT7y6ns4LsW0zQu8Lukh3hCFQeW7eYSE2Iz7toLUAXfCXxB0Dx1aLc6DqKanbNu2zQo3lttIVsMRjhty/wC8ki9Y3AAOg67T70AcD8dvHmj/AAw+GOpeKde0ca9pWlT2lzLZqkbyZFzEFkjD8eZGxEi8j5kX5l+8ADhvFvjr4YW3iCw8M654Id9T167TS5beDTreXLtLbXTxXTRyEbRLeiR0YkMzSNhxKhlAMT4f/HT4ReM7y21Lw14HWW+MF7rsTLYadFPFcFGWdVBmDi5mjhbBA/eJHncUUsADoNV8bfDSyvtc8N6n8N1tk1GG71C6hk0i0mtdUjs1W68xmjd45N3nb0DncGbLBC6FwDNT48/DTw7JqIi8FXOm6l4bvrlXtX02yglt7lpLeOaVT5oCB3u0DTsyowSRi5UBmANXw54z8AeKrzxTdeH/AIepdajoOrLo95L/AGdZwyPcwXNvHFGjlsn5oomjJwq/Z0DGMquACp8M/jb8O/HWhHxp4e8F3ltp761Hp76nNpUEMou5ZIxHIQHL4ZtRlYPj+O4JwZB5gB6J4W8C+AtV0PS9b0vwd4ftYr61t7mB4bC0dhERDJGvmRbkYL5MBUozLmGMqSEU0Ablh4J8OaZeNd2egaZaXRvH1EzQWcaObl02STEhc+YyZQv94qSCSKAK03w28IXDTGbwpos3nm4aQSafCwY3DBrg/d6ykKXP8e0FskUAW7TwZ4fsNTvNRtNC0y2vL6RJrq4htEWS4kQkpJIwA3spZiGbJBYnvQBDH4B8NR2l3ajw7pAt7uJbe5i+wRBJ41Xy1SRduHURgIAeAowMDigCay8G6Bp+mPptvoenRac7ySNZR2sawlpNwkbYFA3OHcMcfMGOepyAM8NeB/D/AIMj8vQNE0/Q4PIS2EGm2qW8axo8jqiqgACh5pWwOMyMe5oA2+hH1oAOV6HH0oAFCgnCKCRgkKBx6UAAG1lPJ29CTnHOe/8AnigBeC5YqNxxzgUAIyguzdGbhmXgn8qABgCRn6AZ4+lADmYuckktnv8A56e1ACMd3PpxwKAGigBT6AUALmgAPIoABgUAANACHqPXNAGfr13f2OlyzaZpy6neh41S2acQqwLqHYuQcbVLN0OduBya0pqMn72iMqkpRXu6s4e28d+P5tUntJPhu0Ma6Z9qS6OsQmH7Xk4t92MkYH3wvBIBULhz1KjQav7T8P8Ah/6+44nXxKbXsr+kv87EU3i74lGe0ZPAdssar5lxF/akT7syFPLSTcuGCtHKSUxiKRRlmUhqnh0veqa+n+Y3VxV1an+P+Rp+JfFfjbSL+CDSvAw121dXD3MOpQQmNwE2kpIwyrMzZwcqI2OGLAFxpYZ6uo/u9fMU62Jj/wAu19/p/mVU8XePorvxNHJ4EFxFZMzaVMupwRrqS9lxuYwkHHLA5yThMbSSp4bTkn0V/XqTGtipNr2fV9VtpbqyifGvxQtNBtZZPh1b6jq7GNJre21mGKJf3UDPIGckj55Jk2fN/qM7mDKTmoYeUmud/df/ACNubFxim6ab9bf5m3qnibxnZ6lfRWvhAXtnDPCttcQ30ObqJlbzWKu6GIoQMD5t+4D5Rl1mMKDfvTsrb9n59xyqV0tIa9rrVet1b7jO1Lxb8RTYauLPwLCJhZ3EthJNqUJdp9zCGKSEPt6FSzCbH3sdADtGlhm1ep+H9fkYyr4mz5ad/O6/zJ7Xxn44/wCEL1PV7zwEYNXhjeSDQ11SKSSUhmCqZVyuSqq3A/i2gE0lTw7koOp+DCdbEwhzqnf5+va5Lo3ifxtd6wRf+EYYtLuGQwzpqC+ZbL9mt3ZZEb73717lNw2n90nyANvqXToXaU9V/mWp4vSXs9Hb8tfxINJ8RfEVfGYsdQ8JWTeH5Zbj/icQ6kqvDGs04hzCclmdFhJAIA3k55KIlDDuN1PUFUxXNb2d1935nQ+EtY8Qav5x1zQBoapGhjH2tJy8hZ94Gz+FQI8McFsnKrjFZVYQjbklf5P9TopTqS+ONtuq/wAzo+vFYHQJ9KAAr0+tAFDXNesfDVlHeajMYLaS6trNXCFszTzpBCvAON0kqLk8DOSQATQ9dwWmxzng/wCL3hLx9oFprGgalJqVjeQyXEDwWkzNKkY+chdm7IOVxjO5WX7ykUkrbDbvuQ6X8bfA2vPaLpGvxaul5KYbSfT4ZLiK6YR3Eh8qSNWWT5bS4AKkgtEyA7uKq7JsjS034meFtZuNNh07Wra9bU5biGxaAllumgx55jYDDLGTtZwdob5Sc5FIZH/wtPwmt3pFpPrltZXescadBe7rd7s5IIjDgbiMDIHQOh6OpLuKyHX/AMUPCml+JotAvddtLLVZEldYLljGD5USzSjcRt3JE6SMucqrqxGCDSeu41psXNO8aaPrF+1tY3YvduzdNaxvLCpaLzUBkVSgJTDYz0eP++uRabCsmcz4X+PXgjxj4Y0vX9N1Z303VZXt7GSa0miNxKrOpjVWQEsWjkVFGS5RggYggO4WR03/AAmejNHfvDPNeRWW4SyWdrLOmVkMbqrIpDMsiMrKpJUo2QNpwgSS0RHP8QfDdq0qSarCJEO3y1yzOwlEJjQDl3ErRxlFyQ0sa9XXLu2FkUbX4s+E72/0yyt9btp7nU322EUe5nvF2q3mQDH71Nrq5dcqEYOSFIJLsGr7lPSfjf4I1qyhu7PXobiGW7ubFPLjdmM9v/rY9u3OeVAGMsXQAEsAS7YWSNz/AITrQxph1E6hGmnm6WzW7cMIjKxAQB8YIZmCKwJVmZVBJYCkMm0jxfpOu6hdWFjdiW+s1je7tWUrLbeYodFlUjKOUZW2HDAMCQMigDYPb60Ac94/1bQtC8Mz33iOLztLhlhYp5RmZpvNTyBGgyzSmbyvLCjdv2becUAcT4V8W/C6HVNP0HR49L0q6azlutMhsYRHFPayyTMz27xjYRI0c8gUHdhGfbtG4gGnLceCo9JutXuNCVLfSZriSJ5LUPNHNJLPve3QbnEszmTBjG+RpAvL5VQBPA998P7uPwfLoOkWlha3C3Z0C5fTfsqgyZmnSHeqsplVWlwABIiFxuVcgAh8SSeAPFWq6JpOv+HLTUtSvraYaRY6rYxmSeExeZJ5Ky9AVjj3jgqfJ8zaWTIBZv8A4xeBdHstc1a6vobS20zVPsmo3M0flBL5YoSibmxudonhClcg8Jnd8tADtO1vwdqXjzWRZaf5/iPTLlNPv5bazbzYpZUhyrEDLKY1s9zDK7UiLcRHywDF8LxfDdtEmstI8NQxweGmt77+zF08A6dLPGJ4mjX7qybZmfeh+QySHIJagCXUvHnwxv8Axrp/h27+yXnifUnMFrp8Ns1wzK7LclwUDIkb+SkxckBvJBYlkwACxZfEnwB4l1Q+GdmX1i/1LRxaz2rJDeT2rN9uQr0wpB3MwAfIwWxwAZ/h/wAR/C/UvEfhSzg0W2sNZW61DTdBik01RJbm0eS2uFhdAVijK2bKBlcxhUwB8gANTwxpngGbQdP1jQvC8FvppEt5DMmm/ZGgLSjzJgrhHDMV8wSqMusauCR5eQDB8I/Fj4a/E/wh4Y1GbT1s7bxLcyXumafrEMQkubiG5EbttDMjSLIqy4BJwA45RtoB1Hh7xj4T/wCE3v8ATrPTF0zXr24WOa5FosZvHW0imAeVfvOsRACsdxWNyoKxuVAO/PO0e9AGT4q16bw5o0l9b6Rfa7OskUUenaYENxMzyLGNu9lQAbtzMzAKqsScA0AcjqnxQubGWW5b4feKbprSC+MUsNtE4cxNKNir5hcmYWxMRC4YSRhihkAoA3bPxdqV5qU0EfhfUTapdy232xnijRUSMMJmV2VjG7ZRTGH5wW2ruKgGRp/xKutaeO7g8H+IYLUaTPqS/brR7ecshiH2cQkcTEtIoDEE+WduUfdQA7xT8TL/AETwxreo6d4Q1jU9Q0/SYNVisJIWi+1mUSkW6MqufOUxYdQp2+ZH13cAG1b+Kb6aW8U+G9Tjit7mK385xGBMpx5ksalt7Inf5ctxtDc4AObsfi/dalp93dQ+BvEytb6wdGFvNaLHLM4QN9oTLbTbbmCiYsBwTjjkA6KfxZd21rfzS6Df77eZY47aNN8sq+RHKzZXKDaWkThyC0e0MWZVoAzvDnxIuNfvtGtj4Q8R6aNRhu55J76zEUVksEnl4mYtw8jEGNV3Fk+fgA4AO1//AFUANMEbTpOUXzURkVyOQpKkjPoSq/kKAHYoAM80AGKAE54+tADgxVWXoG64oATp04A6e3T/AAoAUtlQvYHIHYUANwOR0B4wOB+VADyTjqaAGZ5JLHnqM8fl70AKPkJYHGepB60AGMcglfYHFACn5iTjknJoAOM0ABbNAB25oASgAx6UAB6jHTNAHP8Ajuz8QX/hqaHwzeRafrBmgKTzMoAjEyGYAtFKoYxCQAlGwSK1pOCl+8WnYxrKpKP7t2Zy3hi1+Kttc3E2v3Pha6iaMRwwadFPGEbcw8wlySSRsLDOPlwuDknqtg0rRUl66/icUljW7txf4L+vn8jn/BuofHHW572fXtP8P6CLfT5FtbRl3RXF63llGYxzSt5a4kXOUOHDbWOAmslg4Jcrb1+4mH12V+ZKNvxN66h+KeoWGk3tjPoOm6gqhb7Tb+BmhZgZgxR43ZgpBhI5ydoJ2fMjZp4WM5LVro/uLf1ucYS0XdffYXxKPioujWf9lf8ACPf2izWouCiyMkb/AGmHzWAcjdCIRNlciQ5BVlYAGYrC26r/AIYuo8VfSz3/AKd+hp6rafEK98QabJZXmgafokM8f2u3ZJZZ54/K/eMH4C/OxAQLn92rGQh2iGK+r8r5k7+um5bWJck00vlrs/6RzcejfGMaRprPrHh46xa2ipKIyVs7m4EshZ5VNuZGDRiFcRtFtZ5jggIK6VPCu6lF2b/rW6/JnM6eNTTU1dL+tOV/mjUs4/i4dRvxdS+C1sFsAbRoo7syPebEysmWwsW/zBuGW27TtzkVm5YdraX3r/I15cUnpy/c/wDMhu9N+K5u7K+t9W8PecllDFcWBif7G03muZpEG3zc7DFtJl2/K4MeWDq08PqmmElib3TQz+yfitHfajqEes6LNK9rDDbaXcx/6BHMsriaUFIhOoeNYmVWlcK7yqdwCNRGWGulKLsuq36d9AlHE2bi1d9Ht17anV+BofF0NgV8Xz6RcXZVXU6OsqojEfMh38lQeFPUrjPILNjVdJ607/M6KKqq/tbfJHSiuc6AB5oAPpQAdwB0zQAjMVH3SxPAxjr+NAGBYeOtJ1HxFNoEL3B1iCxh1Ge2+zSYigmZ1iJkx5eWaOQBQ275GOMCgDO1r4v+E/D97DZahqMtrcz6tb6FEjWsh3306looQQpHIVstnaMEE54oA2H8ZaPFHNJNdi2hiV3aa4UxoFRN7MSeAAoYknGMGgChafE/w5fWXhe7tr2Sa28TW63emOltJ+9gYRFZXBUGNT58Iy+ADIoOGIBAKvh74u+GfFFxfw6XdXF89jrE2g3X2ezlfybyIr5iNheFAZT5n3MHlhQBd1D4keH9Kh1CW7vGgj0/UYNKumaFz5VxM0CxKcA9ftduc9AJBkjDbQDEuPjv4Ltde13Rn1lf7R0TTZtX1C3WGRmtraLl3cBTg7SjhfvMsiMFKsGoA2rz4haVp8NhPcpewQ3WlT6yWltHRoIIvJ3iSJgJFf8Afr8mzdwwIBGKAGaz8R9K8Pafa6lfw39tpdypdbqW1aMxqLeW4bzIn2yoVjhYkFM5IGM5AAH23xG0S68OW2uQzySadcvaRQyeUwZ3ujELcbSMjd58PUfLv+bGGwAQx/FDQ7vTlv7D7ZeWragunea1sbZS52/Opn8sSJh/vRltxVkXc4K0AZK/HbwtLq+laYjaj9v1C9WyWC5sJbRoi8N1LHK6ziNvKcWVwokVWBKZHy/NQBS0T9pLwH4jvfCkOm6nNdW3iaG4l07UPsksdsfKuI7YrI7qvls80gjTcAGcBAdzxq4B6f3H1oAyPFeu3Ph/SYrq002bVZ3v7K1MEAJZI5rqKGSY4VvliSRpTxjEZyQMkAHDeHPif4j8Q+HPDGp6r4K1HRWv9Hv9U1LT3gkkuLaSF4litMFU/eSq7MuQN3lkAHkgA2j8Sbm4fSfK8La+Yrq3sryV5rQKIFuBPhNxYASxGFRLuIVBKnJ3YoAiPxZaK+8QWNx4T8Ub9EitHN2mn/uL5poi+LVy2H8sjZIzBFRiNzBcsACla+M/DfiO40LXoNA1LU5hYXGox39pbGdLPakOUk8otmZ47tjFsDh0MzRsVfLgF0/ElvslzqcejX2paStml9YSaMhvJb+Py45HKFV8n/lqgUiVvMKybeEJoAvHx1PDquv2cug6nDBpkEd0l/5IFtOhiZ2RXYgvIrRyBgowu9MnLHABleJfGl9J4e8PNB4V1jUIvEGpLo1/aSRPDcaXG/miWeVlDjy0dNpdX8tgwaORlKswBa1Txjd6DZaXpmh+FtXnMszWAlEQa201I7hLfzrgFwzIQ4kUJlnRWJ2AMygCx/EC7lvvDQtvDOsrbavcX0Esk9qYzYrbLJiWT7wCTNGBHkqGWVTkdCAYukfF7Ur3w74jmvPCWs2+uaNqTRnRlh33FzZm9eGK4hCsdwaOORuoBaNsfJsdgDr5vGn2TxDNpEOg6vdXS2Ut/wDaYrYC1KxsirF5+7yzK5ZtsZYH5HLbBtyAbem38ep2FreRed5c6JOi3MLwypuUEB45FV0YA4KsqsDwQDxQBZ3bRgYAAwMDt/nP60ANI6euaAM7xBfX+m2Cz6dpjavObi3ia2SdYmETzIksgLcHy42eTbkbtm0HLCgDn9O8VeLLg2Iu/BRs/O0r7VORqccgt73co+yHC/MvLHzl4wvKjPABGnifxhJpk0jeE1tLlrieGC3+2pIywKZEhmOBtJfELlCylVlcZJjwwBa8JeLtd1jxXrem6t4WfQ7CyhtZrPUHvEmF6ZFPmrsUAxmN1ZeSdw2sMBqAOg0meS80+KeSOSJ5Mv5csZjdASSFIJPIHGe+Mjg0AWwcUAHQ+tAC9eaAAdKAAcGgAJoATqMUAGNpoAPegAJzj60AR3FzDaRh55o4UzjdIwUZ9MmgCudasOn262x/11X/ABoAP7a0/H/H9bf9/V/xoAX+2rAYxf24wc/65ev50AINZ08c/brb/v8AL/jQAf2xYDre23/f1f8AGgA/tnT8f8ftv/39X/GgA/tnT8f8f1tj/rqv+NAC/wBs2H/P9bf9/V/xoAQazp/e+tv+/q/40AA1nT+99b/9/l/xoAP7Z0//AJ/rf/v6v+NAB/bVgf8Al+tv+/y/40AB1nT/APn9tv8Av6v+NAFiC5iuow8E0cyZxujYMAfT+VAGP42fxF/wjN2nhOPTn8QSbUtX1cv9kiyw3PKE+dgF3EKvJOBkAkgA88n8S/FqTxGlzD4Z+zaJNpVxN9kmitJpoL1JbgwRHF8gG9BBkqzqzEcw5ZkAJtcn+K9rZWeqWBs715NKgafRm0mJ5Yb0NEJDGDqESZYSz5BndVECBWZiTIAbcN78QE1LxGl3ZWE1gmp2kWkPZQhJHsma3Nw8u+5ILKJbhRgIf9GLBH8xUIBm+CvEXxTbX9TtPFmgWK6Tb6gLayvdKiQG6tcXGJ2Vrtmj6WwKbSQWPUMTCAUNI1D4w6fqdm9zp+n6ppN1qdwLgXbRR3un2i3bpDtEbiKUPAYpCcq0e2TKysViABRTX/jXZz3UCeH7O7t11XVhDNPBbkmyWRmsSCt6nJjKgZTc5GyQQ4+0OAdVrl38RraHw/JYRWN3JL4kjXUIo7NEWDR2Vw27fc/NIp2N5iHOQMQsMggGb4R8cfES88eyWHiDwh/ZXh+53mzmZYRLGm6c7pJI7qVDtVbRCuFZ3uWKApA7EAp23iH4zXd5cxyeFtEsrSWWya1mkkEjQwyzxG5WZBcYMkEMkigI22VoXcMg8uKQAyNW8ZfGbwv4C8WazdeHrfUtZt9SeLS9NtLL7Y72nl24jkVYpw8g8zzwc7XbeJCsSqUoA7DV9Y+JMfjSaHTNIsZ/DkVxp4EtxbojywySRrdtHILwkmNHeT54U/1RRRKWDUAekUAHf8KAD0470AYfjKx1fUdDCaFLHFqMd5aTr5s7wpIkdzHJLGzorEB40dPukHdg8E1cWo/F2ZnNOXwd0cXoOh+Pbu4vv7S16+09rVjbWMcRtPJul+zxKHZmhkf/AFyytlvmwwyp5Wu6dTD/AGI76/noedClinrKVrafkRaX4Z+KGkaVLajxBZai0Og/Zrea6nGTf7UHms32YsQv7zBLHcNm5N25zhKVGXRo3UMRH7SNDS7D4kWumXJvdQ06+uZLW7EQjkVXgl8yZrcj/R0WRtphRi3lqcZ2jBMkVHTa9xGtKNaLbqMzvA3hD4oTza5F4z8bhIHuoW019CjthIkIR1dJTJZgEklGLrjcUBVYgShwOkrX/hD4s3vgmGCz8appniYCJXuZWtbqPAuWMrFhp8YJNu+BiJRvijByN5cAt3/hn4p3Wu6hdW/imzj0qV4BaWKmOJlQ3k0kzO7WjlWFv9niVRkHEoY7ystAD7Twx8TLjwd4Z+1+MI4fE9m9xJqhhhtza32RIYoz/ooZVDiEfIEIRnyzsFegDP0Pwz8X4dJiN/4tsZtQbR7xGifyZYU1IsgtJMiziYxKolZ+RlnAC7RyANTw38YrrwtrtjJr+mW2si/s7vRb9rxZ/wByoiFxBdBLGFSuUkcbAGfzdm6MLuIBLe+D/ilfeEPEtoPFFrDrsq2R0a9e5Rkt2TaZd6pZocschi3mLIeRHbqfKABLpdj8T18WeNrOS5EmgrYW0Ph/V7+5t0ka4ECLI5higJ3NIZmd5RtUrEI4WBfABZ8J+F/iRaT+FZvEfieLVJYL6+uNYjtZI4bdoXjdLaKJBaK8qoSh+Z0IO4kyjYFAPUPxoADwRQB//9k="}]}},"final-screenshot":{"id":"final-screenshot","title":"Final Screenshot","description":"The last screenshot captured of the pageload.","score":null,"scoreDisplayMode":"informative","rawValue":true,"details":{"type":"screenshot","timestamp":18151021.99,"data":"data:image/jpeg;base64,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"}},"estimated-input-latency":{"id":"estimated-input-latency","title":"Estimated Input Latency","description":"Estimated Input Latency is an estimate of how long your app takes to respond to user input, in milliseconds, during the busiest 5s window of page load. If your latency is higher than 50 ms, users may perceive your app as laggy. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/estimated-input-latency).","score":1,"scoreDisplayMode":"numeric","rawValue":12.8,"displayValue":"10 ms"},"max-potential-fid":{"id":"max-potential-fid","title":"Max Potential FID","description":"The potential First Input Delay that your users could experience is the duration, in milliseconds, of the longest task.","score":1,"scoreDisplayMode":"numeric","rawValue":54,"displayValue":"50 ms"},"errors-in-console":{"id":"errors-in-console","title":"No browser errors logged to the console","description":"Errors logged to the console indicate unresolved problems. They can come from network request failures and other browser concerns.","score":1,"scoreDisplayMode":"binary","rawValue":0,"details":{"type":"table","headings":[],"items":[]}},"time-to-first-byte":{"id":"time-to-first-byte","title":"Server response times are low (TTFB)","description":"Time To First Byte identifies the time at which your server sends a response. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/ttfb).","score":1,"scoreDisplayMode":"binary","rawValue":106.27999999999999,"displayValue":"Root document took 110 ms","details":{"type":"opportunity","overallSavingsMs":-493.72,"headings":[],"items":[]}},"first-cpu-idle":{"id":"first-cpu-idle","title":"First CPU Idle","description":"First CPU Idle marks the first time at which the page's main thread is quiet enough to handle input. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/first-interactive).","score":1,"scoreDisplayMode":"numeric","rawValue":1699.7000000000003,"displayValue":"1.7 s"},"interactive":{"id":"interactive","title":"Time to Interactive","description":"Time to interactive is the amount of time it takes for the page to become fully interactive. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/consistently-interactive).","score":1,"scoreDisplayMode":"numeric","rawValue":1943.3435000000004,"displayValue":"1.9 s"},"user-timings":{"id":"user-timings","title":"User Timing marks and measures","description":"Consider instrumenting your app with the User Timing API to measure your app's real-world performance during key user experiences. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/user-timing).","score":null,"scoreDisplayMode":"informative","rawValue":false,"displayValue":"4 user timings","details":{"type":"table","headings":[{"key":"name","itemType":"text","text":"Name"},{"key":"timingType","itemType":"text","text":"Type"},{"key":"startTime","itemType":"ms","granularity":0.01,"text":"Start Time"},{"key":"duration","itemType":"ms","granularity":0.01,"text":"Duration"}],"items":[{"name":"HTML (nearly) done parsing","startTime":0,"duration":470.385,"timingType":"Measure"},{"name":"evaling scripts","startTime":459.155,"duration":11.23,"timingType":"Measure"},{"name":"scripts","startTime":459.17,"timingType":"Mark"},{"name":"endOfDOM","startTime":470.391,"timingType":"Mark"}]}},"critical-request-chains":{"id":"critical-request-chains","title":"Minimize Critical Requests Depth","description":"The Critical Request Chains below show you what resources are loaded with a high priority. Consider reducing the length of chains, reducing the download size of resources, or deferring the download of unnecessary resources to improve page load. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/critical-request-chains).","score":null,"scoreDisplayMode":"informative","rawValue":false,"displayValue":"7 chains found","details":{"type":"criticalrequestchain","chains":{"D71F0E9061620A76563FC1484B9D6125":{"request":{"url":"https://www.paulirish.com/","startTime":18149.320976,"endTime":18149.546593,"responseReceivedTime":18149.53167,"transferSize":22341},"children":{"1000060260.9":{"request":{"url":"https://fonts.googleapis.com/css?family=PT+Serif:regular,italic,bold|PT+Sans:regular,italic,bold|Droid+Sans:400,700|Lato:700,900","startTime":18149.554661,"endTime":18149.67738,"responseReceivedTime":18149.675203,"transferSize":1228}},"1000060260.10":{"request":{"url":"https://www.paulirish.com/javascripts/modernizr-2.0.js","startTime":18149.554948,"endTime":18149.57483,"responseReceivedTime":18149.574153,"transferSize":4337}},"1000060260.11":{"request":{"url":"https://www.paulirish.com/javascripts/ender.js","startTime":18149.555257,"endTime":18149.583357,"responseReceivedTime":18149.582701,"transferSize":17039}},"1000060260.12":{"request":{"url":"https://www.paulirish.com/javascripts/octopress.js","startTime":18149.555596,"endTime":18149.582487,"responseReceivedTime":18149.579558999998,"transferSize":3225}},"1000060260.30":{"request":{"url":"https://fonts.gstatic.com/s/lato/v14/S6u9w4BMUTPHh6UVSwiPGQ3q5d0.woff2","startTime":18149.779367,"endTime":18149.86725,"responseReceivedTime":18149.8507,"transferSize":14193}},"1000060260.27":{"request":{"url":"https://fonts.gstatic.com/s/droidsans/v9/SlGVmQWMvZQIdix7AFxXkHNSbRYXags.woff2","startTime":18149.77989,"endTime":18149.850463,"responseReceivedTime":18149.84733,"transferSize":11353}},"1000060260.28":{"request":{"url":"https://fonts.gstatic.com/s/droidsans/v9/SlGWmQWMvZQIdix7AFxXmMh3eDs1ZyHKpWg.woff2","startTime":18149.780178,"endTime":18149.847086,"responseReceivedTime":18149.838355,"transferSize":11659}}}}},"longestChain":{"duration":546.2740000002668,"length":2,"transferSize":14193}}},"redirects":{"id":"redirects","title":"Avoid multiple page redirects","description":"Redirects introduce additional delays before the page can be loaded. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/redirects).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0}},"installable-manifest":{"id":"installable-manifest","title":"Web app manifest does not meet the installability requirements","description":"Browsers can proactively prompt users to add your app to their homescreen, which can lead to higher engagement. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/install-prompt).","score":0,"scoreDisplayMode":"binary","rawValue":false,"explanation":"Failures: No manifest was fetched.","details":{"type":"diagnostic","items":[{"failures":["No manifest was fetched"],"isParseFailure":true,"parseFailureReason":"No manifest was fetched"}]}},"splash-screen":{"id":"splash-screen","title":"Is not configured for a custom splash screen","description":"A themed splash screen ensures a high-quality experience when users launch your app from their homescreens. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/custom-splash-screen).","score":0,"scoreDisplayMode":"binary","rawValue":false,"explanation":"Failures: No manifest was fetched.","details":{"type":"diagnostic","items":[{"failures":["No manifest was fetched"],"isParseFailure":true,"parseFailureReason":"No manifest was fetched"}]}},"themed-omnibox":{"id":"themed-omnibox","title":"Does not set an address-bar theme color","description":"The browser address bar can be themed to match your site. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/address-bar).","score":0,"scoreDisplayMode":"binary","rawValue":false,"explanation":"Failures: No manifest was fetched,\nNo `\u003cmeta name=\"theme-color\">` tag found.","details":{"type":"diagnostic","items":[{"failures":["No manifest was fetched","No `\u003cmeta name=\"theme-color\">` tag found"],"themeColor":null,"isParseFailure":true,"parseFailureReason":"No manifest was fetched"}]}},"content-width":{"id":"content-width","title":"Content is sized correctly for the viewport","description":"If the width of your app's content doesn't match the width of the viewport, your app might not be optimized for mobile screens. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/content-sized-correctly-for-viewport).","score":1,"scoreDisplayMode":"binary","rawValue":true,"explanation":""},"image-aspect-ratio":{"id":"image-aspect-ratio","title":"Displays images with incorrect aspect ratio","description":"Image display dimensions should match natural aspect ratio. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/aspect-ratio).","score":0,"scoreDisplayMode":"binary","rawValue":false,"warnings":[],"details":{"type":"table","headings":[{"key":"url","itemType":"thumbnail","text":""},{"key":"url","itemType":"url","text":"URL"},{"key":"displayedAspectRatio","itemType":"text","text":"Aspect Ratio (Displayed)"},{"key":"actualAspectRatio","itemType":"text","text":"Aspect Ratio (Actual)"}],"items":[{"url":"https://www.paulirish.com/images/noise.png?1418840251","displayedAspectRatio":"412 x 13991\n        (0.03)","actualAspectRatio":"200 x 200\n        (1.00)","doRatiosMatch":false},{"url":"https://www.paulirish.com/images/noise.png?1418840251","displayedAspectRatio":"411 x 13990\n        (0.03)","actualAspectRatio":"200 x 200\n        (1.00)","doRatiosMatch":false}]}},"deprecations":{"id":"deprecations","title":"Avoids deprecated APIs","description":"Deprecated APIs will eventually be removed from the browser. [Learn more](https://www.chromestatus.com/features#deprecated).","score":1,"scoreDisplayMode":"binary","rawValue":true,"displayValue":"","details":{"type":"table","headings":[],"items":[]}},"mainthread-work-breakdown":{"id":"mainthread-work-breakdown","title":"Minimizes main-thread work","description":"Consider reducing the time spent parsing, compiling and executing JS. You may find delivering smaller JS payloads helps with this.","score":0.97,"scoreDisplayMode":"numeric","rawValue":1505.7600000000002,"displayValue":"1.5 s","details":{"type":"table","headings":[{"key":"groupLabel","itemType":"text","text":"Category"},{"key":"duration","itemType":"ms","granularity":1,"text":"Time Spent"}],"items":[{"group":"styleLayout","groupLabel":"Style & Layout","duration":1012.38},{"group":"other","groupLabel":"Other","duration":277.4920000000003},{"group":"scriptEvaluation","groupLabel":"Script Evaluation","duration":112.06399999999994},{"group":"paintCompositeRender","groupLabel":"Rendering","duration":65.35600000000002},{"group":"parseHTML","groupLabel":"Parse HTML & CSS","duration":29.448},{"group":"scriptParseCompile","groupLabel":"Script Parsing & Compilation","duration":8.335999999999999},{"group":"garbageCollection","groupLabel":"Garbage Collection","duration":0.684}]}},"bootup-time":{"id":"bootup-time","title":"JavaScript execution time","description":"Consider reducing the time spent parsing, compiling, and executing JS. You may find delivering smaller JS payloads helps with this. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/bootup).","score":1,"scoreDisplayMode":"numeric","rawValue":67.15199999999999,"displayValue":"0.1 s","details":{"type":"table","headings":[{"key":"url","itemType":"url","text":"URL"},{"key":"total","granularity":1,"itemType":"ms","text":"Total CPU Time"},{"key":"scripting","granularity":1,"itemType":"ms","text":"Script Evaluation"},{"key":"scriptParseCompile","granularity":1,"itemType":"ms","text":"Script Parse"}],"items":[{"url":"Other","total":1397.4280000000003,"scripting":12.208,"scriptParseCompile":1.4360000000000002},{"url":"https://www.google-analytics.com/analytics.js","total":53.50799999999999,"scripting":52.53599999999999,"scriptParseCompile":0.972}],"summary":{"wastedMs":67.15199999999999}}},"uses-rel-preload":{"id":"uses-rel-preload","title":"Preload key requests","description":"Consider using \u003clink rel=preload> to prioritize fetching resources that are currently requested later in page load. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/preload).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0}},"uses-rel-preconnect":{"id":"uses-rel-preconnect","title":"Preconnect to required origins","description":"Consider adding preconnect or dns-prefetch resource hints to establish early connections to important third-party origins. [Learn more](https://developers.google.com/web/fundamentals/performance/resource-prioritization#preconnect).","score":0.8,"scoreDisplayMode":"numeric","rawValue":245.02100000035762,"displayValue":"Potential savings of 250 ms","warnings":[],"details":{"type":"opportunity","headings":[{"key":"url","valueType":"url","label":"URL"},{"key":"wastedMs","valueType":"timespanMs","label":"Potential Savings (ms)"}],"items":[{"url":"https://paulirish.disqus.com","wastedMs":245.02100000035762},{"url":"https://www.google-analytics.com","wastedMs":244.47100000086428}],"overallSavingsMs":245.02100000035762}},"font-display":{"id":"font-display","title":"Ensure text remains visible during webfont load","description":"Leverage the font-display CSS feature to ensure text is user-visible while webfonts are loading. [Learn more](https://developers.google.com/web/updates/2016/02/font-display).","score":0,"scoreDisplayMode":"binary","rawValue":false,"details":{"type":"table","headings":[{"key":"url","itemType":"url","text":"URL"},{"key":"wastedMs","itemType":"ms","text":"Potential Savings (ms)"}],"items":[{"url":"https://fonts.gstatic.com/s/lato/v14/S6u9w4BMUTPHh6UVSwiPGQ3q5d0.woff2","wastedMs":87.88300000014715},{"url":"https://fonts.gstatic.com/s/droidsans/v9/SlGVmQWMvZQIdix7AFxXkHNSbRYXags.woff2","wastedMs":70.5729999972391},{"url":"https://fonts.gstatic.com/s/droidsans/v9/SlGWmQWMvZQIdix7AFxXmMh3eDs1ZyHKpWg.woff2","wastedMs":66.9080000006943}]}},"diagnostics":{"id":"diagnostics","title":"Diagnostics","description":"Collection of useful page vitals.","score":null,"scoreDisplayMode":"informative","rawValue":1,"details":{"type":"diagnostic","items":[{"numRequests":24,"numScripts":5,"numStylesheets":1,"numFonts":3,"numTasks":318,"numTasksOver10ms":6,"numTasksOver25ms":4,"numTasksOver50ms":1,"numTasksOver100ms":1,"numTasksOver500ms":0,"rtt":14.249000000000002,"throughput":21268283.284946248,"maxRtt":31.111000000000004,"maxServerLatency":48.35900000000001,"totalByteWeight":331511,"totalTaskTime":376.43999999999977,"mainDocumentTransferSize":22341}]}},"network-requests":{"id":"network-requests","title":"Network Requests","description":"Lists the network requests that were made during page load.","score":null,"scoreDisplayMode":"informative","rawValue":24,"details":{"type":"table","headings":[{"key":"url","itemType":"url","text":"URL"},{"key":"startTime","itemType":"ms","granularity":1,"text":"Start Time"},{"key":"endTime","itemType":"ms","granularity":1,"text":"End Time"},{"key":"transferSize","itemType":"bytes","displayUnit":"kb","granularity":1,"text":"Transfer Size"},{"key":"resourceSize","itemType":"bytes","displayUnit":"kb","granularity":1,"text":"Resource Size"},{"key":"statusCode","itemType":"text","text":"Status Code"},{"key":"mimeType","itemType":"text","text":"MIME Type"},{"key":"resourceType","itemType":"text","text":"Resource Type"}],"items":[{"url":"https://www.paulirish.com/","startTime":0,"endTime":225.61700000005658,"transferSize":22341,"resourceSize":75221,"statusCode":200,"mimeType":"text/html","resourceType":"Document"},{"url":"https://www.paulirish.com/assets/wikipedia-flamechart.jpg","startTime":226.26400000081048,"endTime":304.1460000022198,"transferSize":76487,"resourceSize":76300,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://paulirish.com/assets/webkit-box.png","startTime":230.93900000094436,"endTime":418.9189999997325,"transferSize":106,"resourceSize":0,"statusCode":301,"mimeType":""},{"url":"https://lh6.googleusercontent.com/--WfQB-Tr1sQ/TfHQSfY38FI/AAAAAAAAB8s/DSNAn8F71i8/s800/graphicscontext.png","startTime":231.67900000044028,"endTime":348.8930000021355,"transferSize":44448,"resourceSize":44114,"statusCode":200,"mimeType":"image/png","resourceType":"Image"},{"url":"https://paulirish.com/assets/webkit-diagram.png","startTime":231.98500000216882,"endTime":419.3809999997029,"transferSize":73,"resourceSize":0,"statusCode":301,"mimeType":""},{"url":"https://paulirish.com/i/3fb890.png","startTime":232.267999999749,"endTime":420.23600000175065,"transferSize":64,"resourceSize":0,"statusCode":301,"mimeType":""},{"url":"https://paulirish.com/avatar150.jpg","startTime":233.2650000025751,"endTime":419.7999999996682,"transferSize":65,"resourceSize":0,"statusCode":301,"mimeType":""},{"url":"https://fonts.googleapis.com/css?family=PT+Serif:regular,italic,bold|PT+Sans:regular,italic,bold|Droid+Sans:400,700|Lato:700,900","startTime":233.68499999924097,"endTime":356.4040000019304,"transferSize":1228,"resourceSize":11151,"statusCode":200,"mimeType":"text/css","resourceType":"Stylesheet"},{"url":"https://www.paulirish.com/javascripts/modernizr-2.0.js","startTime":233.97200000181329,"endTime":253.8540000023204,"transferSize":4337,"resourceSize":9736,"statusCode":200,"mimeType":"application/javascript","resourceType":"Script"},{"url":"https://www.paulirish.com/javascripts/ender.js","startTime":234.28100000091945,"endTime":262.3810000004596,"transferSize":17039,"resourceSize":56107,"statusCode":200,"mimeType":"application/javascript","resourceType":"Script"},{"url":"https://www.paulirish.com/javascripts/octopress.js","startTime":234.61999999926775,"endTime":261.5110000006098,"transferSize":3225,"resourceSize":7820,"statusCode":200,"mimeType":"application/javascript","resourceType":"Script"},{"url":"https://www.paulirish.com/images/noise.png?1418840251","startTime":237.0550000014191,"endTime":697.7090000000317,"transferSize":17860,"resourceSize":17742,"statusCode":200,"mimeType":"image/png","resourceType":"Image"},{"url":"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAACgAAAABCAYAAACsXeyTAAAACXBIWXMAAAsTAAALEwEAmpwYAAAAFU","startTime":237.4420000014652,"endTime":237.4840000011318,"transferSize":0,"resourceSize":99,"statusCode":200,"mimeType":"image/png","resourceType":"Image"},{"url":"https://www.paulirish.com/assets/webkit-box.png","startTime":419.05899999983376,"endTime":1690.5060000026424,"transferSize":38863,"resourceSize":38746,"statusCode":200,"mimeType":"image/png","resourceType":"Image"},{"url":"https://www.paulirish.com/assets/webkit-diagram.png","startTime":419.5450000006531,"endTime":1688.5939999992843,"transferSize":21202,"resourceSize":21022,"statusCode":200,"mimeType":"image/png","resourceType":"Image"},{"url":"https://www.paulirish.com/avatar150.jpg","startTime":419.9010000011185,"endTime":441.82700000237674,"transferSize":7512,"resourceSize":7409,"statusCode":200,"mimeType":"image/jpeg","resourceType":"Image"},{"url":"https://www.paulirish.com/i/3fb890.png","startTime":420.35000000032596,"endTime":444.2139999991923,"transferSize":18937,"resourceSize":18808,"statusCode":200,"mimeType":"image/png","resourceType":"Image"},{"url":"https://fonts.gstatic.com/s/lato/v14/S6u9w4BMUTPHh6UVSwiPGQ3q5d0.woff2","startTime":458.3910000001197,"endTime":546.2740000002668,"transferSize":14193,"resourceSize":14076,"statusCode":200,"mimeType":"font/woff2","resourceType":"Font"},{"url":"https://fonts.gstatic.com/s/droidsans/v9/SlGVmQWMvZQIdix7AFxXkHNSbRYXags.woff2","startTime":458.9140000025509,"endTime":529.48699999979,"transferSize":11353,"resourceSize":11236,"statusCode":200,"mimeType":"font/woff2","resourceType":"Font"},{"url":"https://fonts.gstatic.com/s/droidsans/v9/SlGWmQWMvZQIdix7AFxXmMh3eDs1ZyHKpWg.woff2","startTime":459.20200000182376,"endTime":526.1100000025181,"transferSize":11659,"resourceSize":11396,"statusCode":200,"mimeType":"font/woff2","resourceType":"Font"},{"url":"https://www.google-analytics.com/analytics.js","startTime":469.7699999996985,"endTime":579.2560000008962,"transferSize":17833,"resourceSize":44130,"statusCode":200,"mimeType":"text/javascript","resourceType":"Script"},{"url":"https://paulirish.disqus.com/count.js","startTime":470.42599999986123,"endTime":639.3129999996745,"transferSize":1476,"resourceSize":1517,"statusCode":200,"mimeType":"application/javascript","resourceType":"Script"},{"url":"https://www.google-analytics.com/r/collect?v=1&_v=j73&a=1769595831&t=pageview&_s=1&dl=https%3A%2F%2Fwww.paulirish.com%2F&ul=en-us&de=UTF-8&dt=Paul%20Irish&sd=24-bit&sr=412x660&vp=412x660&je=0&_u=IEBAAEAB~&jid=1238587383&gjid=1751569041&cid=1661229974.1552587147&tid=UA-692547-2&_gid=1371662810.1552587147&_r=1&z=67154448","startTime":615.9590000024764,"endTime":646.5060000009544,"transferSize":199,"resourceSize":35,"statusCode":200,"mimeType":"image/gif","resourceType":"Image"},{"url":"https://www.paulirish.com/favicon.ico","startTime":1698.4130000018922,"endTime":1715.2769999993325,"transferSize":1011,"resourceSize":1150,"statusCode":200,"mimeType":"image/x-icon","resourceType":"Other"}]}},"network-rtt":{"id":"network-rtt","title":"Network Round Trip Times","description":"Network round trip times (RTT) have a large impact on performance. If the RTT to an origin is high, it's an indication that servers closer to the user could improve performance. [Learn more](https://hpbn.co/primer-on-latency-and-bandwidth/).","score":null,"scoreDisplayMode":"informative","rawValue":31.111000000000004,"displayValue":"30 ms","details":{"type":"table","headings":[{"key":"origin","itemType":"text","text":"URL"},{"key":"rtt","itemType":"ms","granularity":1,"text":"Time Spent"}],"items":[{"origin":"https://paulirish.disqus.com","rtt":31.111000000000004},{"origin":"https://www.paulirish.com","rtt":16.613},{"origin":"https://www.google-analytics.com","rtt":15.233},{"origin":"https://fonts.googleapis.com","rtt":15.046999999999997},{"origin":"https://paulirish.com","rtt":14.249000000000002},{"origin":"https://lh6.googleusercontent.com","rtt":14.249000000000002},{"origin":"https://fonts.gstatic.com","rtt":14.249000000000002}]}},"network-server-latency":{"id":"network-server-latency","title":"Server Backend Latencies","description":"Server latencies can impact web performance. If the server latency of an origin is high, it's an indication the server is overloaded or has poor backend performance. [Learn more](https://hpbn.co/primer-on-web-performance/#analyzing-the-resource-waterfall).","score":null,"scoreDisplayMode":"informative","rawValue":48.35900000000001,"displayValue":"50 ms","details":{"type":"table","headings":[{"key":"origin","itemType":"text","text":"URL"},{"key":"serverReponseTime","itemType":"ms","granularity":1,"text":"Time Spent"}],"items":[{"origin":"https://paulirish.disqus.com","serverReponseTime":48.35900000000001},{"origin":"https://fonts.googleapis.com","serverReponseTime":28.697000000000003},{"origin":"https://fonts.gstatic.com","serverReponseTime":19.391},{"origin":"https://paulirish.com","serverReponseTime":12.247999999999998},{"origin":"https://www.paulirish.com","serverReponseTime":9.152999999999999},{"origin":"https://www.google-analytics.com","serverReponseTime":8.473999999999993},{"origin":"https://lh6.googleusercontent.com","serverReponseTime":6.509999999999998}]}},"main-thread-tasks":{"id":"main-thread-tasks","title":"Tasks","description":"Lists the toplevel main thread tasks that executed during page load.","score":null,"scoreDisplayMode":"informative","rawValue":13,"details":{"type":"table","headings":[{"key":"type","itemType":"text","text":"Task Type"},{"key":"startTime","itemType":"ms","granularity":1,"text":"Start Time"},{"key":"duration","itemType":"ms","granularity":1,"text":"End Time"}],"items":[{"type":"styleLayout","duration":67.095,"startTime":240.874},{"type":"styleLayout","duration":108.411,"startTime":308.006},{"type":"styleLayout","duration":6.55,"startTime":427.82},{"type":"styleLayout","duration":23.863,"startTime":434.396},{"type":"parseHTML","duration":10.706,"startTime":474.073},{"type":"scriptEvaluation","duration":5.206,"startTime":475.431},{"type":"scriptEvaluation","duration":5.092,"startTime":475.537},{"type":"scriptEvaluation","duration":5.066,"startTime":475.548},{"type":"scriptEvaluation","duration":5.053,"startTime":475.553},{"type":"styleLayout","duration":36.288,"startTime":565.121},{"type":"scriptEvaluation","duration":13.28,"startTime":607.756},{"type":"scriptEvaluation","duration":13.013,"startTime":607.998},{"type":"scriptEvaluation","duration":12.764,"startTime":608.004}]}},"metrics":{"id":"metrics","title":"Metrics","description":"Collects all available metrics.","score":null,"scoreDisplayMode":"informative","rawValue":1943.3435000000004,"details":{"type":"diagnostic","items":[{"firstContentfulPaint":1700,"firstMeaningfulPaint":1700,"firstCPUIdle":1700,"interactive":1943,"speedIndex":1700,"estimatedInputLatency":13,"observedNavigationStart":0,"observedNavigationStartTs":18149319409,"observedFirstPaint":432,"observedFirstPaintTs":18149751751,"observedFirstContentfulPaint":432,"observedFirstContentfulPaintTs":18149751752,"observedFirstMeaningfulPaint":432,"observedFirstMeaningfulPaintTs":18149751753,"observedTraceEnd":2764,"observedTraceEndTs":18152082949,"observedLoad":1695,"observedLoadTs":18151014867,"observedDomContentLoaded":477,"observedDomContentLoadedTs":18149796202,"observedFirstVisualChange":452,"observedFirstVisualChangeTs":18149771409,"observedLastVisualChange":1135,"observedLastVisualChangeTs":18150454409,"observedSpeedIndex":565,"observedSpeedIndexTs":18149884036}]}},"offline-start-url":{"id":"offline-start-url","title":"start_url does not respond with a 200 when offline","description":"A service worker enables your web app to be reliable in unpredictable network conditions. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/http-200-when-offline).","score":0,"scoreDisplayMode":"binary","rawValue":false,"explanation":"No usable web app manifest found on page.","warnings":[]},"pwa-cross-browser":{"id":"pwa-cross-browser","title":"Site works cross-browser","description":"To reach the most number of users, sites should work across every major browser. [Learn more](https://developers.google.com/web/progressive-web-apps/checklist#site-works-cross-browser).","score":null,"scoreDisplayMode":"manual","rawValue":false},"pwa-page-transitions":{"id":"pwa-page-transitions","title":"Page transitions don't feel like they block on the network","description":"Transitions should feel snappy as you tap around, even on a slow network, a key to perceived performance. [Learn more](https://developers.google.com/web/progressive-web-apps/checklist#page-transitions-dont-feel-like-they-block-on-the-network).","score":null,"scoreDisplayMode":"manual","rawValue":false},"pwa-each-page-has-url":{"id":"pwa-each-page-has-url","title":"Each page has a URL","description":"Ensure individual pages are deep linkable via the URLs and that URLs are unique for the purpose of shareability on social media. [Learn more](https://developers.google.com/web/progressive-web-apps/checklist#each-page-has-a-url).","score":null,"scoreDisplayMode":"manual","rawValue":false},"accesskeys":{"id":"accesskeys","title":"`[accesskey]` values are unique","description":"Access keys let users quickly focus a part of the page. For proper navigation, each access key must be unique. [Learn more](https://dequeuniversity.com/rules/axe/3.1/accesskeys?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"aria-allowed-attr":{"id":"aria-allowed-attr","title":"`[aria-*]` attributes match their roles","description":"Each ARIA `role` supports a specific subset of `aria-*` attributes. Mismatching these invalidates the `aria-*` attributes. [Learn more](https://dequeuniversity.com/rules/axe/3.1/aria-allowed-attr?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"aria-required-attr":{"id":"aria-required-attr","title":"`[role]`s have all required `[aria-*]` attributes","description":"Some ARIA roles have required attributes that describe the state of the element to screen readers. [Learn more](https://dequeuniversity.com/rules/axe/3.1/aria-required-attr?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"aria-required-children":{"id":"aria-required-children","title":"Elements with `[role]` that require specific children `[role]`s, are present","description":"Some ARIA parent roles must contain specific child roles to perform their intended accessibility functions. [Learn more](https://dequeuniversity.com/rules/axe/3.1/aria-required-children?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"aria-required-parent":{"id":"aria-required-parent","title":"`[role]`s are contained by their required parent element","description":"Some ARIA child roles must be contained by specific parent roles to properly perform their intended accessibility functions. [Learn more](https://dequeuniversity.com/rules/axe/3.1/aria-required-parent?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"aria-roles":{"id":"aria-roles","title":"`[role]` values are valid","description":"ARIA roles must have valid values in order to perform their intended accessibility functions. [Learn more](https://dequeuniversity.com/rules/axe/3.1/aria-roles?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"aria-valid-attr-value":{"id":"aria-valid-attr-value","title":"`[aria-*]` attributes have valid values","description":"Assistive technologies, like screen readers, can't interpret ARIA attributes with invalid values. [Learn more](https://dequeuniversity.com/rules/axe/3.1/aria-valid-attr-value?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"aria-valid-attr":{"id":"aria-valid-attr","title":"`[aria-*]` attributes are valid and not misspelled","description":"Assistive technologies, like screen readers, can't interpret ARIA attributes with invalid names. [Learn more](https://dequeuniversity.com/rules/axe/3.1/aria-valid-attr?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"audio-caption":{"id":"audio-caption","title":"`\u003caudio>` elements contain a `\u003ctrack>` element with `[kind=\"captions\"]`","description":"Captions make audio elements usable for deaf or hearing-impaired users, providing critical information such as who is talking, what they're saying, and other non-speech information. [Learn more](https://dequeuniversity.com/rules/axe/3.1/audio-caption?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"button-name":{"id":"button-name","title":"Buttons have an accessible name","description":"When a button doesn't have an accessible name, screen readers announce it as \"button\", making it unusable for users who rely on screen readers. [Learn more](https://dequeuniversity.com/rules/axe/3.1/button-name?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"bypass":{"id":"bypass","title":"The page contains a heading, skip link, or landmark region","description":"Adding ways to bypass repetitive content lets keyboard users navigate the page more efficiently. [Learn more](https://dequeuniversity.com/rules/axe/3.1/bypass?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"color-contrast":{"id":"color-contrast","title":"Background and foreground colors do not have a sufficient contrast ratio.","description":"Low-contrast text is difficult or impossible for many users to read. [Learn more](https://dequeuniversity.com/rules/axe/3.1/color-contrast?application=lighthouse).","score":0,"scoreDisplayMode":"binary","rawValue":false,"details":{"type":"table","headings":[{"key":"node","itemType":"node","text":"Failing Elements"}],"items":[{"node":{"type":"node","selector":".search","path":"1,HTML,1,BODY,1,NAV,1,FORM,0,FIELDSET,1,INPUT","snippet":"\u003cinput class=\"search\" type=\"text\" name=\"q\" results=\"0\" placeholder=\"Search\">","explanation":"Fix any of the following:\n  Element has insufficient color contrast of 3.16 (foreground color: #888888, background color: #f2f2f2, font size: 10.2pt, font weight: normal). Expected contrast ratio of 4.5:1"}}],"diagnostic":{"type":"diagnostic","impact":"serious","tags":["cat.color","wcag2aa","wcag143"]}}},"definition-list":{"id":"definition-list","title":"`\u003cdl>`'s contain only properly-ordered `\u003cdt>` and `\u003cdd>` groups, `\u003cscript>` or `\u003ctemplate>` elements.","description":"When definition lists are not properly marked up, screen readers may produce confusing or inaccurate output. [Learn more](https://dequeuniversity.com/rules/axe/3.1/definition-list?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"dlitem":{"id":"dlitem","title":"Definition list items are wrapped in `\u003cdl>` elements","description":"Definition list items (`\u003cdt>` and `\u003cdd>`) must be wrapped in a parent `\u003cdl>` element to ensure that screen readers can properly announce them. [Learn more](https://dequeuniversity.com/rules/axe/3.1/dlitem?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"document-title":{"id":"document-title","title":"Document has a `\u003ctitle>` element","description":"The title gives screen reader users an overview of the page, and search engine users rely on it heavily to determine if a page is relevant to their search. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/title).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"duplicate-id":{"id":"duplicate-id","title":"`[id]` attributes on the page are unique","description":"The value of an id attribute must be unique to prevent other instances from being overlooked by assistive technologies. [Learn more](https://dequeuniversity.com/rules/axe/3.1/duplicate-id?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"frame-title":{"id":"frame-title","title":"`\u003cframe>` or `\u003ciframe>` elements have a title","description":"Screen reader users rely on frame titles to describe the contents of frames. [Learn more](https://dequeuniversity.com/rules/axe/3.1/frame-title?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"html-has-lang":{"id":"html-has-lang","title":"`\u003chtml>` element has a `[lang]` attribute","description":"If a page doesn't specify a lang attribute, a screen reader assumes that the page is in the default language that the user chose when setting up the screen reader. If the page isn't actually in the default language, then the screen reader might not announce the page's text correctly. [Learn more](https://dequeuniversity.com/rules/axe/3.1/html-has-lang?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"html-lang-valid":{"id":"html-lang-valid","title":"`\u003chtml>` element has a valid value for its `[lang]` attribute","description":"Specifying a valid [BCP 47 language](https://www.w3.org/International/questions/qa-choosing-language-tags#question) helps screen readers announce text properly. [Learn more](https://dequeuniversity.com/rules/axe/3.1/valid-lang?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"image-alt":{"id":"image-alt","title":"Image elements do not have `[alt]` attributes","description":"Informative elements should aim for short, descriptive alternate text. Decorative elements can be ignored with an empty alt attribute. [Learn more](https://dequeuniversity.com/rules/axe/3.1/image-alt?application=lighthouse).","score":0,"scoreDisplayMode":"binary","rawValue":false,"details":{"type":"table","headings":[{"key":"node","itemType":"node","text":"Failing Elements"}],"items":[{"node":{"type":"node","selector":"center > img","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,1,ARTICLE,1,DIV,7,CENTER,0,IMG","snippet":"\u003cimg src=\"/assets/wikipedia-flamechart.jpg\">","explanation":"Fix any of the following:\n  Element does not have an alt attribute\n  aria-label attribute does not exist or is empty\n  aria-labelledby attribute does not exist, references elements that do not exist or references elements that are empty\n  Element has no title attribute or the title attribute is empty\n  Element's default semantics were not overridden with role=\"presentation\"\n  Element's default semantics were not overridden with role=\"none\""}}],"diagnostic":{"type":"diagnostic","impact":"critical","tags":["cat.text-alternatives","wcag2a","wcag111","section508","section508.22.a"]}}},"input-image-alt":{"id":"input-image-alt","title":"`\u003cinput type=\"image\">` elements have `[alt]` text","description":"When an image is being used as an `\u003cinput>` button, providing alternative text can help screen reader users understand the purpose of the button. [Learn more](https://dequeuniversity.com/rules/axe/3.1/input-image-alt?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"label":{"id":"label","title":"Form elements do not have associated labels","description":"Labels ensure that form controls are announced properly by assistive technologies, like screen readers. [Learn more](https://dequeuniversity.com/rules/axe/3.1/label?application=lighthouse).","score":0,"scoreDisplayMode":"binary","rawValue":false,"details":{"type":"table","headings":[{"key":"node","itemType":"node","text":"Failing Elements"}],"items":[{"node":{"type":"node","selector":".search","path":"1,HTML,1,BODY,1,NAV,1,FORM,0,FIELDSET,1,INPUT","snippet":"\u003cinput class=\"search\" type=\"text\" name=\"q\" results=\"0\" placeholder=\"Search\">","explanation":"Fix any of the following:\n  aria-label attribute does not exist or is empty\n  aria-labelledby attribute does not exist, references elements that do not exist or references elements that are empty\n  Form element does not have an implicit (wrapped) \u003clabel>\n  Form element does not have an explicit \u003clabel>\n  Element has no title attribute or the title attribute is empty"}},{"node":{"type":"node","selector":"select","path":"1,HTML,1,BODY,1,NAV,1,FORM,1,FIELDSET,0,SELECT","snippet":"\u003cselect>","explanation":"Fix any of the following:\n  aria-label attribute does not exist or is empty\n  aria-labelledby attribute does not exist, references elements that do not exist or references elements that are empty\n  Form element does not have an implicit (wrapped) \u003clabel>\n  Form element does not have an explicit \u003clabel>\n  Element has no title attribute or the title attribute is empty"}}],"diagnostic":{"type":"diagnostic","impact":"critical","tags":["cat.forms","wcag2a","wcag332","wcag131","section508","section508.22.n"]}}},"layout-table":{"id":"layout-table","title":"Presentational `\u003ctable>` elements avoid using `\u003cth>`, `\u003ccaption>` or the `[summary]` attribute.","description":"A table being used for layout purposes should not include data elements, such as the th or caption elements or the summary attribute, because this can create a confusing experience for screen reader users. [Learn more](https://dequeuniversity.com/rules/axe/3.1/layout-table?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"link-name":{"id":"link-name","title":"Links do not have a discernible name","description":"Link text (and alternate text for images, when used as links) that is discernible, unique, and focusable improves the navigation experience for screen reader users. [Learn more](https://dequeuniversity.com/rules/axe/3.1/link-name?application=lighthouse).","score":0,"scoreDisplayMode":"binary","rawValue":false,"details":{"type":"table","headings":[{"key":"node","itemType":"node","text":"Failing Elements"}],"items":[{"node":{"type":"node","selector":"p:nth-child(61) > a","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,60,P,0,A","snippet":"\u003ca href=\"https://docs.google.com/presentation/d/1ZRIQbUKw9Tf077odCh66OrrwRIVNLvI_nhLm2Gi__F0/embed?start=false&amp;loop=false&amp;delayms=3000\">\n\u003cimg src=\"https://paulirish.com/i/3fb890.png\" alt=\"\">\n\u003c/a>","explanation":"Fix all of the following:\n  Element is in tab order and does not have accessible text\n\nFix any of the following:\n  Element does not have text that is visible to screen readers\n  aria-label attribute does not exist or is empty\n  aria-labelledby attribute does not exist, references elements that do not exist or references elements that are empty\n  Element's default semantics were not overridden with role=\"presentation\"\n  Element's default semantics were not overridden with role=\"none\""}}],"diagnostic":{"type":"diagnostic","impact":"serious","tags":["cat.name-role-value","wcag2a","wcag412","wcag244","section508","section508.22.a"]}}},"list":{"id":"list","title":"Lists contain only `\u003cli>` elements and script supporting elements (`\u003cscript>` and `\u003ctemplate>`).","description":"Screen readers have a specific way of announcing lists. Ensuring proper list structure aids screen reader output. [Learn more](https://dequeuniversity.com/rules/axe/3.1/list?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"listitem":{"id":"listitem","title":"List items (`\u003cli>`) are contained within `\u003cul>` or `\u003col>` parent elements","description":"Screen readers require list items (`\u003cli>`) to be contained within a parent `\u003cul>` or `\u003col>` to be announced properly. [Learn more](https://dequeuniversity.com/rules/axe/3.1/listitem?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"meta-refresh":{"id":"meta-refresh","title":"The document does not use `\u003cmeta http-equiv=\"refresh\">`","description":"Users do not expect a page to refresh automatically, and doing so will move focus back to the top of the page. This may create a frustrating or confusing experience. [Learn more](https://dequeuniversity.com/rules/axe/3.1/meta-refresh?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"meta-viewport":{"id":"meta-viewport","title":"`[user-scalable=\"no\"]` is used in the `\u003cmeta name=\"viewport\">` element or the `[maximum-scale]` attribute is less than 5.","description":"Disabling zooming is problematic for users with low vision who rely on screen magnification to properly see the contents of a web page. [Learn more](https://dequeuniversity.com/rules/axe/3.1/meta-viewport?application=lighthouse).","score":0,"scoreDisplayMode":"binary","rawValue":false,"details":{"type":"table","headings":[{"key":"node","itemType":"node","text":"Failing Elements"}],"items":[{"node":{"type":"node","selector":"meta[name=\"viewport\"]","path":"1,HTML,0,HEAD,3,META","snippet":"\u003cmeta name=\"viewport\" content=\"width=device-width,minimum-scale=1,maximum-scale=1\">","explanation":"Fix any of the following:\n  maximum-scale on \u003cmeta> tag disables zooming on mobile devices"}}],"diagnostic":{"type":"diagnostic","impact":"critical","tags":["cat.sensory-and-visual-cues","wcag2aa","wcag144"]}}},"object-alt":{"id":"object-alt","title":"`\u003cobject>` elements have `[alt]` text","description":"Screen readers cannot translate non-text content. Adding alt text to `\u003cobject>` elements helps screen readers convey meaning to users. [Learn more](https://dequeuniversity.com/rules/axe/3.1/object-alt?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"tabindex":{"id":"tabindex","title":"No element has a `[tabindex]` value greater than 0","description":"A value greater than 0 implies an explicit navigation ordering. Although technically valid, this often creates frustrating experiences for users who rely on assistive technologies. [Learn more](https://dequeuniversity.com/rules/axe/3.1/tabindex?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"td-headers-attr":{"id":"td-headers-attr","title":"Cells in a `\u003ctable>` element that use the `[headers]` attribute only refer to other cells of that same table.","description":"Screen readers have features to make navigating tables easier. Ensuring `\u003ctd>` cells using the `[headers]` attribute only refer to other cells in the same table may improve the experience for screen reader users. [Learn more](https://dequeuniversity.com/rules/axe/3.1/td-headers-attr?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"th-has-data-cells":{"id":"th-has-data-cells","title":"`\u003cth>` elements and elements with `[role=\"columnheader\"/\"rowheader\"]` have data cells they describe.","description":"Screen readers have features to make navigating tables easier. Ensuring table headers always refer to some set of cells may improve the experience for screen reader users. [Learn more](https://dequeuniversity.com/rules/axe/3.1/th-has-data-cells?application=lighthouse).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"valid-lang":{"id":"valid-lang","title":"`[lang]` attributes have a valid value","description":"Specifying a valid [BCP 47 language](https://www.w3.org/International/questions/qa-choosing-language-tags#question) on elements helps ensure that text is pronounced correctly by a screen reader. [Learn more](https://dequeuniversity.com/rules/axe/3.1/valid-lang?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"video-caption":{"id":"video-caption","title":"`\u003cvideo>` elements contain a `\u003ctrack>` element with `[kind=\"captions\"]`","description":"When a video provides a caption it is easier for deaf and hearing impaired users to access its information. [Learn more](https://dequeuniversity.com/rules/axe/3.1/video-caption?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"video-description":{"id":"video-description","title":"`\u003cvideo>` elements contain a `\u003ctrack>` element with `[kind=\"description\"]`","description":"Audio descriptions provide relevant information for videos that dialogue cannot, such as facial expressions and scenes. [Learn more](https://dequeuniversity.com/rules/axe/3.1/video-description?application=lighthouse).","score":null,"scoreDisplayMode":"notApplicable","rawValue":true},"custom-controls-labels":{"id":"custom-controls-labels","title":"Custom controls have associated labels","description":"Custom interactive controls have associated labels, provided by aria-label or aria-labelledby. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#try_it_with_a_screen_reader).","score":null,"scoreDisplayMode":"manual","rawValue":false},"custom-controls-roles":{"id":"custom-controls-roles","title":"Custom controls have ARIA roles","description":"Custom interactive controls have appropriate ARIA roles. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#try_it_with_a_screen_reader).","score":null,"scoreDisplayMode":"manual","rawValue":false},"focus-traps":{"id":"focus-traps","title":"User focus is not accidentally trapped in a region","description":"A user can tab into and out of any control or region without accidentally trapping their focus. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#start_with_the_keyboard).","score":null,"scoreDisplayMode":"manual","rawValue":false},"focusable-controls":{"id":"focusable-controls","title":"Interactive controls are keyboard focusable","description":"Custom interactive controls are keyboard focusable and display a focus indicator. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#start_with_the_keyboard).","score":null,"scoreDisplayMode":"manual","rawValue":false},"heading-levels":{"id":"heading-levels","title":"Headings don't skip levels","description":"Headings are used to create an outline for the page and heading levels are not skipped. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#take_advantage_of_headings_and_landmarks).","score":null,"scoreDisplayMode":"manual","rawValue":false},"interactive-element-affordance":{"id":"interactive-element-affordance","title":"Interactive elements indicate their purpose and state","description":"Interactive elements, such as links and buttons, should indicate their state and be distinguishable from non-interactive elements. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#interactive_elements_like_links_and_buttons_should_indicate_their_purpose_and_state).","score":null,"scoreDisplayMode":"manual","rawValue":false},"logical-tab-order":{"id":"logical-tab-order","title":"The page has a logical tab order","description":"Tabbing through the page follows the visual layout. Users cannot focus elements that are offscreen. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#start_with_the_keyboard).","score":null,"scoreDisplayMode":"manual","rawValue":false},"managed-focus":{"id":"managed-focus","title":"The user's focus is directed to new content added to the page","description":"If new content, such as a dialog, is added to the page, the user's focus is directed to it. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#start_with_the_keyboard).","score":null,"scoreDisplayMode":"manual","rawValue":false},"offscreen-content-hidden":{"id":"offscreen-content-hidden","title":"Offscreen content is hidden from assistive technology","description":"Offscreen content is hidden with display: none or aria-hidden=true. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#try_it_with_a_screen_reader).","score":null,"scoreDisplayMode":"manual","rawValue":false},"use-landmarks":{"id":"use-landmarks","title":"HTML5 landmark elements are used to improve navigation","description":"Landmark elements (\u003cmain>, \u003cnav>, etc.) are used to improve the keyboard navigation of the page for assistive technology. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#take_advantage_of_headings_and_landmarks).","score":null,"scoreDisplayMode":"manual","rawValue":false},"visual-order-follows-dom":{"id":"visual-order-follows-dom","title":"Visual order on the page follows DOM order","description":"DOM order matches the visual order, improving navigation for assistive technology. [Learn more](https://developers.google.com/web/fundamentals/accessibility/how-to-review#try_it_with_a_screen_reader).","score":null,"scoreDisplayMode":"manual","rawValue":false},"uses-long-cache-ttl":{"id":"uses-long-cache-ttl","title":"Serve static assets with an efficient cache policy","description":"A long cache lifetime can speed up repeat visits to your page. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/cache-policy).","score":0.51,"scoreDisplayMode":"numeric","rawValue":125469.25,"displayValue":"12 resources found","details":{"type":"table","headings":[{"key":"url","itemType":"url","text":"URL"},{"key":"cacheLifetimeMs","itemType":"ms","text":"Cache TTL","displayUnit":"duration"},{"key":"totalBytes","itemType":"bytes","text":"Size (KB)","displayUnit":"kb","granularity":1}],"items":[{"url":"https://www.paulirish.com/images/noise.png?1418840251","cacheLifetimeMs":0,"cacheHitProbability":0,"totalBytes":17860,"wastedBytes":17860},{"url":"https://paulirish.disqus.com/count.js","diagnostic":{"type":"diagnostic","public":true,"max-age":300},"cacheLifetimeMs":300000,"cacheHitProbability":0.041666666666666664,"totalBytes":1476,"wastedBytes":1414.5},{"url":"https://www.google-analytics.com/analytics.js","diagnostic":{"type":"diagnostic","public":true,"max-age":7200},"cacheLifetimeMs":7200000,"cacheHitProbability":0.25,"totalBytes":17833,"wastedBytes":13374.75},{"url":"https://www.paulirish.com/assets/wikipedia-flamechart.jpg","diagnostic":{"type":"diagnostic","public":true,"max-age":86400},"cacheLifetimeMs":86400000,"cacheHitProbability":0.6,"totalBytes":76487,"wastedBytes":30594.800000000003},{"url":"https://lh6.googleusercontent.com/--WfQB-Tr1sQ/TfHQSfY38FI/AAAAAAAAB8s/DSNAn8F71i8/s800/graphicscontext.png","diagnostic":{"type":"diagnostic","public":true,"max-age":86400,"no-transform":true},"cacheLifetimeMs":86400000,"cacheHitProbability":0.6,"totalBytes":44448,"wastedBytes":17779.2},{"url":"https://www.paulirish.com/assets/webkit-box.png","diagnostic":{"type":"diagnostic","public":true,"max-age":86400},"cacheLifetimeMs":86400000,"cacheHitProbability":0.6,"totalBytes":38863,"wastedBytes":15545.2},{"url":"https://www.paulirish.com/assets/webkit-diagram.png","diagnostic":{"type":"diagnostic","public":true,"max-age":86400},"cacheLifetimeMs":86400000,"cacheHitProbability":0.6,"totalBytes":21202,"wastedBytes":8480.800000000001},{"url":"https://www.paulirish.com/i/3fb890.png","diagnostic":{"type":"diagnostic","public":true,"max-age":86400},"cacheLifetimeMs":86400000,"cacheHitProbability":0.6,"totalBytes":18937,"wastedBytes":7574.8},{"url":"https://www.paulirish.com/javascripts/ender.js","diagnostic":{"type":"diagnostic","public":true,"max-age":86400},"cacheLifetimeMs":86400000,"cacheHitProbability":0.6,"totalBytes":17039,"wastedBytes":6815.6},{"url":"https://www.paulirish.com/avatar150.jpg","diagnostic":{"type":"diagnostic","public":true,"max-age":86400},"cacheLifetimeMs":86400000,"cacheHitProbability":0.6,"totalBytes":7512,"wastedBytes":3004.8},{"url":"https://www.paulirish.com/javascripts/modernizr-2.0.js","diagnostic":{"type":"diagnostic","public":true,"max-age":86400},"cacheLifetimeMs":86400000,"cacheHitProbability":0.6,"totalBytes":4337,"wastedBytes":1734.8000000000002},{"url":"https://www.paulirish.com/javascripts/octopress.js","diagnostic":{"type":"diagnostic","public":true,"max-age":86400},"cacheLifetimeMs":86400000,"cacheHitProbability":0.6,"totalBytes":3225,"wastedBytes":1290}],"summary":{"wastedBytes":125469.25}}},"total-byte-weight":{"id":"total-byte-weight","title":"Avoids enormous network payloads","description":"Large network payloads cost users real money and are highly correlated with long load times. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/network-payloads).","score":1,"scoreDisplayMode":"numeric","rawValue":331511,"displayValue":"Total size was 324 KB","details":{"type":"table","headings":[{"key":"url","itemType":"url","text":"URL"},{"key":"totalBytes","itemType":"bytes","text":"Size (KB)"}],"items":[{"url":"https://www.paulirish.com/assets/wikipedia-flamechart.jpg","totalBytes":76487},{"url":"https://lh6.googleusercontent.com/--WfQB-Tr1sQ/TfHQSfY38FI/AAAAAAAAB8s/DSNAn8F71i8/s800/graphicscontext.png","totalBytes":44448},{"url":"https://www.paulirish.com/assets/webkit-box.png","totalBytes":38863},{"url":"https://www.paulirish.com/","totalBytes":22341},{"url":"https://www.paulirish.com/assets/webkit-diagram.png","totalBytes":21202},{"url":"https://www.paulirish.com/i/3fb890.png","totalBytes":18937},{"url":"https://www.paulirish.com/images/noise.png?1418840251","totalBytes":17860},{"url":"https://www.google-analytics.com/analytics.js","totalBytes":17833},{"url":"https://www.paulirish.com/javascripts/ender.js","totalBytes":17039},{"url":"https://fonts.gstatic.com/s/lato/v14/S6u9w4BMUTPHh6UVSwiPGQ3q5d0.woff2","totalBytes":14193}]}},"offscreen-images":{"id":"offscreen-images","title":"Defer offscreen images","description":"Consider lazy-loading offscreen and hidden images after all critical resources have finished loading to lower time to interactive. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/offscreen-images).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"Potential savings of 118 KB","warnings":[],"details":{"type":"opportunity","headings":[{"key":"url","valueType":"thumbnail","label":""},{"key":"url","valueType":"url","label":"URL"},{"key":"totalBytes","valueType":"bytes","label":"Size (KB)"},{"key":"wastedBytes","valueType":"bytes","label":"Potential Savings (KB)"}],"items":[{"url":"https://www.paulirish.com/assets/wikipedia-flamechart.jpg","requestStartTime":18149.54724,"totalBytes":76300,"wastedBytes":76300,"wastedPercent":100},{"url":"https://lh6.googleusercontent.com/--WfQB-Tr1sQ/TfHQSfY38FI/AAAAAAAAB8s/DSNAn8F71i8/s800/graphicscontext.png","requestStartTime":18149.552655,"totalBytes":44114,"wastedBytes":44114,"wastedPercent":100}],"overallSavingsMs":0,"overallSavingsBytes":120414}},"render-blocking-resources":{"id":"render-blocking-resources","title":"Eliminate render-blocking resources","description":"Resources are blocking the first paint of your page. Consider delivering critical JS/CSS inline and deferring all non-critical JS/styles. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/blocking-resources).","score":0.5,"scoreDisplayMode":"numeric","rawValue":781,"displayValue":"Potential savings of 780 ms","details":{"type":"opportunity","headings":[{"key":"url","valueType":"url","label":"URL"},{"key":"totalBytes","valueType":"bytes","label":"Size (KB)"},{"key":"wastedMs","valueType":"timespanMs","label":"Potential Savings (ms)"}],"items":[{"url":"https://fonts.googleapis.com/css?family=PT+Serif:regular,italic,bold|PT+Sans:regular,italic,bold|Droid+Sans:400,700|Lato:700,900","totalBytes":1228,"wastedMs":781}],"overallSavingsMs":781}},"unminified-css":{"id":"unminified-css","title":"Minify CSS","description":"Minifying CSS files can reduce network payload sizes. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/minify-css).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"unminified-javascript":{"id":"unminified-javascript","title":"Minify JavaScript","description":"Minifying JavaScript files can reduce payload sizes and script parse time. [Learn more](https://developers.google.com/speed/docs/insights/MinifyResources).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","warnings":[],"details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"unused-css-rules":{"id":"unused-css-rules","title":"Remove unused CSS","description":"Remove dead rules from stylesheets and defer the loading of CSS not used for above-the-fold content to reduce unnecessary bytes consumed by network activity. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/unused-css).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"Potential savings of 10 KB","details":{"type":"opportunity","headings":[{"key":"url","valueType":"url","label":"URL"},{"key":"totalBytes","valueType":"bytes","label":"Size (KB)"},{"key":"wastedBytes","valueType":"bytes","label":"Potential Savings (KB)"}],"items":[{"url":"html,body,div,span,applet,object,iframe,h1,h2,h3,h4,h5,h6,p,blockquote,pre,a,abbr,acronym,address,bi...","wastedBytes":9826,"wastedPercent":73.63828603227601,"totalBytes":13343}],"overallSavingsMs":0,"overallSavingsBytes":9826}},"uses-webp-images":{"id":"uses-webp-images","title":"Serve images in next-gen formats","description":"Image formats like JPEG 2000, JPEG XR, and WebP often provide better compression than PNG or JPEG, which means faster downloads and less data consumption. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/webp).","score":0.58,"scoreDisplayMode":"numeric","rawValue":610,"displayValue":"Potential savings of 118 KB","warnings":[],"details":{"type":"opportunity","headings":[{"key":"url","valueType":"thumbnail","label":""},{"key":"url","valueType":"url","label":"URL"},{"key":"totalBytes","valueType":"bytes","label":"Size (KB)"},{"key":"wastedBytes","valueType":"bytes","label":"Potential Savings (KB)"}],"items":[{"url":"https://www.paulirish.com/assets/wikipedia-flamechart.jpg","fromProtocol":true,"isCrossOrigin":false,"totalBytes":76300,"wastedBytes":48732},{"url":"https://lh6.googleusercontent.com/--WfQB-Tr1sQ/TfHQSfY38FI/AAAAAAAAB8s/DSNAn8F71i8/s800/graphicscontext.png","fromProtocol":true,"isCrossOrigin":true,"totalBytes":44114,"wastedBytes":34708},{"url":"https://www.paulirish.com/assets/webkit-box.png","fromProtocol":true,"isCrossOrigin":false,"totalBytes":38746,"wastedBytes":28232},{"url":"https://www.paulirish.com/assets/webkit-diagram.png","fromProtocol":true,"isCrossOrigin":false,"totalBytes":21022,"wastedBytes":8946}],"overallSavingsMs":610,"overallSavingsBytes":120618}},"uses-optimized-images":{"id":"uses-optimized-images","title":"Efficiently encode images","description":"Optimized images load faster and consume less cellular data. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/optimize-images).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"Potential savings of 12 KB","warnings":[],"details":{"type":"opportunity","headings":[{"key":"url","valueType":"thumbnail","label":""},{"key":"url","valueType":"url","label":"URL"},{"key":"totalBytes","valueType":"bytes","label":"Size (KB)"},{"key":"wastedBytes","valueType":"bytes","label":"Potential Savings (KB)"}],"items":[{"url":"https://www.paulirish.com/assets/wikipedia-flamechart.jpg","fromProtocol":true,"isCrossOrigin":false,"totalBytes":76300,"wastedBytes":12774}],"overallSavingsMs":0,"overallSavingsBytes":12774}},"uses-text-compression":{"id":"uses-text-compression","title":"Enable text compression","description":"Text-based resources should be served with compression (gzip, deflate or brotli) to minimize total network bytes. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/text-compression).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"uses-responsive-images":{"id":"uses-responsive-images","title":"Properly size images","description":"Serve images that are appropriately-sized to save cellular data and improve load time. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/oversized-images).","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","warnings":[],"details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"efficient-animated-content":{"id":"efficient-animated-content","title":"Use video formats for animated content","description":"Large GIFs are inefficient for delivering animated content. Consider using MPEG4/WebM videos for animations and PNG/WebP for static images instead of GIF to save network bytes. [Learn more](https://developers.google.com/web/fundamentals/performance/optimizing-content-efficiency/replace-animated-gifs-with-video/)","score":1,"scoreDisplayMode":"numeric","rawValue":0,"displayValue":"","details":{"type":"opportunity","headings":[],"items":[],"overallSavingsMs":0,"overallSavingsBytes":0}},"appcache-manifest":{"id":"appcache-manifest","title":"Avoids Application Cache","description":"Application Cache is deprecated. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/appcache).","score":1,"scoreDisplayMode":"binary","rawValue":true,"displayValue":""},"doctype":{"id":"doctype","title":"Page has the HTML doctype","description":"Specifying a doctype prevents the browser from switching to quirks-mode.Read more on the [MDN Web Docs page](https://developer.mozilla.org/en-US/docs/Glossary/Doctype)","score":1,"scoreDisplayMode":"binary","rawValue":true},"dom-size":{"id":"dom-size","title":"Avoids an excessive DOM size","description":"Browser engineers recommend pages contain fewer than ~1,500 DOM nodes. The sweet spot is a tree depth \u003c 32 elements and fewer than 60 children/parent element. A large DOM can increase memory usage, cause longer [style calculations](https://developers.google.com/web/fundamentals/performance/rendering/reduce-the-scope-and-complexity-of-style-calculations), and produce costly [layout reflows](https://developers.google.com/speed/articles/reflow). [Learn more](https://developers.google.com/web/tools/lighthouse/audits/dom-size).","score":1,"scoreDisplayMode":"numeric","rawValue":446,"displayValue":"446 nodes","details":{"type":"table","headings":[{"key":"statistic","itemType":"text","text":"Statistic"},{"key":"element","itemType":"code","text":"Element"},{"key":"value","itemType":"numeric","text":"Value"}],"items":[{"statistic":"Total DOM Nodes","element":"","value":"446"},{"statistic":"Maximum DOM Depth","element":{"type":"code","value":"\u003ca href=\"http://trac.webkit.org/changeset/142163\">"},"value":"12"},{"statistic":"Maximum Child Elements","element":{"type":"code","value":"\u003cdiv class=\"entry-content\">"},"value":"67"}]}},"external-anchors-use-rel-noopener":{"id":"external-anchors-use-rel-noopener","title":"Links to cross-origin destinations are safe","description":"Add `rel=\"noopener\"` or `rel=\"noreferrer\"` to any external links to improve performance and prevent security vulnerabilities. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/noopener).","score":1,"scoreDisplayMode":"binary","rawValue":true,"warnings":[],"details":{"type":"table","headings":[],"items":[]}},"geolocation-on-start":{"id":"geolocation-on-start","title":"Avoids requesting the geolocation permission on page load","description":"Users are mistrustful of or confused by sites that request their location without context. Consider tying the request to user gestures instead. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/geolocation-on-load).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"no-document-write":{"id":"no-document-write","title":"Avoids `document.write()`","description":"For users on slow connections, external scripts dynamically injected via `document.write()` can delay page load by tens of seconds. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/document-write).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"no-vulnerable-libraries":{"id":"no-vulnerable-libraries","title":"Avoids front-end JavaScript libraries with known security vulnerabilities","description":"Some third-party scripts may contain known security vulnerabilities that are easily identified and exploited by attackers. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/vulnerabilities).","score":1,"scoreDisplayMode":"binary","rawValue":true,"displayValue":"","details":{"type":"table","headings":[],"items":[],"summary":{}}},"js-libraries":{"id":"js-libraries","title":"Detected JavaScript libraries","description":"All front-end JavaScript libraries detected on the page.","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[{"key":"name","itemType":"text","text":"Name"},{"key":"version","itemType":"text","text":"Version"}],"items":[{"name":"SWFObject"}],"summary":{}}},"notification-on-start":{"id":"notification-on-start","title":"Avoids requesting the notification permission on page load","description":"Users are mistrustful of or confused by sites that request to send notifications without context. Consider tying the request to user gestures instead. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/notifications-on-load).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"password-inputs-can-be-pasted-into":{"id":"password-inputs-can-be-pasted-into","title":"Allows users to paste into password fields","description":"Preventing password pasting undermines good security policy. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/password-pasting).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"uses-http2":{"id":"uses-http2","title":"Uses HTTP/2 for its own resources","description":"HTTP/2 offers many benefits over HTTP/1.1, including binary headers, multiplexing, and server push. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/http2).","score":1,"scoreDisplayMode":"binary","rawValue":true,"displayValue":"","details":{"type":"table","headings":[],"items":[]}},"uses-passive-event-listeners":{"id":"uses-passive-event-listeners","title":"Uses passive listeners to improve scrolling performance","description":"Consider marking your touch and wheel event listeners as `passive` to improve your page's scroll performance. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/passive-event-listeners).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"meta-description":{"id":"meta-description","title":"Document does not have a meta description","description":"Meta descriptions may be included in search results to concisely summarize page content. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/description).","score":0,"scoreDisplayMode":"binary","rawValue":false},"http-status-code":{"id":"http-status-code","title":"Page has successful HTTP status code","description":"Pages with unsuccessful HTTP status codes may not be indexed properly. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/successful-http-code).","score":1,"scoreDisplayMode":"binary","rawValue":true},"font-size":{"id":"font-size","title":"Document uses legible font sizes","description":"Font sizes less than 12px are too small to be legible and require mobile visitors to “pinch to zoom” in order to read. Strive to have >60% of page text ≥12px. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/font-sizes).","score":1,"scoreDisplayMode":"binary","rawValue":true,"displayValue":"100% legible text","details":{"type":"table","headings":[{"key":"source","itemType":"url","text":"Source"},{"key":"selector","itemType":"code","text":"Selector"},{"key":"coverage","itemType":"text","text":"% of Page Text"},{"key":"fontSize","itemType":"text","text":"Font Size"}],"items":[{"source":"Legible text","selector":"","coverage":"100.00%","fontSize":"≥ 12px"}]}},"link-text":{"id":"link-text","title":"Links have descriptive text","description":"Descriptive link text helps search engines understand your content. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/descriptive-link-text).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[],"summary":{}}},"is-crawlable":{"id":"is-crawlable","title":"Page isn’t blocked from indexing","description":"Search engines are unable to include your pages in search results if they don't have permission to crawl them. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/indexing).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"robots-txt":{"id":"robots-txt","title":"robots.txt is valid","description":"If your robots.txt file is malformed, crawlers may not be able to understand how you want your website to be crawled or indexed.","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[],"summary":{}}},"tap-targets":{"id":"tap-targets","title":"Tap targets are not sized appropriately","description":"Interactive elements like buttons and links should be large enough (48x48px), and have enough space around them, to be easy enough to tap without overlapping onto other elements. [Learn more](https://developers.google.com/web/fundamentals/accessibility/accessible-styles#multi-device_responsive_design).","score":0.64,"scoreDisplayMode":"binary","rawValue":false,"displayValue":"72% appropriately sized tap targets","details":{"type":"table","headings":[{"key":"tapTarget","itemType":"node","text":"Tap Target"},{"key":"size","itemType":"text","text":"Size"},{"key":"overlappingTarget","itemType":"node","text":"Overlapping Target"}],"items":[{"tapTarget":{"type":"node","snippet":"\u003ca href=\"http://www.webkit.org/coding/technical-articles.html\">WebKit internals technical articles | webkit.org\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,0,LI,0,A","selector":"div.entry-content > ul > li > a"},"overlappingTarget":{"type":"node","snippet":"\u003ca href=\"http://robertnyman.com/2013/02/14/webkit-an-objective-view/\">WebKit: An Objective View | Robert Nyman &amp; Rob Hawkes\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,1,LI,0,A","selector":"div.entry-content > ul > li > a"},"tapTargetScore":912,"overlappingTargetScore":456,"overlapScoreRatio":0.5,"size":"334x19","width":334,"height":19},{"tapTarget":{"type":"node","snippet":"\u003ca href=\"http://robertnyman.com/2013/02/14/webkit-an-objective-view/\">WebKit: An Objective View | Robert Nyman &amp; Rob Hawkes\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,1,LI,0,A","selector":"div.entry-content > ul > li > a"},"overlappingTarget":{"type":"node","snippet":"\u003ca href=\"http://ariya.ofilabs.com/2011/06/your-webkit-port-is-special-just-like-every-other-port.html\">your webkit port is special (just like every other port) | Ariya Hidayat\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,2,LI,0,A","selector":"div.entry-content > ul > li > a"},"tapTargetScore":912,"overlappingTargetScore":456,"overlapScoreRatio":0.5,"size":"324x19","width":324,"height":19},{"tapTarget":{"type":"node","snippet":"\u003ca href=\"http://ariya.ofilabs.com/2011/06/your-webkit-port-is-special-just-like-every-other-port.html\">your webkit port is special (just like every other port) | Ariya Hidayat\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,2,LI,0,A","selector":"div.entry-content > ul > li > a"},"overlappingTarget":{"type":"node","snippet":"\u003ca href=\"http://blogs.adobe.com/webplatform/2013/01/21/getting-started-with-the-webkit-layout-code/\">Getting Started With the WebKit Layout Code | Adobe Web Platform Blog\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,3,LI,0,A","selector":"div.entry-content > ul > li > a"},"tapTargetScore":912,"overlappingTargetScore":456,"overlapScoreRatio":0.5,"size":"338x19","width":338,"height":19},{"tapTarget":{"type":"node","snippet":"\u003ca href=\"http://blogs.adobe.com/webplatform/2013/01/21/getting-started-with-the-webkit-layout-code/\">Getting Started With the WebKit Layout Code | Adobe Web Platform Blog\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,3,LI,0,A","selector":"div.entry-content > ul > li > a"},"overlappingTarget":{"type":"node","snippet":"\u003ca href=\"http://arunpatole.com/blog/2011/webkit-documentation/\">WebKit Documentation Overview | Arun Patole\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,4,LI,0,A","selector":"div.entry-content > ul > li > a"},"tapTargetScore":912,"overlappingTargetScore":456,"overlapScoreRatio":0.5,"size":"334x19","width":334,"height":19},{"tapTarget":{"type":"node","snippet":"\u003ca href=\"http://arunpatole.com/blog/2011/webkit-documentation/\">WebKit Documentation Overview | Arun Patole\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,4,LI,0,A","selector":"div.entry-content > ul > li > a"},"overlappingTarget":{"type":"node","snippet":"\u003ca href=\"https://www.youtube.com/watch?v=RVnARGhhs9w\">Rendering in WebKit, by Eric Seidel | YouTube\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,5,LI,0,A","selector":"div.entry-content > ul > li > a"},"tapTargetScore":912,"overlappingTargetScore":456,"overlapScoreRatio":0.5,"size":"338x19","width":338,"height":19},{"tapTarget":{"type":"node","snippet":"\u003ca href=\"https://www.youtube.com/watch?v=RVnARGhhs9w\">Rendering in WebKit, by Eric Seidel | YouTube\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,5,LI,0,A","selector":"div.entry-content > ul > li > a"},"overlappingTarget":{"type":"node","snippet":"\u003ca href=\"http://www.igvita.com/slides/2012/web-performance-for-the-curious/\">web performance for the curious | Ilya Grigorik\u003c/a>","path":"1,HTML,1,BODY,2,DIV,0,DIV,0,DIV,2,ARTICLE,1,DIV,62,UL,6,LI,0,A","selector":"div.entry-content > ul > li > a"},"tapTargetScore":912,"overlappingTargetScore":456,"overlapScoreRatio":0.5,"size":"327x19","width":327,"height":19}]}},"hreflang":{"id":"hreflang","title":"Document has a valid `hreflang`","description":"hreflang links tell search engines what version of a page they should list in search results for a given language or region. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/hreflang).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"plugins":{"id":"plugins","title":"Document avoids plugins","description":"Search engines can't index plugin content, and many devices restrict plugins or don't support them. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/plugins).","score":1,"scoreDisplayMode":"binary","rawValue":true,"details":{"type":"table","headings":[],"items":[]}},"canonical":{"id":"canonical","title":"Document has a valid `rel=canonical`","description":"Canonical links suggest which URL to show in search results. [Learn more](https://developers.google.com/web/tools/lighthouse/audits/canonical).","score":1,"scoreDisplayMode":"binary","rawValue":true},"structured-data":{"id":"structured-data","title":"Structured data is valid","description":"Run the [Structured Data Testing Tool](https://search.google.com/structured-data/testing-tool/) and the [Structured Data Linter](http://linter.structured-data.org/) to validate structured data. [Learn more](https://developers.google.com/search/docs/guides/mark-up-content).","score":null,"scoreDisplayMode":"manual","rawValue":false}},"configSettings":{"output":["html"],"maxWaitForFcp":15000,"maxWaitForLoad":45000,"throttlingMethod":"simulate","throttling":{"rttMs":150,"throughputKbps":1638.4,"requestLatencyMs":562.5,"downloadThroughputKbps":1474.5600000000002,"uploadThroughputKbps":675,"cpuSlowdownMultiplier":4},"auditMode":false,"gatherMode":false,"disableStorageReset":false,"disableDeviceEmulation":false,"emulatedFormFactor":"mobile","channel":"cli","locale":"en-US","blockedUrlPatterns":null,"additionalTraceCategories":null,"extraHeaders":null,"precomputedLanternData":null,"onlyAudits":null,"onlyCategories":null,"skipAudits":null},"categories":{"performance":{"title":"Performance","auditRefs":[{"id":"first-contentful-paint","weight":3,"group":"metrics"},{"id":"first-meaningful-paint","weight":1,"group":"metrics"},{"id":"speed-index","weight":4,"group":"metrics"},{"id":"interactive","weight":5,"group":"metrics"},{"id":"first-cpu-idle","weight":2,"group":"metrics"},{"id":"estimated-input-latency","weight":0,"group":"metrics"},{"id":"max-potential-fid","weight":0},{"id":"render-blocking-resources","weight":0,"group":"load-opportunities"},{"id":"uses-responsive-images","weight":0,"group":"load-opportunities"},{"id":"offscreen-images","weight":0,"group":"load-opportunities"},{"id":"unminified-css","weight":0,"group":"load-opportunities"},{"id":"unminified-javascript","weight":0,"group":"load-opportunities"},{"id":"unused-css-rules","weight":0,"group":"load-opportunities"},{"id":"uses-optimized-images","weight":0,"group":"load-opportunities"},{"id":"uses-webp-images","weight":0,"group":"load-opportunities"},{"id":"uses-text-compression","weight":0,"group":"load-opportunities"},{"id":"uses-rel-preconnect","weight":0,"group":"load-opportunities"},{"id":"time-to-first-byte","weight":0,"group":"load-opportunities"},{"id":"redirects","weight":0,"group":"load-opportunities"},{"id":"uses-rel-preload","weight":0,"group":"load-opportunities"},{"id":"efficient-animated-content","weight":0,"group":"load-opportunities"},{"id":"total-byte-weight","weight":0,"group":"diagnostics"},{"id":"uses-long-cache-ttl","weight":0,"group":"diagnostics"},{"id":"dom-size","weight":0,"group":"diagnostics"},{"id":"critical-request-chains","weight":0,"group":"diagnostics"},{"id":"user-timings","weight":0,"group":"diagnostics"},{"id":"bootup-time","weight":0,"group":"diagnostics"},{"id":"mainthread-work-breakdown","weight":0,"group":"diagnostics"},{"id":"font-display","weight":0,"group":"diagnostics"},{"id":"network-requests","weight":0},{"id":"network-rtt","weight":0},{"id":"network-server-latency","weight":0},{"id":"main-thread-tasks","weight":0},{"id":"diagnostics","weight":0},{"id":"metrics","weight":0},{"id":"screenshot-thumbnails","weight":0},{"id":"final-screenshot","weight":0}],"id":"performance","score":0.99},"accessibility":{"title":"Accessibility","description":"These checks highlight opportunities to [improve the accessibility of your web app](https://developers.google.com/web/fundamentals/accessibility). Only a subset of accessibility issues can be automatically detected so manual testing is also encouraged.","manualDescription":"These items address areas which an automated testing tool cannot cover. Learn more in our guide on [conducting an accessibility review](https://developers.google.com/web/fundamentals/accessibility/how-to-review).","auditRefs":[{"id":"accesskeys","weight":0,"group":"a11y-navigation"},{"id":"aria-allowed-attr","weight":0,"group":"a11y-aria"},{"id":"aria-required-attr","weight":2,"group":"a11y-aria"},{"id":"aria-required-children","weight":5,"group":"a11y-aria"},{"id":"aria-required-parent","weight":2,"group":"a11y-aria"},{"id":"aria-roles","weight":3,"group":"a11y-aria"},{"id":"aria-valid-attr-value","weight":0,"group":"a11y-aria"},{"id":"aria-valid-attr","weight":0,"group":"a11y-aria"},{"id":"audio-caption","weight":0,"group":"a11y-audio-video"},{"id":"button-name","weight":0,"group":"a11y-names-labels"},{"id":"bypass","weight":10,"group":"a11y-navigation"},{"id":"color-contrast","weight":6,"group":"a11y-color-contrast"},{"id":"definition-list","weight":0,"group":"a11y-tables-lists"},{"id":"dlitem","weight":0,"group":"a11y-tables-lists"},{"id":"document-title","weight":2,"group":"a11y-names-labels"},{"id":"duplicate-id","weight":5,"group":"a11y-best-practices"},{"id":"frame-title","weight":0,"group":"a11y-names-labels"},{"id":"html-has-lang","weight":4,"group":"a11y-language"},{"id":"html-lang-valid","weight":1,"group":"a11y-language"},{"id":"image-alt","weight":8,"group":"a11y-names-labels"},{"id":"input-image-alt","weight":0,"group":"a11y-names-labels"},{"id":"label","weight":10,"group":"a11y-names-labels"},{"id":"layout-table","weight":0,"group":"a11y-tables-lists"},{"id":"link-name","weight":9,"group":"a11y-names-labels"},{"id":"list","weight":5,"group":"a11y-tables-lists"},{"id":"listitem","weight":4,"group":"a11y-tables-lists"},{"id":"meta-refresh","weight":0,"group":"a11y-best-practices"},{"id":"meta-viewport","weight":3,"group":"a11y-best-practices"},{"id":"object-alt","weight":0,"group":"a11y-names-labels"},{"id":"tabindex","weight":0,"group":"a11y-navigation"},{"id":"td-headers-attr","weight":1,"group":"a11y-tables-lists"},{"id":"th-has-data-cells","weight":1,"group":"a11y-tables-lists"},{"id":"valid-lang","weight":0,"group":"a11y-language"},{"id":"video-caption","weight":0,"group":"a11y-audio-video"},{"id":"video-description","weight":0,"group":"a11y-audio-video"},{"id":"logical-tab-order","weight":0},{"id":"focusable-controls","weight":0},{"id":"interactive-element-affordance","weight":0},{"id":"managed-focus","weight":0},{"id":"focus-traps","weight":0},{"id":"custom-controls-labels","weight":0},{"id":"custom-controls-roles","weight":0},{"id":"visual-order-follows-dom","weight":0},{"id":"offscreen-content-hidden","weight":0},{"id":"heading-levels","weight":0},{"id":"use-landmarks","weight":0}],"id":"accessibility","score":0.56},"best-practices":{"title":"Best Practices","auditRefs":[{"id":"appcache-manifest","weight":1},{"id":"is-on-https","weight":1},{"id":"uses-http2","weight":1},{"id":"uses-passive-event-listeners","weight":1},{"id":"no-document-write","weight":1},{"id":"external-anchors-use-rel-noopener","weight":1},{"id":"geolocation-on-start","weight":1},{"id":"doctype","weight":1},{"id":"no-vulnerable-libraries","weight":1},{"id":"js-libraries","weight":0},{"id":"notification-on-start","weight":1},{"id":"deprecations","weight":1},{"id":"password-inputs-can-be-pasted-into","weight":1},{"id":"errors-in-console","weight":1},{"id":"image-aspect-ratio","weight":1}],"id":"best-practices","score":0.93},"seo":{"title":"SEO","description":"These checks ensure that your page is optimized for search engine results ranking. There are additional factors Lighthouse does not check that may affect your search ranking. [Learn more](https://support.google.com/webmasters/answer/35769).","manualDescription":"Run these additional validators on your site to check additional SEO best practices.","auditRefs":[{"id":"viewport","weight":1,"group":"seo-mobile"},{"id":"document-title","weight":1,"group":"seo-content"},{"id":"meta-description","weight":1,"group":"seo-content"},{"id":"http-status-code","weight":1,"group":"seo-crawl"},{"id":"link-text","weight":1,"group":"seo-content"},{"id":"is-crawlable","weight":1,"group":"seo-crawl"},{"id":"robots-txt","weight":1,"group":"seo-crawl"},{"id":"hreflang","weight":1,"group":"seo-content"},{"id":"canonical","weight":1,"group":"seo-content"},{"id":"font-size","weight":1,"group":"seo-mobile"},{"id":"plugins","weight":1,"group":"seo-content"},{"id":"tap-targets","weight":1,"group":"seo-mobile"},{"id":"structured-data","weight":0}],"id":"seo","score":0.89},"pwa":{"title":"Progressive Web App","description":"These checks validate the aspects of a Progressive Web App. [Learn more](https://developers.google.com/web/progressive-web-apps/checklist).","manualDescription":"These checks are required by the baseline [PWA Checklist](https://developers.google.com/web/progressive-web-apps/checklist) but are not automatically checked by Lighthouse. They do not affect your score but it's important that you verify them manually.","auditRefs":[{"id":"load-fast-enough-for-pwa","weight":7,"group":"pwa-fast-reliable"},{"id":"works-offline","weight":5,"group":"pwa-fast-reliable"},{"id":"offline-start-url","weight":1,"group":"pwa-fast-reliable"},{"id":"is-on-https","weight":2,"group":"pwa-installable"},{"id":"service-worker","weight":1,"group":"pwa-installable"},{"id":"installable-manifest","weight":2,"group":"pwa-installable"},{"id":"redirects-http","weight":2,"group":"pwa-optimized"},{"id":"splash-screen","weight":1,"group":"pwa-optimized"},{"id":"themed-omnibox","weight":1,"group":"pwa-optimized"},{"id":"content-width","weight":1,"group":"pwa-optimized"},{"id":"viewport","weight":2,"group":"pwa-optimized"},{"id":"without-javascript","weight":1,"group":"pwa-optimized"},{"id":"pwa-cross-browser","weight":0},{"id":"pwa-page-transitions","weight":0},{"id":"pwa-each-page-has-url","weight":0}],"id":"pwa","score":0.58}},"categoryGroups":{"metrics":{"title":"Metrics"},"load-opportunities":{"title":"Opportunities","description":"These optimizations can speed up your page load."},"diagnostics":{"title":"Diagnostics","description":"More information about the performance of your application."},"pwa-fast-reliable":{"title":"Fast and reliable"},"pwa-installable":{"title":"Installable"},"pwa-optimized":{"title":"PWA Optimized"},"a11y-best-practices":{"title":"Best practices","description":"These items highlight common accessibility best practices."},"a11y-color-contrast":{"title":"Contrast","description":"These are opportunities to improve the legibility of your content."},"a11y-names-labels":{"title":"Names and labels","description":"These are opportunities to improve the semantics of the controls in your application. This may enhance the experience for users of assistive technology, like a screen reader."},"a11y-navigation":{"title":"Navigation","description":"These are opportunities to improve keyboard navigation in your application."},"a11y-aria":{"title":"ARIA","description":"These are opportunities to improve the usage of ARIA in your application which may enhance the experience for users of assistive technology, like a screen reader."},"a11y-language":{"title":"Internationalization and localization","description":"These are opportunities to improve the interpretation of your content by users in different locales."},"a11y-audio-video":{"title":"Audio and video","description":"These are opportunities to provide alternative content for audio and video. This may improve the experience for users with hearing or vision impairments."},"a11y-tables-lists":{"title":"Tables and lists","description":"These are opportunities to to improve the experience of reading tabular or list data using assistive technology, like a screen reader."},"seo-mobile":{"title":"Mobile Friendly","description":"Make sure your pages are mobile friendly so users don’t have to pinch or zoom in order to read the content pages. [Learn more](https://developers.google.com/search/mobile-sites/)."},"seo-content":{"title":"Content Best Practices","description":"Format your HTML in a way that enables crawlers to better understand your app’s content."},"seo-crawl":{"title":"Crawling and Indexing","description":"To appear in search results, crawlers need access to your app."}},"timing":{"entries":[{"startTime":1073.128567,"name":"lh:init:config","duration":145.578395,"entryType":"measure"},{"startTime":1077.765561,"name":"lh:config:requireGatherers","duration":28.765166000000136,"entryType":"measure"},{"startTime":1106.859737,"name":"lh:config:requireAudits","duration":105.86465700000008,"entryType":"measure"},{"startTime":1219.06463,"name":"lh:runner:run","duration":5693.490078,"entryType":"measure"},{"startTime":1219.893402,"name":"lh:init:connect","duration":241.45741199999998,"entryType":"measure"},{"startTime":1461.68199,"name":"lh:gather:getVersion","duration":27.55338000000006,"entryType":"measure"},{"startTime":1489.541879,"name":"lh:gather:loadBlank","duration":122.42310599999996,"entryType":"measure"},{"startTime":1612.055715,"name":"lh:gather:getBenchmarkIndex","duration":506.6763540000002,"entryType":"measure"},{"startTime":2118.855732,"name":"lh:gather:setupDriver","duration":19.890731999999844,"entryType":"measure"},{"startTime":2140.353731,"name":"lh:gather:beforePass","duration":3.6588119999996707,"entryType":"measure"},{"startTime":2141.33011,"name":"lh:gather:beforePass:Scripts","duration":0.07662200000004304,"entryType":"measure"},{"startTime":2141.426971,"name":"lh:gather:beforePass:CSSUsage","duration":0.024869000000308006,"entryType":"measure"},{"startTime":2141.463567,"name":"lh:gather:beforePass:ViewportDimensions","duration":0.026212000000214175,"entryType":"measure"},{"startTime":2141.499128,"name":"lh:gather:beforePass:RuntimeExceptions","duration":0.05758900000000722,"entryType":"measure"},{"startTime":2141.574255,"name":"lh:gather:beforePass:ChromeConsoleMessages","duration":1.349565999999868,"entryType":"measure"},{"startTime":2142.943345,"name":"lh:gather:beforePass:Accessibility","duration":0.028436000000056083,"entryType":"measure"},{"startTime":2142.977277,"name":"lh:gather:beforePass:AnchorElements","duration":0.02977199999986624,"entryType":"measure"},{"startTime":2143.011008,"name":"lh:gather:beforePass:ImageElements","duration":0.013730000000123255,"entryType":"measure"},{"startTime":2143.028539,"name":"lh:gather:beforePass:LinkElements","duration":0.013406000000031781,"entryType":"measure"},{"startTime":2143.048436,"name":"lh:gather:beforePass:MetaElements","duration":0.015538999999989755,"entryType":"measure"},{"startTime":2143.068088,"name":"lh:gather:beforePass:AppCacheManifest","duration":0.012079000000085216,"entryType":"measure"},{"startTime":2143.083371,"name":"lh:gather:beforePass:Doctype","duration":0.01269400000001042,"entryType":"measure"},{"startTime":2143.102319,"name":"lh:gather:beforePass:DOMStats","duration":0.01137399999970512,"entryType":"measure"},{"startTime":2143.121006,"name":"lh:gather:beforePass:JSLibraries","duration":0.011422999999922467,"entryType":"measure"},{"startTime":2143.137751,"name":"lh:gather:beforePass:OptimizedImages","duration":0.011604999999690335,"entryType":"measure"},{"startTime":2143.152554,"name":"lh:gather:beforePass:PasswordInputsWithPreventedPaste","duration":0.021525999999994383,"entryType":"measure"},{"startTime":2143.177766,"name":"lh:gather:beforePass:ResponseCompression","duration":0.01145200000019031,"entryType":"measure"},{"startTime":2143.192268,"name":"lh:gather:beforePass:TagsBlockingFirstPaint","duration":0.7022360000000845,"entryType":"measure"},{"startTime":2143.906945,"name":"lh:gather:beforePass:FontSize","duration":0.022426999999879627,"entryType":"measure"},{"startTime":2143.934237,"name":"lh:gather:beforePass:Hreflang","duration":0.015292999999928725,"entryType":"measure"},{"startTime":2143.953002,"name":"lh:gather:beforePass:EmbeddedContent","duration":0.010128999999778898,"entryType":"measure"},{"startTime":2143.966248,"name":"lh:gather:beforePass:Canonical","duration":0.01108299999987139,"entryType":"measure"},{"startTime":2143.983073,"name":"lh:gather:beforePass:RobotsTxt","duration":0.009214000000156375,"entryType":"measure"},{"startTime":2143.998983,"name":"lh:gather:beforePass:TapTargets","duration":0.00937000000021726,"entryType":"measure"},{"startTime":2144.308303,"name":"lh:gather:loadPage-defaultPass","duration":2833.8502560000006,"entryType":"measure"},{"startTime":2168.811732,"name":"lh:gather:getVersion","duration":0.4951059999998506,"entryType":"measure"},{"startTime":4978.176537,"name":"lh:gather:pass","duration":2.0856159999993906,"entryType":"measure"},{"startTime":4981.663817,"name":"lh:gather:getTrace","duration":77.708122,"entryType":"measure"},{"startTime":5059.380618,"name":"lh:gather:getDevtoolsLog","duration":4.147135000000162,"entryType":"measure"},{"startTime":5064.8316,"name":"lh:gather:afterPass","duration":1041.514201,"entryType":"measure"},{"startTime":5064.854631,"name":"lh:gather:afterPass:Scripts","duration":17.255841999999575,"entryType":"measure"},{"startTime":5082.14956,"name":"lh:gather:afterPass:CSSUsage","duration":29.262732000000142,"entryType":"measure"},{"startTime":5111.431288,"name":"lh:gather:afterPass:ViewportDimensions","duration":1.5186430000003384,"entryType":"measure"},{"startTime":5112.969304,"name":"lh:gather:afterPass:RuntimeExceptions","duration":0.1684690000001865,"entryType":"measure"},{"startTime":5113.152327,"name":"lh:gather:afterPass:ChromeConsoleMessages","duration":1.4196600000004764,"entryType":"measure"},{"startTime":5114.597595,"name":"lh:gather:afterPass:Accessibility","duration":411.8059320000002,"entryType":"measure"},{"startTime":5526.414937,"name":"lh:gather:afterPass:AnchorElements","duration":4.693152000000737,"entryType":"measure"},{"startTime":5531.11912,"name":"lh:gather:afterPass:ImageElements","duration":7.262862999999925,"entryType":"measure"},{"startTime":5538.393007,"name":"lh:gather:afterPass:LinkElements","duration":1.491468000000168,"entryType":"measure"},{"startTime":5539.894275,"name":"lh:gather:afterPass:MetaElements","duration":1.6690630000002784,"entryType":"measure"},{"startTime":5541.574639,"name":"lh:gather:afterPass:AppCacheManifest","duration":2.1861699999999473,"entryType":"measure"},{"startTime":5543.771189,"name":"lh:gather:afterPass:Doctype","duration":1.5129369999995106,"entryType":"measure"},{"startTime":5545.301535,"name":"lh:gather:afterPass:DOMStats","duration":14.796943000000283,"entryType":"measure"},{"startTime":5560.110275,"name":"lh:gather:afterPass:JSLibraries","duration":7.722287999999935,"entryType":"measure"},{"startTime":5567.846181,"name":"lh:gather:afterPass:OptimizedImages","duration":141.49717899999996,"entryType":"measure"},{"startTime":5709.355249,"name":"lh:gather:afterPass:PasswordInputsWithPreventedPaste","duration":1.1078189999998358,"entryType":"measure"},{"startTime":5710.471871,"name":"lh:gather:afterPass:ResponseCompression","duration":0.3295590000006996,"entryType":"measure"},{"startTime":5710.808581,"name":"lh:gather:afterPass:TagsBlockingFirstPaint","duration":2.9262909999997646,"entryType":"measure"},{"startTime":5713.749233,"name":"lh:gather:afterPass:FontSize","duration":309.7878950000004,"entryType":"measure"},{"startTime":6023.55243,"name":"lh:gather:afterPass:Hreflang","duration":2.70325000000048,"entryType":"measure"},{"startTime":6026.271341,"name":"lh:gather:afterPass:EmbeddedContent","duration":1.3645409999999174,"entryType":"measure"},{"startTime":6027.646591,"name":"lh:gather:afterPass:Canonical","duration":2.1342210000002524,"entryType":"measure"},{"startTime":6029.791251,"name":"lh:gather:afterPass:RobotsTxt","duration":66.72282799999994,"entryType":"measure"},{"startTime":6096.536745,"name":"lh:gather:afterPass:TapTargets","duration":9.797010999999657,"entryType":"measure"},{"startTime":6107.219863,"name":"lh:gather:loadBlank","duration":15.30551899999955,"entryType":"measure"},{"startTime":6122.543312,"name":"lh:gather:beforePass","duration":7.926860000000488,"entryType":"measure"},{"startTime":6126.015984,"name":"lh:gather:beforePass:ServiceWorker","duration":3.4273659999998927,"entryType":"measure"},{"startTime":6129.462365,"name":"lh:gather:beforePass:Offline","duration":0.963263999999981,"entryType":"measure"},{"startTime":6130.445767,"name":"lh:gather:beforePass:StartUrl","duration":0.017423000000235334,"entryType":"measure"},{"startTime":6130.498988,"name":"lh:gather:loadPage-offlinePass","duration":78.27552599999945,"entryType":"measure"},{"startTime":6208.786069,"name":"lh:gather:pass","duration":0.16528999999991356,"entryType":"measure"},{"startTime":6208.962023,"name":"lh:gather:getDevtoolsLog","duration":1.7983269999995173,"entryType":"measure"},{"startTime":6211.61975,"name":"lh:gather:afterPass","duration":1.7303910000000542,"entryType":"measure"},{"startTime":6211.638439,"name":"lh:gather:afterPass:ServiceWorker","duration":0.1070399999998699,"entryType":"measure"},{"startTime":6211.754243,"name":"lh:gather:afterPass:Offline","duration":1.3464439999997921,"entryType":"measure"},{"startTime":6213.112646,"name":"lh:gather:afterPass:StartUrl","duration":0.22697400000015477,"entryType":"measure"},{"startTime":6214.108238,"name":"lh:gather:loadBlank","duration":11.405410000000302,"entryType":"measure"},{"startTime":6225.576279,"name":"lh:gather:beforePass","duration":2.911079000000427,"entryType":"measure"},{"startTime":6228.216948,"name":"lh:gather:beforePass:HTTPRedirect","duration":0.182847999999467,"entryType":"measure"},{"startTime":6228.421524,"name":"lh:gather:beforePass:HTMLWithoutJavaScript","duration":0.05845999999928608,"entryType":"measure"},{"startTime":6228.533617,"name":"lh:gather:loadPage-redirectPass","duration":115.26743199999964,"entryType":"measure"},{"startTime":6343.810364,"name":"lh:gather:pass","duration":0.17085099999985687,"entryType":"measure"},{"startTime":6343.992707,"name":"lh:gather:getDevtoolsLog","duration":2.6746259999999893,"entryType":"measure"},{"startTime":6347.413759,"name":"lh:gather:afterPass","duration":6.562012999999752,"entryType":"measure"},{"startTime":6347.426309,"name":"lh:gather:afterPass:HTTPRedirect","duration":4.361055999999735,"entryType":"measure"},{"startTime":6351.800351,"name":"lh:gather:afterPass:HTMLWithoutJavaScript","duration":2.165234000000055,"entryType":"measure"},{"startTime":6356.881362,"name":"lh:gather:disconnect","duration":4.274618000000373,"entryType":"measure"},{"startTime":6361.911913,"name":"lh:runner:auditing","duration":549.9276890000001,"entryType":"measure"},{"startTime":6363.692714,"name":"lh:audit:is-on-https","duration":4.638246999999865,"entryType":"measure"},{"startTime":6364.278425,"name":"lh:computed:NetworkRecords","duration":3.0833339999999225,"entryType":"measure"},{"startTime":6368.3788,"name":"lh:audit:redirects-http","duration":0.2193619999998191,"entryType":"measure"},{"startTime":6368.622995,"name":"lh:audit:service-worker","duration":0.29208999999991647,"entryType":"measure"},{"startTime":6368.93565,"name":"lh:audit:works-offline","duration":0.2530289999995148,"entryType":"measure"},{"startTime":6369.209298,"name":"lh:audit:viewport","duration":1.0146279999999024,"entryType":"measure"},{"startTime":6369.413917,"name":"lh:computed:ViewportMeta","duration":0.7570960000002742,"entryType":"measure"},{"startTime":6370.244213,"name":"lh:audit:without-javascript","duration":0.21050000000013824,"entryType":"measure"},{"startTime":6374.553738,"name":"lh:audit:first-contentful-paint","duration":35.44499900000028,"entryType":"measure"},{"startTime":6374.952616,"name":"lh:computed:FirstContentfulPaint","duration":34.653182000000015,"entryType":"measure"},{"startTime":6375.189329,"name":"lh:computed:TraceOfTab","duration":25.20696399999997,"entryType":"measure"},{"startTime":6400.510372,"name":"lh:computed:LanternFirstContentfulPaint","duration":9.084044000000176,"entryType":"measure"},{"startTime":6400.734805,"name":"lh:computed:PageDependencyGraph","duration":2.1514870000000883,"entryType":"measure"},{"startTime":6402.91386,"name":"lh:computed:LoadSimulator","duration":2.664727000000312,"entryType":"measure"},{"startTime":6403.042082,"name":"lh:computed:NetworkAnalysis","duration":2.312861999999768,"entryType":"measure"},{"startTime":6410.305511,"name":"lh:audit:first-meaningful-paint","duration":2.529657000000043,"entryType":"measure"},{"startTime":6410.696449,"name":"lh:computed:FirstMeaningfulPaint","duration":1.972976000000017,"entryType":"measure"},{"startTime":6410.786669,"name":"lh:computed:LanternFirstMeaningfulPaint","duration":1.8715400000000955,"entryType":"measure"},{"startTime":6412.997149,"name":"lh:audit:load-fast-enough-for-pwa","duration":5.364005000000361,"entryType":"measure"},{"startTime":6413.281407,"name":"lh:computed:Interactive","duration":4.926112999999532,"entryType":"measure"},{"startTime":6413.343508,"name":"lh:computed:LanternInteractive","duration":4.851827000000412,"entryType":"measure"},{"startTime":6418.493103,"name":"lh:audit:speed-index","duration":244.94660699999986,"entryType":"measure"},{"startTime":6418.742089,"name":"lh:computed:SpeedIndex","duration":244.59223399999973,"entryType":"measure"},{"startTime":6418.812705,"name":"lh:computed:LanternSpeedIndex","duration":244.51201799999944,"entryType":"measure"},{"startTime":6418.911378,"name":"lh:computed:Speedline","duration":238.42984700000034,"entryType":"measure"},{"startTime":6663.456368,"name":"lh:audit:screenshot-thumbnails","duration":118.65100100000018,"entryType":"measure"},{"startTime":6782.123307,"name":"lh:audit:final-screenshot","duration":0.6816960000005565,"entryType":"measure"},{"startTime":6782.314558,"name":"lh:computed:Screenshots","duration":0.447783999999956,"entryType":"measure"},{"startTime":6782.950289,"name":"lh:audit:estimated-input-latency","duration":6.8559299999997165,"entryType":"measure"},{"startTime":6783.175044,"name":"lh:computed:EstimatedInputLatency","duration":6.529805000000124,"entryType":"measure"},{"startTime":6783.225133,"name":"lh:computed:LanternEstimatedInputLatency","duration":6.470986999999695,"entryType":"measure"},{"startTime":6789.919147,"name":"lh:audit:max-potential-fid","duration":4.780943000000661,"entryType":"measure"},{"startTime":6790.087411,"name":"lh:computed:MaxPotentialFID","duration":4.517272999999477,"entryType":"measure"},{"startTime":6790.13528,"name":"lh:computed:LanternMaxPotentialFID","duration":4.461671999999453,"entryType":"measure"},{"startTime":6794.714094,"name":"lh:audit:errors-in-console","duration":0.25573199999962526,"entryType":"measure"},{"startTime":6795.115901,"name":"lh:audit:time-to-first-byte","duration":0.6077820000000429,"entryType":"measure"},{"startTime":6795.32897,"name":"lh:computed:MainResource","duration":0.21866399999998976,"entryType":"measure"},{"startTime":6795.810472,"name":"lh:audit:first-cpu-idle","duration":3.7231149999997797,"entryType":"measure"},{"startTime":6795.96094,"name":"lh:computed:FirstCPUIdle","duration":3.396230999999716,"entryType":"measure"},{"startTime":6796.004162,"name":"lh:computed:LanternFirstCPUIdle","duration":3.3396999999995387,"entryType":"measure"},{"startTime":6799.683618,"name":"lh:audit:interactive","duration":0.749815000000126,"entryType":"measure"},{"startTime":6800.592698,"name":"lh:audit:user-timings","duration":1.537305999999262,"entryType":"measure"},{"startTime":6800.910259,"name":"lh:computed:UserTimings","duration":0.7398779999994076,"entryType":"measure"},{"startTime":6802.266094,"name":"lh:audit:critical-request-chains","duration":1.3206440000003568,"entryType":"measure"},{"startTime":6802.460742,"name":"lh:computed:CriticalRequestChains","duration":0.4359679999997752,"entryType":"measure"},{"startTime":6803.729167,"name":"lh:audit:redirects","duration":0.6607899999999063,"entryType":"measure"},{"startTime":6804.403378,"name":"lh:audit:installable-manifest","duration":0.43684699999994336,"entryType":"measure"},{"startTime":6804.573483,"name":"lh:computed:ManifestValues","duration":0.09038499999951455,"entryType":"measure"},{"startTime":6804.852125,"name":"lh:audit:splash-screen","duration":0.19688999999925727,"entryType":"measure"},{"startTime":6805.059136,"name":"lh:audit:themed-omnibox","duration":0.2386050000004616,"entryType":"measure"},{"startTime":6805.30846,"name":"lh:audit:content-width","duration":0.13581999999951222,"entryType":"measure"},{"startTime":6805.455304,"name":"lh:audit:image-aspect-ratio","duration":0.4286629999996876,"entryType":"measure"},{"startTime":6805.898432,"name":"lh:audit:deprecations","duration":0.16642500000034488,"entryType":"measure"},{"startTime":6806.20981,"name":"lh:audit:mainthread-work-breakdown","duration":3.0621409999994285,"entryType":"measure"},{"startTime":6806.450386,"name":"lh:computed:MainThreadTasks","duration":2.219640999999683,"entryType":"measure"},{"startTime":6809.400643,"name":"lh:audit:bootup-time","duration":1.2159469999996873,"entryType":"measure"},{"startTime":6810.732886,"name":"lh:audit:uses-rel-preload","duration":1.1837640000003375,"entryType":"measure"},{"startTime":6811.174867,"name":"lh:computed:LoadSimulator","duration":0.08334100000047329,"entryType":"measure"},{"startTime":6812.017352,"name":"lh:audit:uses-rel-preconnect","duration":0.7355589999997392,"entryType":"measure"},{"startTime":6812.863306,"name":"lh:audit:font-display","duration":0.6109519999999975,"entryType":"measure"},{"startTime":6813.484814,"name":"lh:audit:diagnostics","duration":0.5239480000000185,"entryType":"measure"},{"startTime":6814.020046,"name":"lh:audit:network-requests","duration":0.5205850000002101,"entryType":"measure"},{"startTime":6814.641059,"name":"lh:audit:network-rtt","duration":0.3715090000005148,"entryType":"measure"},{"startTime":6815.099597,"name":"lh:audit:network-server-latency","duration":3.0696579999994356,"entryType":"measure"},{"startTime":6818.192242,"name":"lh:audit:main-thread-tasks","duration":0.30102400000032503,"entryType":"measure"},{"startTime":6818.503471,"name":"lh:audit:metrics","duration":0.6292599999997037,"entryType":"measure"},{"startTime":6819.142983,"name":"lh:audit:offline-start-url","duration":0.13052500000048894,"entryType":"measure"},{"startTime":6819.294765,"name":"lh:audit:pwa-cross-browser","duration":0.08340000000043801,"entryType":"measure"},{"startTime":6819.392234,"name":"lh:audit:pwa-page-transitions","duration":0.054068999999799416,"entryType":"measure"},{"startTime":6819.458624,"name":"lh:audit:pwa-each-page-has-url","duration":0.043276999999761756,"entryType":"measure"},{"startTime":6819.666242,"name":"lh:audit:accesskeys","duration":0.3165929999995569,"entryType":"measure"},{"startTime":6820.087415,"name":"lh:audit:aria-allowed-attr","duration":0.19204199999967386,"entryType":"measure"},{"startTime":6820.402144,"name":"lh:audit:aria-required-attr","duration":0.548916000000645,"entryType":"measure"},{"startTime":6821.117983,"name":"lh:audit:aria-required-children","duration":0.4861250000003565,"entryType":"measure"},{"startTime":6821.716206,"name":"lh:audit:aria-required-parent","duration":0.4643239999995785,"entryType":"measure"},{"startTime":6822.270556,"name":"lh:audit:aria-roles","duration":0.4658999999992375,"entryType":"measure"},{"startTime":6822.836287,"name":"lh:audit:aria-valid-attr-value","duration":0.18487699999968754,"entryType":"measure"},{"startTime":6823.12717,"name":"lh:audit:aria-valid-attr","duration":0.19652899999982765,"entryType":"measure"},{"startTime":6823.442274,"name":"lh:audit:audio-caption","duration":0.2037799999998242,"entryType":"measure"},{"startTime":6823.740655,"name":"lh:audit:button-name","duration":0.2154290000007677,"entryType":"measure"},{"startTime":6824.070889,"name":"lh:audit:bypass","duration":0.4491680000000997,"entryType":"measure"},{"startTime":6824.636107,"name":"lh:audit:color-contrast","duration":0.48393099999975675,"entryType":"measure"},{"startTime":6825.258638,"name":"lh:audit:definition-list","duration":0.2339350000002014,"entryType":"measure"},{"startTime":6825.60277,"name":"lh:audit:dlitem","duration":0.23442999999952008,"entryType":"measure"},{"startTime":6825.932578,"name":"lh:audit:document-title","duration":0.7708199999997305,"entryType":"measure"},{"startTime":6826.820479,"name":"lh:audit:duplicate-id","duration":0.46049500000026455,"entryType":"measure"},{"startTime":6827.394367,"name":"lh:audit:frame-title","duration":0.28010600000015984,"entryType":"measure"},{"startTime":6827.776405,"name":"lh:audit:html-has-lang","duration":0.5294640000001891,"entryType":"measure"},{"startTime":6828.431607,"name":"lh:audit:html-lang-valid","duration":0.5001959999999599,"entryType":"measure"},{"startTime":6829.031444,"name":"lh:audit:image-alt","duration":0.5463089999993826,"entryType":"measure"},{"startTime":6829.686871,"name":"lh:audit:input-image-alt","duration":0.2964830000000802,"entryType":"measure"},{"startTime":6830.077177,"name":"lh:audit:label","duration":0.3877179999999498,"entryType":"measure"},{"startTime":6830.592431,"name":"lh:audit:layout-table","duration":0.29171000000042113,"entryType":"measure"},{"startTime":6830.973986,"name":"lh:audit:link-name","duration":0.40360299999974814,"entryType":"measure"},{"startTime":6831.504119,"name":"lh:audit:list","duration":0.3948789999994915,"entryType":"measure"},{"startTime":6832.019048,"name":"lh:audit:listitem","duration":0.40166799999951763,"entryType":"measure"},{"startTime":6832.523899,"name":"lh:audit:meta-refresh","duration":0.2903390000001309,"entryType":"measure"},{"startTime":6832.966556,"name":"lh:audit:meta-viewport","duration":0.4253439999993134,"entryType":"measure"},{"startTime":6833.4922,"name":"lh:audit:object-alt","duration":0.3514210000003004,"entryType":"measure"},{"startTime":6834.019316,"name":"lh:audit:tabindex","duration":0.4448400000001129,"entryType":"measure"},{"startTime":6834.733958,"name":"lh:audit:td-headers-attr","duration":0.6080040000006193,"entryType":"measure"},{"startTime":6835.563551,"name":"lh:audit:th-has-data-cells","duration":0.5483899999999267,"entryType":"measure"},{"startTime":6836.238216,"name":"lh:audit:valid-lang","duration":0.34035899999980757,"entryType":"measure"},{"startTime":6836.692265,"name":"lh:audit:video-caption","duration":0.3401270000003933,"entryType":"measure"},{"startTime":6837.144013,"name":"lh:audit:video-description","duration":0.3590359999998327,"entryType":"measure"},{"startTime":6837.519764,"name":"lh:audit:custom-controls-labels","duration":0.051264000000628585,"entryType":"measure"},{"startTime":6837.582196,"name":"lh:audit:custom-controls-roles","duration":0.042766999999912514,"entryType":"measure"},{"startTime":6837.634862,"name":"lh:audit:focus-traps","duration":0.04288799999994808,"entryType":"measure"},{"startTime":6837.687226,"name":"lh:audit:focusable-controls","duration":0.041274999999586726,"entryType":"measure"},{"startTime":6837.738256,"name":"lh:audit:heading-levels","duration":0.04073500000049535,"entryType":"measure"},{"startTime":6837.788326,"name":"lh:audit:interactive-element-affordance","duration":0.04048800000055053,"entryType":"measure"},{"startTime":6837.838222,"name":"lh:audit:logical-tab-order","duration":0.05197299999963434,"entryType":"measure"},{"startTime":6837.904748,"name":"lh:audit:managed-focus","duration":0.08421900000030291,"entryType":"measure"},{"startTime":6838.004698,"name":"lh:audit:offscreen-content-hidden","duration":0.05861000000004424,"entryType":"measure"},{"startTime":6838.074677,"name":"lh:audit:use-landmarks","duration":0.04893400000037218,"entryType":"measure"},{"startTime":6838.134002,"name":"lh:audit:visual-order-follows-dom","duration":0.04579699999976583,"entryType":"measure"},{"startTime":6838.310309,"name":"lh:audit:uses-long-cache-ttl","duration":1.594412999999804,"entryType":"measure"},{"startTime":6840.039948,"name":"lh:audit:total-byte-weight","duration":0.5256370000006427,"entryType":"measure"},{"startTime":6840.677706,"name":"lh:audit:offscreen-images","duration":3.692417999999634,"entryType":"measure"},{"startTime":6844.513703,"name":"lh:audit:render-blocking-resources","duration":6.532333000000108,"entryType":"measure"},{"startTime":6849.525673,"name":"lh:computed:FirstContentfulPaint","duration":0.961395999999695,"entryType":"measure"},{"startTime":6849.575967,"name":"lh:computed:LanternFirstContentfulPaint","duration":0.9030069999998886,"entryType":"measure"},{"startTime":6851.149302,"name":"lh:audit:unminified-css","duration":12.678757000000587,"entryType":"measure"},{"startTime":6863.930275,"name":"lh:audit:unminified-javascript","duration":20.3614290000005,"entryType":"measure"},{"startTime":6884.413608,"name":"lh:audit:unused-css-rules","duration":1.8756810000004407,"entryType":"measure"},{"startTime":6886.392722,"name":"lh:audit:uses-webp-images","duration":2.182443000000603,"entryType":"measure"},{"startTime":6888.664204,"name":"lh:audit:uses-optimized-images","duration":2.2328310000002602,"entryType":"measure"},{"startTime":6890.997438,"name":"lh:audit:uses-text-compression","duration":1.6574609999997847,"entryType":"measure"},{"startTime":6892.744347,"name":"lh:audit:uses-responsive-images","duration":2.193594999999732,"entryType":"measure"},{"startTime":6895.313328,"name":"lh:audit:efficient-animated-content","duration":2.65410299999985,"entryType":"measure"},{"startTime":6897.979869,"name":"lh:audit:appcache-manifest","duration":0.11764500000026601,"entryType":"measure"},{"startTime":6898.10798,"name":"lh:audit:doctype","duration":0.11165799999980663,"entryType":"measure"},{"startTime":6898.327168,"name":"lh:audit:dom-size","duration":0.7559000000001106,"entryType":"measure"},{"startTime":6899.094812,"name":"lh:audit:external-anchors-use-rel-noopener","duration":0.2530980000001364,"entryType":"measure"},{"startTime":6899.362366,"name":"lh:audit:geolocation-on-start","duration":0.22945699999945646,"entryType":"measure"},{"startTime":6899.610692,"name":"lh:audit:no-document-write","duration":0.195941999999377,"entryType":"measure"},{"startTime":6899.837832,"name":"lh:audit:no-vulnerable-libraries","duration":0.6282069999997475,"entryType":"measure"},{"startTime":6900.498221,"name":"lh:audit:js-libraries","duration":0.30354200000056153,"entryType":"measure"},{"startTime":6900.823059,"name":"lh:audit:notification-on-start","duration":0.18841599999996106,"entryType":"measure"},{"startTime":6901.027874,"name":"lh:audit:password-inputs-can-be-pasted-into","duration":0.12903499999993073,"entryType":"measure"},{"startTime":6901.169173,"name":"lh:audit:uses-http2","duration":0.460454000000027,"entryType":"measure"},{"startTime":6901.651169,"name":"lh:audit:uses-passive-event-listeners","duration":0.22660700000051293,"entryType":"measure"},{"startTime":6902.053976,"name":"lh:audit:meta-description","duration":0.2510339999998905,"entryType":"measure"},{"startTime":6902.412755,"name":"lh:audit:http-status-code","duration":0.24496699999963312,"entryType":"measure"},{"startTime":6902.753827,"name":"lh:audit:font-size","duration":0.4654400000008536,"entryType":"measure"},{"startTime":6903.312566,"name":"lh:audit:link-text","duration":1.8251640000007683,"entryType":"measure"},{"startTime":6905.327526,"name":"lh:audit:is-crawlable","duration":1.3936009999997623,"entryType":"measure"},{"startTime":6906.84945,"name":"lh:audit:robots-txt","duration":0.5893599999999424,"entryType":"measure"},{"startTime":6907.56302,"name":"lh:audit:tap-targets","duration":2.4444170000006125,"entryType":"measure"},{"startTime":6910.145333,"name":"lh:audit:hreflang","duration":0.3966449999998076,"entryType":"measure"},{"startTime":6910.64306,"name":"lh:audit:plugins","duration":0.24936299999990297,"entryType":"measure"},{"startTime":6910.990859,"name":"lh:audit:canonical","duration":0.612318000000414,"entryType":"measure"},{"startTime":6911.714148,"name":"lh:audit:structured-data","duration":0.11677200000031007,"entryType":"measure"},{"startTime":6911.847071,"name":"lh:runner:generate","duration":0.7002700000002733,"entryType":"measure"}],"total":5693.490078},"i18n":{"rendererFormattedStrings":{"auditGroupExpandTooltip":"Show audits","crcInitialNavigation":"Initial Navigation","crcLongestDurationLabel":"Maximum critical path latency:","errorLabel":"Error!","errorMissingAuditInfo":"Report error: no audit information","labDataTitle":"Lab Data","lsPerformanceCategoryDescription":"[Lighthouse](https://developers.google.com/web/tools/lighthouse/) analysis of the current page on an emulated mobile network. Values are estimated and may vary.","manualAuditsGroupTitle":"Additional items to manually check","notApplicableAuditsGroupTitle":"Not applicable","opportunityResourceColumnLabel":"Opportunity","opportunitySavingsColumnLabel":"Estimated Savings","passedAuditsGroupTitle":"Passed audits","scorescaleLabel":"Score scale:","snippetCollapseButtonLabel":"Collapse snippet","snippetExpandButtonLabel":"Expand snippet","toplevelWarningsMessage":"There were issues affecting this run of Lighthouse:","varianceDisclaimer":"Values are estimated and may vary.","warningAuditsGroupTitle":"Passed audits but with warnings","warningHeader":"Warnings: "},"icuMessagePaths":{"lighthouse-core/audits/metrics/first-contentful-paint.js | title":["audits[first-contentful-paint].title"],"lighthouse-core/audits/metrics/first-contentful-paint.js | description":["audits[first-contentful-paint].description"],"lighthouse-core/lib/i18n/i18n.js | seconds":[{"values":{"timeInMs":1699.7000000000003},"path":"audits[first-contentful-paint].displayValue"},{"values":{"timeInMs":1699.7000000000003},"path":"audits[first-meaningful-paint].displayValue"},{"values":{"timeInMs":1699.7000000000003},"path":"audits[speed-index].displayValue"},{"values":{"timeInMs":1699.7000000000003},"path":"audits[first-cpu-idle].displayValue"},{"values":{"timeInMs":1943.3435000000004},"path":"audits.interactive.displayValue"},{"values":{"timeInMs":1505.7600000000002},"path":"audits[mainthread-work-breakdown].displayValue"},{"values":{"timeInMs":67.15199999999999},"path":"audits[bootup-time].displayValue"}],"lighthouse-core/audits/metrics/first-meaningful-paint.js | title":["audits[first-meaningful-paint].title"],"lighthouse-core/audits/metrics/first-meaningful-paint.js | description":["audits[first-meaningful-paint].description"],"lighthouse-core/audits/load-fast-enough-for-pwa.js | title":["audits[load-fast-enough-for-pwa].title"],"lighthouse-core/audits/load-fast-enough-for-pwa.js | description":["audits[load-fast-enough-for-pwa].description"],"lighthouse-core/audits/metrics/speed-index.js | title":["audits[speed-index].title"],"lighthouse-core/audits/metrics/speed-index.js | description":["audits[speed-index].description"],"lighthouse-core/audits/metrics/estimated-input-latency.js | title":["audits[estimated-input-latency].title"],"lighthouse-core/audits/metrics/estimated-input-latency.js | description":["audits[estimated-input-latency].description"],"lighthouse-core/lib/i18n/i18n.js | ms":[{"values":{"timeInMs":12.8},"path":"audits[estimated-input-latency].displayValue"},{"values":{"timeInMs":54},"path":"audits[max-potential-fid].displayValue"},{"values":{"timeInMs":31.111000000000004},"path":"audits[network-rtt].displayValue"},{"values":{"timeInMs":48.35900000000001},"path":"audits[network-server-latency].displayValue"}],"lighthouse-core/audits/metrics/max-potential-fid.js | title":["audits[max-potential-fid].title"],"lighthouse-core/audits/metrics/max-potential-fid.js | description":["audits[max-potential-fid].description"],"lighthouse-core/audits/time-to-first-byte.js | title":["audits[time-to-first-byte].title"],"lighthouse-core/audits/time-to-first-byte.js | description":["audits[time-to-first-byte].description"],"lighthouse-core/audits/time-to-first-byte.js | displayValue":[{"values":{"timeInMs":106.27999999999999},"path":"audits[time-to-first-byte].displayValue"}],"lighthouse-core/audits/metrics/first-cpu-idle.js | title":["audits[first-cpu-idle].title"],"lighthouse-core/audits/metrics/first-cpu-idle.js | description":["audits[first-cpu-idle].description"],"lighthouse-core/audits/metrics/interactive.js | title":["audits.interactive.title"],"lighthouse-core/audits/metrics/interactive.js | description":["audits.interactive.description"],"lighthouse-core/audits/user-timings.js | title":["audits[user-timings].title"],"lighthouse-core/audits/user-timings.js | description":["audits[user-timings].description"],"lighthouse-core/audits/user-timings.js | displayValue":[{"values":{"itemCount":4},"path":"audits[user-timings].displayValue"}],"lighthouse-core/audits/user-timings.js | columnName":["audits[user-timings].details.headings[0].text"],"lighthouse-core/audits/user-timings.js | columnType":["audits[user-timings].details.headings[1].text"],"lighthouse-core/audits/user-timings.js | columnStartTime":["audits[user-timings].details.headings[2].text"],"lighthouse-core/audits/user-timings.js | columnDuration":["audits[user-timings].details.headings[3].text"],"lighthouse-core/audits/critical-request-chains.js | title":["audits[critical-request-chains].title"],"lighthouse-core/audits/critical-request-chains.js | description":["audits[critical-request-chains].description"],"lighthouse-core/audits/critical-request-chains.js | displayValue":[{"values":{"itemCount":7},"path":"audits[critical-request-chains].displayValue"}],"lighthouse-core/audits/redirects.js | title":["audits.redirects.title"],"lighthouse-core/audits/redirects.js | description":["audits.redirects.description"],"lighthouse-core/audits/mainthread-work-breakdown.js | title":["audits[mainthread-work-breakdown].title"],"lighthouse-core/audits/mainthread-work-breakdown.js | description":["audits[mainthread-work-breakdown].description"],"lighthouse-core/audits/mainthread-work-breakdown.js | columnCategory":["audits[mainthread-work-breakdown].details.headings[0].text"],"lighthouse-core/lib/i18n/i18n.js | columnTimeSpent":["audits[mainthread-work-breakdown].details.headings[1].text","audits[network-rtt].details.headings[1].text","audits[network-server-latency].details.headings[1].text"],"lighthouse-core/audits/bootup-time.js | title":["audits[bootup-time].title"],"lighthouse-core/audits/bootup-time.js | description":["audits[bootup-time].description"],"lighthouse-core/lib/i18n/i18n.js | columnURL":["audits[bootup-time].details.headings[0].text","audits[uses-rel-preconnect].details.headings[0].label","audits[font-display].details.headings[0].text","audits[network-rtt].details.headings[0].text","audits[network-server-latency].details.headings[0].text","audits[uses-long-cache-ttl].details.headings[0].text","audits[total-byte-weight].details.headings[0].text","audits[offscreen-images].details.headings[1].label","audits[render-blocking-resources].details.headings[0].label","audits[unused-css-rules].details.headings[0].label","audits[uses-webp-images].details.headings[1].label","audits[uses-optimized-images].details.headings[1].label"],"lighthouse-core/audits/bootup-time.js | columnTotal":["audits[bootup-time].details.headings[1].text"],"lighthouse-core/audits/bootup-time.js | columnScriptEval":["audits[bootup-time].details.headings[2].text"],"lighthouse-core/audits/bootup-time.js | columnScriptParse":["audits[bootup-time].details.headings[3].text"],"lighthouse-core/audits/uses-rel-preload.js | title":["audits[uses-rel-preload].title"],"lighthouse-core/audits/uses-rel-preload.js | description":["audits[uses-rel-preload].description"],"lighthouse-core/audits/uses-rel-preconnect.js | title":["audits[uses-rel-preconnect].title"],"lighthouse-core/audits/uses-rel-preconnect.js | description":["audits[uses-rel-preconnect].description"],"lighthouse-core/lib/i18n/i18n.js | displayValueMsSavings":[{"values":{"wastedMs":245.02100000035762},"path":"audits[uses-rel-preconnect].displayValue"},{"values":{"wastedMs":781},"path":"audits[render-blocking-resources].displayValue"}],"lighthouse-core/lib/i18n/i18n.js | columnWastedMs":["audits[uses-rel-preconnect].details.headings[1].label","audits[font-display].details.headings[1].text","audits[render-blocking-resources].details.headings[2].label"],"lighthouse-core/audits/font-display.js | failureTitle":["audits[font-display].title"],"lighthouse-core/audits/font-display.js | description":["audits[font-display].description"],"lighthouse-core/audits/network-rtt.js | title":["audits[network-rtt].title"],"lighthouse-core/audits/network-rtt.js | description":["audits[network-rtt].description"],"lighthouse-core/audits/network-server-latency.js | title":["audits[network-server-latency].title"],"lighthouse-core/audits/network-server-latency.js | description":["audits[network-server-latency].description"],"lighthouse-core/audits/accessibility/accesskeys.js | title":["audits.accesskeys.title"],"lighthouse-core/audits/accessibility/accesskeys.js | description":["audits.accesskeys.description"],"lighthouse-core/audits/accessibility/aria-allowed-attr.js | title":["audits[aria-allowed-attr].title"],"lighthouse-core/audits/accessibility/aria-allowed-attr.js | description":["audits[aria-allowed-attr].description"],"lighthouse-core/audits/accessibility/aria-required-attr.js | title":["audits[aria-required-attr].title"],"lighthouse-core/audits/accessibility/aria-required-attr.js | description":["audits[aria-required-attr].description"],"lighthouse-core/audits/accessibility/aria-required-children.js | title":["audits[aria-required-children].title"],"lighthouse-core/audits/accessibility/aria-required-children.js | description":["audits[aria-required-children].description"],"lighthouse-core/audits/accessibility/aria-required-parent.js | title":["audits[aria-required-parent].title"],"lighthouse-core/audits/accessibility/aria-required-parent.js | description":["audits[aria-required-parent].description"],"lighthouse-core/audits/accessibility/aria-roles.js | title":["audits[aria-roles].title"],"lighthouse-core/audits/accessibility/aria-roles.js | description":["audits[aria-roles].description"],"lighthouse-core/audits/accessibility/aria-valid-attr-value.js | title":["audits[aria-valid-attr-value].title"],"lighthouse-core/audits/accessibility/aria-valid-attr-value.js | description":["audits[aria-valid-attr-value].description"],"lighthouse-core/audits/accessibility/aria-valid-attr.js | title":["audits[aria-valid-attr].title"],"lighthouse-core/audits/accessibility/aria-valid-attr.js | description":["audits[aria-valid-attr].description"],"lighthouse-core/audits/accessibility/audio-caption.js | title":["audits[audio-caption].title"],"lighthouse-core/audits/accessibility/audio-caption.js | description":["audits[audio-caption].description"],"lighthouse-core/audits/accessibility/button-name.js | title":["audits[button-name].title"],"lighthouse-core/audits/accessibility/button-name.js | description":["audits[button-name].description"],"lighthouse-core/audits/accessibility/bypass.js | title":["audits.bypass.title"],"lighthouse-core/audits/accessibility/bypass.js | description":["audits.bypass.description"],"lighthouse-core/audits/accessibility/color-contrast.js | failureTitle":["audits[color-contrast].title"],"lighthouse-core/audits/accessibility/color-contrast.js | description":["audits[color-contrast].description"],"lighthouse-core/audits/accessibility/axe-audit.js | failingElementsHeader":["audits[color-contrast].details.headings[0].text","audits[image-alt].details.headings[0].text","audits.label.details.headings[0].text","audits[link-name].details.headings[0].text","audits[meta-viewport].details.headings[0].text"],"lighthouse-core/audits/accessibility/definition-list.js | title":["audits[definition-list].title"],"lighthouse-core/audits/accessibility/definition-list.js | description":["audits[definition-list].description"],"lighthouse-core/audits/accessibility/dlitem.js | title":["audits.dlitem.title"],"lighthouse-core/audits/accessibility/dlitem.js | description":["audits.dlitem.description"],"lighthouse-core/audits/accessibility/document-title.js | title":["audits[document-title].title"],"lighthouse-core/audits/accessibility/document-title.js | description":["audits[document-title].description"],"lighthouse-core/audits/accessibility/duplicate-id.js | title":["audits[duplicate-id].title"],"lighthouse-core/audits/accessibility/duplicate-id.js | description":["audits[duplicate-id].description"],"lighthouse-core/audits/accessibility/frame-title.js | title":["audits[frame-title].title"],"lighthouse-core/audits/accessibility/frame-title.js | description":["audits[frame-title].description"],"lighthouse-core/audits/accessibility/html-has-lang.js | title":["audits[html-has-lang].title"],"lighthouse-core/audits/accessibility/html-has-lang.js | description":["audits[html-has-lang].description"],"lighthouse-core/audits/accessibility/html-lang-valid.js | title":["audits[html-lang-valid].title"],"lighthouse-core/audits/accessibility/html-lang-valid.js | description":["audits[html-lang-valid].description"],"lighthouse-core/audits/accessibility/image-alt.js | failureTitle":["audits[image-alt].title"],"lighthouse-core/audits/accessibility/image-alt.js | description":["audits[image-alt].description"],"lighthouse-core/audits/accessibility/input-image-alt.js | title":["audits[input-image-alt].title"],"lighthouse-core/audits/accessibility/input-image-alt.js | description":["audits[input-image-alt].description"],"lighthouse-core/audits/accessibility/label.js | failureTitle":["audits.label.title"],"lighthouse-core/audits/accessibility/label.js | description":["audits.label.description"],"lighthouse-core/audits/accessibility/layout-table.js | title":["audits[layout-table].title"],"lighthouse-core/audits/accessibility/layout-table.js | description":["audits[layout-table].description"],"lighthouse-core/audits/accessibility/link-name.js | failureTitle":["audits[link-name].title"],"lighthouse-core/audits/accessibility/link-name.js | description":["audits[link-name].description"],"lighthouse-core/audits/accessibility/list.js | title":["audits.list.title"],"lighthouse-core/audits/accessibility/list.js | description":["audits.list.description"],"lighthouse-core/audits/accessibility/listitem.js | title":["audits.listitem.title"],"lighthouse-core/audits/accessibility/listitem.js | description":["audits.listitem.description"],"lighthouse-core/audits/accessibility/meta-refresh.js | title":["audits[meta-refresh].title"],"lighthouse-core/audits/accessibility/meta-refresh.js | description":["audits[meta-refresh].description"],"lighthouse-core/audits/accessibility/meta-viewport.js | failureTitle":["audits[meta-viewport].title"],"lighthouse-core/audits/accessibility/meta-viewport.js | description":["audits[meta-viewport].description"],"lighthouse-core/audits/accessibility/object-alt.js | title":["audits[object-alt].title"],"lighthouse-core/audits/accessibility/object-alt.js | description":["audits[object-alt].description"],"lighthouse-core/audits/accessibility/tabindex.js | title":["audits.tabindex.title"],"lighthouse-core/audits/accessibility/tabindex.js | description":["audits.tabindex.description"],"lighthouse-core/audits/accessibility/td-headers-attr.js | title":["audits[td-headers-attr].title"],"lighthouse-core/audits/accessibility/td-headers-attr.js | description":["audits[td-headers-attr].description"],"lighthouse-core/audits/accessibility/th-has-data-cells.js | title":["audits[th-has-data-cells].title"],"lighthouse-core/audits/accessibility/th-has-data-cells.js | description":["audits[th-has-data-cells].description"],"lighthouse-core/audits/accessibility/valid-lang.js | title":["audits[valid-lang].title"],"lighthouse-core/audits/accessibility/valid-lang.js | description":["audits[valid-lang].description"],"lighthouse-core/audits/accessibility/video-caption.js | title":["audits[video-caption].title"],"lighthouse-core/audits/accessibility/video-caption.js | description":["audits[video-caption].description"],"lighthouse-core/audits/accessibility/video-description.js | title":["audits[video-description].title"],"lighthouse-core/audits/accessibility/video-description.js | description":["audits[video-description].description"],"lighthouse-core/audits/byte-efficiency/uses-long-cache-ttl.js | failureTitle":["audits[uses-long-cache-ttl].title"],"lighthouse-core/audits/byte-efficiency/uses-long-cache-ttl.js | description":["audits[uses-long-cache-ttl].description"],"lighthouse-core/audits/byte-efficiency/uses-long-cache-ttl.js | displayValue":[{"values":{"itemCount":12},"path":"audits[uses-long-cache-ttl].displayValue"}],"lighthouse-core/lib/i18n/i18n.js | columnCacheTTL":["audits[uses-long-cache-ttl].details.headings[1].text"],"lighthouse-core/lib/i18n/i18n.js | columnSize":["audits[uses-long-cache-ttl].details.headings[2].text","audits[total-byte-weight].details.headings[1].text","audits[offscreen-images].details.headings[2].label","audits[render-blocking-resources].details.headings[1].label","audits[unused-css-rules].details.headings[1].label","audits[uses-webp-images].details.headings[2].label","audits[uses-optimized-images].details.headings[2].label"],"lighthouse-core/audits/byte-efficiency/total-byte-weight.js | title":["audits[total-byte-weight].title"],"lighthouse-core/audits/byte-efficiency/total-byte-weight.js | description":["audits[total-byte-weight].description"],"lighthouse-core/audits/byte-efficiency/total-byte-weight.js | displayValue":[{"values":{"totalBytes":331511},"path":"audits[total-byte-weight].displayValue"}],"lighthouse-core/audits/byte-efficiency/offscreen-images.js | title":["audits[offscreen-images].title"],"lighthouse-core/audits/byte-efficiency/offscreen-images.js | description":["audits[offscreen-images].description"],"lighthouse-core/lib/i18n/i18n.js | displayValueByteSavings":[{"values":{"wastedBytes":120414},"path":"audits[offscreen-images].displayValue"},{"values":{"wastedBytes":9826},"path":"audits[unused-css-rules].displayValue"},{"values":{"wastedBytes":120618},"path":"audits[uses-webp-images].displayValue"},{"values":{"wastedBytes":12774},"path":"audits[uses-optimized-images].displayValue"}],"lighthouse-core/lib/i18n/i18n.js | columnWastedBytes":["audits[offscreen-images].details.headings[3].label","audits[unused-css-rules].details.headings[2].label","audits[uses-webp-images].details.headings[3].label","audits[uses-optimized-images].details.headings[3].label"],"lighthouse-core/audits/byte-efficiency/render-blocking-resources.js | title":["audits[render-blocking-resources].title"],"lighthouse-core/audits/byte-efficiency/render-blocking-resources.js | description":["audits[render-blocking-resources].description"],"lighthouse-core/audits/byte-efficiency/unminified-css.js | title":["audits[unminified-css].title"],"lighthouse-core/audits/byte-efficiency/unminified-css.js | description":["audits[unminified-css].description"],"lighthouse-core/audits/byte-efficiency/unminified-javascript.js | title":["audits[unminified-javascript].title"],"lighthouse-core/audits/byte-efficiency/unminified-javascript.js | description":["audits[unminified-javascript].description"],"lighthouse-core/audits/byte-efficiency/unused-css-rules.js | title":["audits[unused-css-rules].title"],"lighthouse-core/audits/byte-efficiency/unused-css-rules.js | description":["audits[unused-css-rules].description"],"lighthouse-core/audits/byte-efficiency/uses-webp-images.js | title":["audits[uses-webp-images].title"],"lighthouse-core/audits/byte-efficiency/uses-webp-images.js | description":["audits[uses-webp-images].description"],"lighthouse-core/audits/byte-efficiency/uses-optimized-images.js | title":["audits[uses-optimized-images].title"],"lighthouse-core/audits/byte-efficiency/uses-optimized-images.js | description":["audits[uses-optimized-images].description"],"lighthouse-core/audits/byte-efficiency/uses-text-compression.js | title":["audits[uses-text-compression].title"],"lighthouse-core/audits/byte-efficiency/uses-text-compression.js | description":["audits[uses-text-compression].description"],"lighthouse-core/audits/byte-efficiency/uses-responsive-images.js | title":["audits[uses-responsive-images].title"],"lighthouse-core/audits/byte-efficiency/uses-responsive-images.js | description":["audits[uses-responsive-images].description"],"lighthouse-core/audits/byte-efficiency/efficient-animated-content.js | title":["audits[efficient-animated-content].title"],"lighthouse-core/audits/byte-efficiency/efficient-animated-content.js | description":["audits[efficient-animated-content].description"],"lighthouse-core/audits/dobetterweb/dom-size.js | title":["audits[dom-size].title"],"lighthouse-core/audits/dobetterweb/dom-size.js | description":["audits[dom-size].description"],"lighthouse-core/audits/dobetterweb/dom-size.js | displayValue":[{"values":{"itemCount":446},"path":"audits[dom-size].displayValue"}],"lighthouse-core/audits/dobetterweb/dom-size.js | columnStatistic":["audits[dom-size].details.headings[0].text"],"lighthouse-core/audits/dobetterweb/dom-size.js | columnElement":["audits[dom-size].details.headings[1].text"],"lighthouse-core/audits/dobetterweb/dom-size.js | columnValue":["audits[dom-size].details.headings[2].text"],"lighthouse-core/audits/dobetterweb/dom-size.js | statisticDOMNodes":["audits[dom-size].details.items[0].statistic"],"lighthouse-core/audits/dobetterweb/dom-size.js | statisticDOMDepth":["audits[dom-size].details.items[1].statistic"],"lighthouse-core/audits/dobetterweb/dom-size.js | statisticDOMWidth":["audits[dom-size].details.items[2].statistic"],"lighthouse-core/audits/seo/meta-description.js | failureTitle":["audits[meta-description].title"],"lighthouse-core/audits/seo/meta-description.js | description":["audits[meta-description].description"],"lighthouse-core/audits/seo/http-status-code.js | title":["audits[http-status-code].title"],"lighthouse-core/audits/seo/http-status-code.js | description":["audits[http-status-code].description"],"lighthouse-core/audits/seo/font-size.js | title":["audits[font-size].title"],"lighthouse-core/audits/seo/font-size.js | description":["audits[font-size].description"],"lighthouse-core/audits/seo/font-size.js | displayValue":[{"values":{"decimalProportion":1},"path":"audits[font-size].displayValue"}],"lighthouse-core/audits/seo/link-text.js | title":["audits[link-text].title"],"lighthouse-core/audits/seo/link-text.js | description":["audits[link-text].description"],"lighthouse-core/audits/seo/is-crawlable.js | title":["audits[is-crawlable].title"],"lighthouse-core/audits/seo/is-crawlable.js | description":["audits[is-crawlable].description"],"lighthouse-core/audits/seo/robots-txt.js | title":["audits[robots-txt].title"],"lighthouse-core/audits/seo/robots-txt.js | description":["audits[robots-txt].description"],"lighthouse-core/audits/seo/tap-targets.js | failureTitle":["audits[tap-targets].title"],"lighthouse-core/audits/seo/tap-targets.js | description":["audits[tap-targets].description"],"lighthouse-core/audits/seo/tap-targets.js | displayValue":[{"values":{"decimalProportion":0.72},"path":"audits[tap-targets].displayValue"}],"lighthouse-core/audits/seo/tap-targets.js | tapTargetHeader":["audits[tap-targets].details.headings[0].text"],"lighthouse-core/audits/seo/tap-targets.js | sizeHeader":["audits[tap-targets].details.headings[1].text"],"lighthouse-core/audits/seo/tap-targets.js | overlappingTargetHeader":["audits[tap-targets].details.headings[2].text"],"lighthouse-core/audits/seo/hreflang.js | title":["audits.hreflang.title"],"lighthouse-core/audits/seo/hreflang.js | description":["audits.hreflang.description"],"lighthouse-core/audits/seo/plugins.js | title":["audits.plugins.title"],"lighthouse-core/audits/seo/plugins.js | description":["audits.plugins.description"],"lighthouse-core/audits/seo/canonical.js | title":["audits.canonical.title"],"lighthouse-core/audits/seo/canonical.js | description":["audits.canonical.description"],"lighthouse-core/audits/seo/manual/structured-data.js | title":["audits[structured-data].title"],"lighthouse-core/audits/seo/manual/structured-data.js | description":["audits[structured-data].description"],"lighthouse-core/config/default-config.js | performanceCategoryTitle":["categories.performance.title"],"lighthouse-core/config/default-config.js | a11yCategoryTitle":["categories.accessibility.title"],"lighthouse-core/config/default-config.js | a11yCategoryDescription":["categories.accessibility.description"],"lighthouse-core/config/default-config.js | a11yCategoryManualDescription":["categories.accessibility.manualDescription"],"lighthouse-core/config/default-config.js | seoCategoryTitle":["categories.seo.title"],"lighthouse-core/config/default-config.js | seoCategoryDescription":["categories.seo.description"],"lighthouse-core/config/default-config.js | seoCategoryManualDescription":["categories.seo.manualDescription"],"lighthouse-core/config/default-config.js | metricGroupTitle":["categoryGroups.metrics.title"],"lighthouse-core/config/default-config.js | loadOpportunitiesGroupTitle":["categoryGroups[load-opportunities].title"],"lighthouse-core/config/default-config.js | loadOpportunitiesGroupDescription":["categoryGroups[load-opportunities].description"],"lighthouse-core/config/default-config.js | diagnosticsGroupTitle":["categoryGroups.diagnostics.title"],"lighthouse-core/config/default-config.js | diagnosticsGroupDescription":["categoryGroups.diagnostics.description"],"lighthouse-core/config/default-config.js | pwaFastReliableGroupTitle":["categoryGroups[pwa-fast-reliable].title"],"lighthouse-core/config/default-config.js | pwaInstallableGroupTitle":["categoryGroups[pwa-installable].title"],"lighthouse-core/config/default-config.js | pwaOptimizedGroupTitle":["categoryGroups[pwa-optimized].title"],"lighthouse-core/config/default-config.js | a11yBestPracticesGroupTitle":["categoryGroups[a11y-best-practices].title"],"lighthouse-core/config/default-config.js | a11yBestPracticesGroupDescription":["categoryGroups[a11y-best-practices].description"],"lighthouse-core/config/default-config.js | a11yColorContrastGroupTitle":["categoryGroups[a11y-color-contrast].title"],"lighthouse-core/config/default-config.js | a11yColorContrastGroupDescription":["categoryGroups[a11y-color-contrast].description"],"lighthouse-core/config/default-config.js | a11yNamesLabelsGroupTitle":["categoryGroups[a11y-names-labels].title"],"lighthouse-core/config/default-config.js | a11yNamesLabelsGroupDescription":["categoryGroups[a11y-names-labels].description"],"lighthouse-core/config/default-config.js | a11yNavigationGroupTitle":["categoryGroups[a11y-navigation].title"],"lighthouse-core/config/default-config.js | a11yNavigationGroupDescription":["categoryGroups[a11y-navigation].description"],"lighthouse-core/config/default-config.js | a11yAriaGroupTitle":["categoryGroups[a11y-aria].title"],"lighthouse-core/config/default-config.js | a11yAriaGroupDescription":["categoryGroups[a11y-aria].description"],"lighthouse-core/config/default-config.js | a11yLanguageGroupTitle":["categoryGroups[a11y-language].title"],"lighthouse-core/config/default-config.js | a11yLanguageGroupDescription":["categoryGroups[a11y-language].description"],"lighthouse-core/config/default-config.js | a11yAudioVideoGroupTitle":["categoryGroups[a11y-audio-video].title"],"lighthouse-core/config/default-config.js | a11yAudioVideoGroupDescription":["categoryGroups[a11y-audio-video].description"],"lighthouse-core/config/default-config.js | a11yTablesListsVideoGroupTitle":["categoryGroups[a11y-tables-lists].title"],"lighthouse-core/config/default-config.js | a11yTablesListsVideoGroupDescription":["categoryGroups[a11y-tables-lists].description"]}}};</script>
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
