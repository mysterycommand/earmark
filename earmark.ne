#
#
#

main -> document
document -> (line:+ | blank_line:+):+ {% id %}

line -> character:+ line_ending {%
	function (data) {
		return {
			type: 'line',
			data: data[0]
		};
	}
%}

blank_line -> whitespace:* line_ending {%
	function () {
		return { type: 'blank_line' };
	}
%}

character -> .
whitespace -> [\s]
line_ending -> "\r\n"
    | "\r"
    | "\n"