'use strict';

(function ($) {
    var areaChartData = {
        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
        datasets: [
            {
                label: 'New Agents',
                backgroundColor: 'rgba(60,141,188,0.9)',
                borderColor: 'rgba(60,141,188,0.8)',
                pointRadius: false,
                pointColor: '#3b8bba',
                pointStrokeColor: 'rgba(60,141,188,1)',
                pointHighlightFill: '#fff',
                pointHighlightStroke: 'rgba(60,141,188,1)',
                data: [28, 48, 40, 66, 86, 100, 50]
            },
            {
                label: 'Pair Complited',
                backgroundColor: 'rgba(210, 214, 222, 1)',
                borderColor: 'rgba(210, 214, 222, 1)',
                pointRadius: false,
                pointColor: 'rgba(210, 214, 222, 1)',
                pointStrokeColor: '#c1c7d1',
                pointHighlightFill: '#fff',
                pointHighlightStroke: 'rgba(220,220,220,1)',
                data: [4, 10, 6, 9, 12, 10, 10]
            },
        ]
    };
    if ($('#donutChart').length > 0) {
        var donutChartCanvas = $('#donutChart').get(0).getContext('2d');
        var donutData = {
            labels: [
                'LVL 1',
                'LVL 2',
                'LVL 3',
                'LVL 4',
                'LVL 5',
                'LVL 6',
            ],
            datasets: [
                {
                    data: [700, 500, 400, 600, 300, 100],
                    backgroundColor: ['#f56954', '#00a65a', '#f39c12', '#00c0ef', '#3c8dbc', '#d2d6de'],
                }
            ]
        }
        var donutOptions = {
            maintainAspectRatio: false,
            responsive: true,
        }
        //Create pie or douhnut chart
        // You can switch between pie and douhnut using the method below.

        new Chart(donutChartCanvas, {
            type: 'doughnut',
            data: donutData,
            options: donutOptions
        });
    }
    //-------------
    //- BAR CHART -
    //-------------
    if ($('#barChart').length > 0) {
        var barChartCanvas = $('#barChart').get(0).getContext('2d');
        var barChartData = $.extend(true, {}, areaChartData);
        var temp0 = areaChartData.datasets[0];
        var temp1 = areaChartData.datasets[1];
        barChartData.datasets[0] = temp1;
        barChartData.datasets[1] = temp0;

        var barChartOptions = {
            responsive: true,
            maintainAspectRatio: false,
            datasetFill: false
        };

        new Chart(barChartCanvas, {
            type: 'bar',
            data: barChartData,
            options: barChartOptions
        });
    }
    if ($('#example1').length) {
        $("#example1").DataTable({
            "responsive": true, "lengthChange": false, "autoWidth": false,
            //"buttons": ["excel", "pdf", "print"]
        });
    }
    if ($('.select2bs4').length > 0) {
        $('.select2bs4').select2({
            theme: 'bootstrap4'
        });
    }
    if ($('#form-add-new-agent').length > 0) {
        $('#created_at').datetimepicker({
            format: 'YYYY-MM-DD'
        });
        var message = $('#form-message');
        message.html('').fadeOut();
        $('#form-add-new-agent').on('submit', function (e) {
            e.preventDefault();
            var button = $('#form-add-new-agent input[type="submit"]');
            button.addClass('disabled');
            var formData = $(this).serialize();
            var agentName = $('#agent-name').val();
            var ref = $('#agent-referral').val();
            if (ref === '0') {
                $('#frontline-wrap').fadeIn('slow');
                
                if ($('#ref-frontline').is(":visible") && $('#ref-frontline').is(":checked")) {
                   message.fadeOut('slow').html('');
                    $.ajax({
                        type: "POST",
                        data: formData,
                        url: financeFoliage.ajaxurl,
                        success: function (data)
                        {
                            //alert(data);
                            console.log('success', data);
                        }
                    });
                } else {
                    message.addClass('callout-danger');
                    message.text('Please select Referral ID or Plase check Front Line agent');
                    message.fadeIn('slow');
                }
            }
            button.removeClass('disabled');
            return false;
        });
    }

})(jQuery);
