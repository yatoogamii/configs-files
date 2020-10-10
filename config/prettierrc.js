module.exports = {
  // Specify the line length that the printer will wrap on.
  printWidth: 80,

  // Specify the number of spaces per indentation-level.
  tabWidth: 2,

  // Indent lines with tabs instead of spaces.
  useTabs: false,

  // Print semicolons at the ends of statements.
  semi: true,

  // Use single quotes instead of double quotes.
  singleQuote: false,

  // Change when properties in objects are quoted.
  // "as-needed" - Only add quotes around object properties where required.
  // "consistent" - If at least one property in an object requires quotes, quote all properties.
  // "preserve" - Respect the input use of quotes in object properties.
  quoteProps: "as-needed",

  // Use single quotes instead of double quotes in JSX.
  jsxSingleQuote: false,

  // Print trailing commas wherever possible when multi-line. (A single-line array, for example, never gets trailing commas.)
  // "none" - No trailing commas.
  // "es5" - Trailing commas where valid in ES5 (objects, arrays, etc.)
  // "all" - Trailing commas wherever possible (including function arguments). This requires node 8 or a transform.
  trailingComma: "none",

  // Print spaces between brackets in object literals.
  // true - Example: { foo: bar }.
  // false - Example: {foo: bar}.
  bracketSpacing: true,

  // Put the > of a multi-line JSX element at the end of the last line instead of being alone on the next line (does not apply to self closing elements).
  jsxBracketSameLine: true,

  // Include parentheses around a sole arrow function parameter.
  // "avoid" - Omit parens when possible. Example: x => x
  // "always" - Always include parens. Example: (x) => x
  arrowParens: "avoid",

  // Format only a segment of a file.
  // These two options can be used to format code starting and ending at a given character offset (inclusive and exclusive, respectively). The range will extend:
  //   Backwards to the start of the first line containing the selected statement.
  //   Forwards to the end of the selected statement
  rangeStart: 0,
  rangeEnd: Infinity,

  // Specify which parser to use.
  // "babel" (via @babel/parser) Named "babylon" until v1.16.0
  // "babel-flow" (Same as "babel" but enables Flow parsing explicitly to avoid ambiguity) First available in v1.16.0
  // "flow" (via flow-parser)
  // "typescript" (via @typescript-eslint/typescript-estree) First available in v1.4.0
  // "css" (via postcss-scss and postcss-less, autodetects which to use) First available in v1.7.1
  // "scss" (same parsers as "css", prefers postcss-scss) First available in v1.7.1
  // "less" (same parsers as "css", prefers postcss-less) First available in v1.7.1
  // "json" (via @babel/parser parseExpression) First available in v1.5.0
  // "json5" (same parser as "json", but outputs as json5) First available in v1.13.0
  // "json-stringify" (same parser as "json", but outputs like JSON.stringify) First available in v1.13.0
  // "graphql" (via graphql/language) First available in v1.5.0
  // "markdown" (via remark-parse) First available in v1.8.0
  // "mdx" (via remark-parse and @mdx-js/mdx) First available in v1.15.0
  // "html" (via angular-html-parser) First available in 1.15.0
  // "vue" (same parser as "html", but also formats vue-specific syntax) First available in 1.10.0
  // "angular" (same parser as "html", but also formats angular-specific syntax via angular-estree-parser) First available in 1.15.0
  // "lwc" (same parser as "html", but also formats LWC-specific syntax for unquoted template attributes) First available in 1.17.0
  // "yaml" (via yaml and yaml-unist-parser) First available in 1.14.0
  // parser: "babylon",

  // Specify the file name to use to infer which parser to use.
  // filepath: "",
  //
  // Prettier can restrict itself to only format files that contain a special comment, called a pragma, at the top of the file. This is very useful when gradually transitioning large, unformatted codebases to prettier.
  requirePragma: false,

  // Prettier can insert a special @format marker at the top of files specifying that the file has been formatted with prettier. This works well when used in tandem with the --require-pragma option. If there is already a docblock at the top of the file then this option will add a newline to it with the @format marker.
  insertPragma: false,

  // By default, Prettier will wrap markdown text as-is since some services use a linebreak-sensitive renderer, e.g. GitHub comment and BitBucket. In some cases you may want to rely on editor/viewer soft wrapping instead, so this option allows you to opt out with "never".
  // "always" - Wrap prose if it exceeds the print width.
  // "never" - Do not wrap prose.
  // "preserve" - Wrap prose as-is. First available in v1.9.0
  proseWrap: "preserve",

  // Specify the global whitespace sensitivity for HTML files, see whitespace-sensitive formatting for more info.
  // "css" - Respect the default value of CSS display property.
  // "strict" - Whitespaces are considered sensitive.
  // "ignore" - Whitespaces are considered insensitive.
  htmlWhitespaceSensitivity: "css",

  // Whether or not to indent the code inside <script> and <style> tags in Vue files. Some people (like the creator of Vue) don’t indent to save an indentation level, but this might break code folding in your editor.
  // "false" - Do not indent script and style tags in Vue files.
  // "true" - Indent script and style tags in Vue files.
  vueIndentScriptAndStyle: true,

  // For historical reasons, there exist two commonly used flavors of line endings in text files. That is \n (or LF for Line Feed) and \r\n (or CRLF for Carriage Return + Line Feed). The former is common on Linux and macOS, while the latter is prevalent on Windows.
  // "auto" - Maintain existing line endings (mixed values within one file are normalised by looking at what's used after the first line)
  // "lf" – Line Feed only (\n), common on Linux and macOS as well as inside git repos
  // "crlf" - Carriage Return + Line Feed characters (\r\n), common on Windows
  // "cr" - Carriage Return character only (\r), used very rarely
  endOfLine: "auto"
};
