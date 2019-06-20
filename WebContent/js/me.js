// JavaScript Document
$(function () {
			"use strict";
			$('#login').bootstrapValidator({
				message: 'This value is not valid',
				feedbackIcons: {
					valid: 'glyphicon-ok glyphicon ',
					invalid: 'glyphicon-remove glyphicon ',
					validating: 'glyphicon-refresh glyphicon'
				},
				fields: {
					studno: {
						message: '学号验证失败',
						validators: {
							notEmpty: {
								message: '学号不能为空'
							},
							stringLength: {
								min: 12,
								max: 12,
								message: '学号长度为12位'
							},
							regexp: {
								regexp: /^[0-9]*$/,
								message: '学号只能包含数字'
							}
						}
					},
					studpw: {
						validators: {
							stringLength: {
								min: 6,
								max: 10,
								message: '密码长度最少为6位，最多为10位'
							},
							notEmpty: {
								message: '密码一定不能为空'
							}
						}
					}
				}
			});
});
// JavaScript Document