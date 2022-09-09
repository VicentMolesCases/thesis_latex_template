# thesis_latex_template
Template to generate the report for a BSc/MSc/PhD thesis using the implemented latex class `ThesisClass.cls`. 

### Main features

The `ThesisClass.cls` class supports options to build the whole document (`fullBuild`), but also to build each of the chapters independently (`partialBuild`). This feature is specially useful when working with a document with many chapters, since bulding just the chapter in which you are working are at the moment is very convinient. Moreover, the class supports two different types of documents:
* `bookType`: Type more suitable for printing. It uses a paper size 240x170 mm, different margins and headers for the even and odd pages, and the chapters always start in an odd page. We provide an example of this type of document in `example_book_type.pdf`.
* `reportType`: Type more suitable for generating a pdf. It uses A4 paper size and the same margins and headers for the even and odd pages. We provide an example of this type of document in `example_report_type.pdf`.



### Template structure
The provided latex template has the following structure:
* `ThesisClass/`: Folder containing the class file `ThesisClass.cls` and the bibliography style file `IEEEtranN_mod.bts`
* `0_front_matter/`: Folder containing the files included in the front matter of the document, i.e., the title page, the abstract, the acknowledgements, the list of contents, the list of acronyms, the notation, the list of figures, and the list of tables.
* `1_chap/`: Folder containing the files for the different chapters of the document.
* `2_app/`: Folder containing the files for the different appendices of the document.
* `3_biblio/`: Folder containing the files for the bibliography of the document.
* `thesis.tex`: Main file, which includes all the files for the front matter, the chapters, the appendices, and the bibliography. 

### Set thesis info
The class `ThesisClass.cls` provides a set of commands to set the information of the thesis. The following set of commands must be used in the preamble of `thesis.tex`:
* `SetThesisTitle{}`: Used to set the title of the thesis.
* `SetThesisAuthor{}`: Used to set the name of the author of the thesis.
* `SetThesisType{}`: Used to set the type of thesis, e.g., BSc thesis, MSc thesis, or PhD thesis.
* `SetThesisKeywords{}`: Used to set the keywords that appear in the abstract section of the thesis.
* `SetThesisSupervisor{}`: Used to set the name of the supervisor of the thesis.
* `SetThesisLocation{}`: Used to set the location in which the thesis has been carried out. 

### Adding new chapter/appendix
To add a new chapter/appendix to the report you must:
1. Add a folder `new_chapter/` in the `1_chap/` or `2_app/` folders.
2. Add to `new_chapter/` the file `new_chapter.tex`, which includes the code for the new chapter/appendix. The `.tex` file must have the following structure:
```
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%% PREAMBLE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifdefined \fullBuild
	\graphicspath{{1_chap/new_chapter/figures/}}
\else
	\documentclass[bookType,partialBuild]{../../ThesisClass/ThesisClass}
	\graphicspath{{figures/}}
	\begin{document}
\fi
\ifdefined \bookType
	\cleardoublepage
\fi
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% TEXT %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ADD CHAPTER TEXT HERE
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% CLOSING %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifdefined \partialBuild
	\bibliography{../../3_biblio/ref}
	\end{document}
\fi
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
```
The preamble and the closing sections allow to build the whole thesis report or to build each chapter independently, and must be always present. The rest of the text for the chapter must be included in the TEXT section.

3. Add to `new_chapter/` the `figures/` folder, which includes the pictures for the new chapter/appendix.
4. Add the code `\include{1_chap/new_chapter/new_chapter}` in the Chapter or Appendix sections of `thesis.tex`.


