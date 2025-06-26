# The sharedline Package

A LaTeX package for typesetting shared lines in dramatic verse.

## The Problem

Typesetting dramatic verse, such as in the plays of Shakespeare, presents a
unique challenge: a single metrical line is often shared between two or more
characters, and hence is spread over multiple lines, with subsequent lines indented to
create visual continuity, but (potentially) with character prompts
at the beginning of the subsequent lines.

This package provides two simple commands, `\shareline` and `\linefeed`, that
work together to solve this problem.


## Requirements

*   A modern LaTeX distribution (like TeX Live, MiKTeX, or MacTeX).
*   The `xparse` package (this is part of the standard LaTeX kernel and should require no extra installation).


## Usage

The package provides two commands, `\shareline` and `\linefeed`.

### Core Concept

1.  `sharedline` works in, but does not depend on, the `verse` environment.
2. You start a shared line with `\shareline{...}`.
3.  You use `\linefeed[...]{...}` for all subsequent parts of that same shared line.
4.  You are responsible for manually adding line breaks (`\\`) after each segment to move to the next physical line.

---

### Command Reference

#### `\shareline{full text}`

This command **starts** a shared line.

*   **Syntax:** It takes a single mandatory argument containing the *entire* first segment of the line, including any speaker prompt.
*   **Action:** It typesets the `<full text>` and saves its horizontal width as the baseline for the following segment.

#### `\linefeed[intro]{verse}`

This command **continues** a shared line.

*   **Syntax:** It takes an optional argument for introductory text (like a speaker prompt) and a mandatory argument for the verse text.
*   **Action:** It calculates the correct indentation based on the total width of all previous parts, typesets its own text, and then updates the total width for the next `\linefeed` command.

---

### Examples

#### Two-Way Split

```latex
\begin{verse}
  \shareline{ANNE: I would I knew thy heart.}\\
  \linefeed[GLOUCESTER: ]{'Tis figured in my tongue.}\\
\end{verse}
```

#### Three-Way Split

Note that `\linefeed` is used for both the second and third parts. A manual line break is required after each segment.

```latex
\begin{verse}
  \shareline{GUARD 1: Who goes there?}\\
  \linefeed[GUARD 2: ]{Speak now, or I swear}\\
  \linefeed[GUARD 1: ]{I'll shoot!}\\
\end{verse}
```

#### Without Speaker Prompts

The syntax remains clean when no prompts are needed. Simply omit the optional argument for `\linefeed`.

```latex
\begin{verse}
  \shareline{A path of dust and dreams beneath the sun,}\\
  \linefeed{a journey to a star.}\\
\end{verse}
```

#### Speaker Prompts on a Separate Line

Regular lines can come between a `\shareline` and its continuing `\linefeed`s.
Therefore one can do:

```latex
\begin{verse}
HORATIO:
  
\shareline{Tush, tush, 'twill not appear.}
  
BARNARDO:
  
\linefeed{Sit down awhile,}\\
And let us once again assail your ears,\\
That are so fortified against our story,\\
What we have two nights seen.
\end{verse}
```

## License

This work is distributed under the [LaTeX Project Public License (LPPL)](http://www.latex-project.org/lppl.txt), version 1.3c or later.

## Contributing & Issues

Found a bug or have a suggestion for improvement? Please open an issue on the GitHub repository.
