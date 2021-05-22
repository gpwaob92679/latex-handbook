"""
    pygments.styles.texstudio
    ~~~~~~~~~~~~~~~~~~~~~~~

    Texstudio style for TeX/LaTeX syntax highlighting, created by gpwaob92679.


"""

from pygments.style import Style
from pygments.token import Keyword, Name, Comment, String, Error, \
     Number, Operator, Generic, Whitespace


class TexstudioStyle(Style):
    """
    Texstudio style for TeX/LaTeX syntax highlighting, created by gpwaob92679.
    """

#    background_color = "#f8f8f8"
    default_style = ""

    styles = {
        Generic.Generic: "#000000",
        
        Whitespace:                "#bbbbbb",
        Comment:                   "#408080",
        Comment.Preproc:           "noitalic #BC7A00",

        Keyword.Ampersand: "#0055ff",
        Keyword.Command:            "#800000",
        Keyword.Env:               "bold #0095FF",
        Keyword.EnvName:           "bold #000080",
        Keyword.StructText:        "bold",
        Keyword.Math: "#808000",
        Keyword.Option:            "#7D9029",
        
        Number: "#008000",

        Error:                     "border:#FF0000"
    }
