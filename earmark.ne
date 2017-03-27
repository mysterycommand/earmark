#
#
#

main -> document
document -> line:+ {%
    function (data) {
        return {
            type: 'document',
            lines: data[0],
        }
    }
%}

character -> .
whitespace -> " " | "\t"

line -> character:* line_ending {%
    function(data) {
        return {
			type: 'line',
			characters: data[0],
		};
    }
%}

blank_line -> whitespace:* line_ending {%
    function() {
        return {
			type: 'blank_line',
		};
    }
%}

line_ending -> "\n" | "\r" | "\r\n"