# TOCBuilder

**Obsolete**: Use [HTML::Toc](https://metacpan.org/release/HTML-Toc) instead.

When I went to clean this up and turn it into a module to publish to CPAN, I found HTML::Toc, which is much better. This is preserved for historical interest (and to avoid the breaking of links).

## Usage

It should be noted that this document assumes a basic knowledge of executing Perl scripts, and authoring HTML.

Mark up your HTML document as normal. Ensure that your headings are arranged in a hierarchy (i.e. That you don't have an `<h3>` as the first heading with an `<h2>` later on in the document, and that if you have a subheading, you only go down one level at a time).

Any heading that you wish to be in the table of contents should be given an id attribute.

Run the script, giving the path to the HTML document as a parameter. It will output an HTML unordered list on STDOUT which you can copy/paste from your terminal or pipe to another program or file.

It may be useful to be warned if any headings are missing an id attribute (so users can ensure that every heading is included in the TOC). Warnings will be generated (on STDERR) if a heading is missing an id attribute. These can be suppressed by piping them away from the console.

### Examples

These examples were generated from the original version of document while it was being written (which explains any disparities between the examples and the version you are reading).

#### With warnings

    david@cyberman:metaFind]tocBuilder.pl ~/public_html/software/tocbuilder/index.html
    <ul>
    Warning: Heading "TOCBuilder" missing id
    <li><a href="#mast">Dorward Online</a>
    <ul>
    <li><a href="#requirements">Requirements</a></li>
    <li><a href="#download">Download</a></li>
    <li><a href="#usage">Usage</a>
    <ul>
    <li><a href="#example">Examples</a>
    <ul>
    <li><a href="#warnings">With warnings</a></li>
    <li><a href="#nowarnings">No warnings</a>
    </li></ul>
    </li></ul>
    </li></ul>
    </li></ul>

#### No warnings

    david@cyberman:metaFind]tocBuilder.pl ~/public_html/software/tocbuilder/index.html 2> /dev/null
    <ul>
    <li><a href="#mast">Dorward Online</a>
    <ul>
    <li><a href="#requirements">Requirements</a></li>
    <li><a href="#download">Download</a></li>
    <li><a href="#usage">Usage</a>
    <ul>
    <li><a href="#example">Examples</a>
    <ul>
    <li><a href="#warnings">With warnings</a></li>
    <li><a href="#nowarnings">No warnings</a>
    </li></ul>
    </li></ul>
    </li></ul>
    </li></ul>    