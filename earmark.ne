#
#
#

main -> document
document -> line:+
line -> character:* line_ending {%
    function(data) {
        console.log(data);
        return {
            type: 'line',
            data
        };
    }
%}
