/**
 * @license Copyright (c) 2003-2019, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see https://ckeditor.com/legal/ckeditor-oss-license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';

    config.height = '111px'; //�i�H�o�˼g
    config.width = '500px';
    config.height = '500px';



    config.filebrowserBrowseUrl = '/backend/Scripts/ckfinder/ckfinder.html';

    config.filebrowserImageBrowseUrl = '/backend/Scripts/ckfinder/ckfinder.html?type=Images';

    //config.filebrowserFlashBrowseUrl = '/backend/Scripts/ckfinder/ckfinder.html?type=Flash';

    config.filebrowserUploadUrl = '/backend/Scripts/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Files';

    config.filebrowserImageUploadUrl = '/backend/Scripts/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Images';

    //config.filebrowserFlashUploadUrl = '/backend/Scripts/ckfinder/core/connector/aspx/connector.aspx?command=QuickUpload&type=Flash';

    config.filebrowserWindowWidth = '800'; //���s���A�Ⱦ����u�X�ت�size�]�m
    config.filebrowserWindowHeight = '500';
   
};
