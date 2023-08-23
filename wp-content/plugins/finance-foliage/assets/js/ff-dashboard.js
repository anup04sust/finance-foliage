'use strict';
(function ($) {

    if ($('#donutChart').length > 0) {
        var donutChartCanvas = $('#donutChart').get(0).getContext('2d');
        var _donutData = {
            labels: donutData.labels,
            datasets: [
                {
                    data: donutData.datasets.data,
                    backgroundColor: donutData.datasets.backgroundColor,
                }
            ]
        };
        var donutOptions = {
            maintainAspectRatio: false,
            responsive: true,
        };
        //Create pie or douhnut chart
        // You can switch between pie and douhnut using the method below.
        $(document).ready(function () {
            new Chart(donutChartCanvas, {
                type: 'pie',
                data: _donutData,
                options: donutOptions
            });
        });

    }
    //-------------
    //- BAR CHART -
    //-------------
    if ($('#barChart').length > 0) {
        console.log(weekDayRegeistered);
        var areaChartData = {
            labels: ['Thursdays', 'Fridays', 'Saturdays', 'Sundays', 'Mondays', 'Tuesdays', 'Wednesdays'],
            datasets: [
                {
                    label: 'Current week',
                    backgroundColor: 'rgba(60,141,188,0.9)',
                    borderColor: 'rgba(60,141,188,0.8)',
                    pointRadius: false,
                    pointColor: '#3b8bba',
                    pointStrokeColor: 'rgba(60,141,188,1)',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(60,141,188,1)',
                    data: weekDayRegeistered.current_week
                },
                {
                    label: 'Previous week',
                    backgroundColor: 'rgba(210, 214, 222, 1)',
                    borderColor: 'rgba(210, 214, 222, 1)',
                    pointRadius: false,
                    pointColor: 'rgba(210, 214, 222, 1)',
                    pointStrokeColor: '#c1c7d1',
                    pointHighlightFill: '#fff',
                    pointHighlightStroke: 'rgba(220,220,220,1)',
                    data: weekDayRegeistered.prev_week
                },
            ]
        };
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
    //Add new agent
    if ($('#form-add-new-agent').length > 0) {
        function resetForm() {
            $('#agent-referral').append('<option value="' + $('#agent-sl').val().trim() + '">' + $('#agent-name').val() + '(' + $('#agent-sl').val().trim() + ')</option>');
            $('#agent-referral').val(0);
            $('#agent-name').val('');
            $('#agent-sl').val('');
            $('#form-add-new-agent-submit').removeClass('disabled');
            $('#agent-referral').select2({
                theme: 'bootstrap4'
            });
            $('#frontline-wrap').fadeOut();
        }

        $('#created-at-datetimepicker').datetimepicker({
            format: 'YYYY-MM-DD'
        });
        var message = $('#form-message');
        message.html('').fadeOut();
        $('#form-add-new-agent').on('submit', function (e) {
            e.preventDefault();
            message.text('').fadeOut();
            var button = $('#form-add-new-agent-submit');
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
                            message.removeClass('callout-danger').addClass('callout-success');
                            message.text(agentName + ' added in system.');
                            message.fadeIn('slow');
                            resetForm();
                        }
                    });
                } else {
                    message.addClass('callout-danger');
                    message.text('Please select Referral ID or Plase check Front Line agent');
                    message.fadeIn('slow');
                    button.removeClass('disabled');
                }
            } else {
                $.ajax({
                    type: "POST",
                    data: formData,
                    url: financeFoliage.ajaxurl,
                    success: function (data)
                    {
                        //alert(data);
                        message.removeClass('callout-danger').addClass('callout-success');
                        message.text(agentName + ' added in system');
                        message.fadeIn('slow');

                        resetForm();
                    }
                });
            }

            return false;
        });
        $('#agent-referral').on('change', function () {
            var ref = $(this).val();
            if (ref !== '0') {
                $.ajax({
                    type: "POST",
                    data: {'referral_id': ref, 'action': 'verify_referral'},
                    url: financeFoliage.ajaxurl,
                    success: function (response)
                    {
                        var returnedData = JSON.parse(response);

                        if (returnedData.status === 200) {
                            console.log('returnedData.status', returnedData.status);
                            if (returnedData.left_node === true) {
                                console.log('returnedData.left_node', returnedData.left_node);
                                $('#ref-wings-left').prop('disabled', true);
                                $('#ref-wings-right').prop('checked', true);
                            } else if (returnedData.right_node === true) {
                                console.log('returnedData.right_node', returnedData.right_node);
                                $('#ref-wings-right').prop('disabled', true);
                                $('#ref-wings-left').prop('checked', true);
                            } else {
                                console.log('returnedData', returnedData);
                                $('#ref-wings-left').prop('checked', true);
                                $('#ref-wings-right').prop('checked', false);
                                $('#ref-wings-left').prop('disabled', false);
                                $('#ref-wings-right').prop('disabled', false);
                            }
                        }

                    }
                });
            } else {
                $('#ref-wings-left').prop('checked', true);
                $('#ref-wings-right').prop('checked', false);
                $('#ref-wings-left').prop('disabled', false);
                $('#ref-wings-right').prop('disabled', false);
            }
        });
    }

    //Edit agent
    if ($('#form-edit-agent').length > 0) {

        $('#created-at-datetimepicker').datetimepicker({
            format: 'YYYY-MM-DD'
        });
        var message = $('#form-message');
        message.html('').fadeOut();
        $('#form-edit-agent').on('submit', function (e) {
            e.preventDefault();
            message.text('').fadeOut();
            var button = $('#form-edit-agent-submit');
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
                            message.removeClass('callout-danger').addClass('callout-success');
                            message.text(agentName + ' updated in system.');
                            message.fadeIn('slow');
                            //resetForm();
                        }
                    });
                } else {
                    message.addClass('callout-danger');
                    message.text('Please select Referral ID or Plase check Front Line agent.');
                    message.fadeIn('slow');
                    button.removeClass('disabled');
                }
            } else {
                $.ajax({
                    type: "POST",
                    data: formData,
                    url: financeFoliage.ajaxurl,
                    success: function (data)
                    {
                        //alert(data);
                        message.removeClass('callout-danger').addClass('callout-success');
                        message.text(agentName + ' updated in systemmm');
                        message.fadeIn('slow');

                        //resetForm();
                    }
                });
            }

            return false;
        });
        $('#agent-referral').on('change', function () {
            var ref = $(this).val();
            if (ref !== '0') {
                $.ajax({
                    type: "POST",
                    data: {'referral_id': ref, 'action': 'verify_referral'},
                    url: financeFoliage.ajaxurl,
                    success: function (response)
                    {
                        var returnedData = JSON.parse(response);

                        if (returnedData.status === 200) {
                            console.log('returnedData.status', returnedData.status);
                            if (returnedData.left_node === true) {
                                console.log('returnedData.left_node', returnedData.left_node);
                                $('#ref-wings-left').prop('disabled', true);
                                $('#ref-wings-right').prop('checked', true);
                            } else if (returnedData.right_node === true) {
                                console.log('returnedData.right_node', returnedData.right_node);
                                $('#ref-wings-right').prop('disabled', true);
                                $('#ref-wings-left').prop('checked', true);
                            } else {
                                console.log('returnedData', returnedData);
                                $('#ref-wings-left').prop('checked', true);
                                $('#ref-wings-right').prop('checked', false);
                                $('#ref-wings-left').prop('disabled', false);
                                $('#ref-wings-right').prop('disabled', false);
                            }
                        }

                    }
                });
            } else {
                $('#ref-wings-left').prop('checked', true);
                $('#ref-wings-right').prop('checked', false);
                $('#ref-wings-left').prop('disabled', false);
                $('#ref-wings-right').prop('disabled', false);
            }
        });
    }

    if ($('.ff-tree-wrap').length > 0) {
        $('.ff-tree-wrap a.node-link').on('click', function (e) {
            e.preventDefault();
            var nodeJson = $(this).attr('data-all');
            var nodeData = JSON.parse(atob(nodeJson));
            console.dir(nodeData);
            $('#modal-node-details .n-name').text(nodeData.node);
            $('#modal-node-details .n-aid').text(nodeData.node_aid);
            $('#modal-node-details .ln-count').text(nodeData.left_node_count);
            $('#modal-node-details .rn-count').text(nodeData.right_node_count);
            $('#modal-node-details .date-registered').text(nodeData.created_str);
            $('#modal-node-details .level-number').text(nodeData.level.level);
            $('#modal-node-details').modal('show');
            return false;
        });
    }

    //save settings
    $('.finance-foilage-save').on('click', function (e) {
        e.preventDefault();

        var formData = $('#finance_foliage_settings_fields').serialize();

        var data = {
            'action': 'finance_foliage_settings_fields_save',
            'formData': formData      // We pass php values differently!
        };
        // We can also pass the url value separately from ajaxurl for front end AJAX implementations
        $.post(financeFoliage.ajaxurl, data, function (response) {
            if (response.success) {
                console.log('Data inserted successfully.');
                location.reload();
            } else {
                console.log('Error:', response.data.message);
            }
        });

        return false;

    });
    if ($('#form-import-new-agent').length > 0) {
        bsCustomFileInput.init();
        var myForm = $('#form-import-new-agent');
        $('#form-import-new-agent').on('submit', function (e) {
            e.preventDefault();
            var formData = new FormData(myForm[0]);
            //var formData =$(this).serialize();
            //console.log(formData);
            $.ajax({
                type: "POST",
                data: formData,
                dataType: "JSON",
                cache: false,
                processData: false,
                contentType: false,
                enctype: 'multipart/form-data',
                url: financeFoliage.ajaxurl,
                success: function (data)
                {
                    console.log('data', data);
                    console.log('data.status', data.status);
                    if (data.status === 200) {
                        $('#csv-import-wrap .col-form-label').html('Total agent found: ' + data.row_count);
                        $('#csv-import-wrap').fadeIn('slow');
                    }
                }
            });
            return false;
        });
        $('#csv-import-btn').on('click', function () {
            var myForm = $('#form-import-new-agent');
            //$('#form-import-new-agent .btn').prop('disabled', true);
            $('#csv-import-wrap .load-spin .spin-img').removeClass('d-none');
            var formData = new FormData(myForm[0]);
            formData.append('import-btn', true);
            $.ajax({
                type: "POST",
                data: formData,
                dataType: "JSON",
                cache: false,
                processData: false,
                contentType: false,
                enctype: 'multipart/form-data',
                url: financeFoliage.ajaxurl,
                success: function (data)
                {
                    console.log('data', data);
                    console.log('data.status', data.status);
                    if (data.status === 200) {
                        $('#csv-import-wrap .col-form-label').html('Total agent found: ' + data.row_count);
                        $('#csv-import-wrap').fadeIn('slow');
                        $('#csv-import-wrap .load-spin .spin-img').addClass('d-none');
                    }
                }
            });
            return false;
        });
    }
    if ($('form.agent-sync-form').length > 0) {
//        $('#sync-date-picker').datetimepicker({
//            format: 'YYYY-MM-DD'
//        });
        $('form.agent-sync-form').on('submit', function (e) {
            var formData = $(this).serialize();
            var _btn = $(this).find('.btn');
            var _loader = $(this).find('.spin-img');
            _loader.removeClass('d-none');
            _btn.prop('disabled',true);
            $.ajax({
                type: "POST",
                data: formData,
                dataType: "JSON",
                cache: false,
                url: financeFoliage.ajaxurl,
                success: function (res)
                {
                    if (res.status === 200) {
                        _loader.addClass('d-none');
                         _btn.prop('disabled',false);
                        location.reload();
                    }

                    
                }
            });
            
            return false;
        });
    }
})(jQuery);
