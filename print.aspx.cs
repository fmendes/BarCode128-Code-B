using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using GenCode128;

namespace CoverSheetBarCode
{
	public partial class print : System.Web.UI.Page
	{
		protected string SHEET_ID = System.Configuration.ConfigurationManager.AppSettings["SheetIdViewStateName"].ToString();

		protected void Page_Load(object sender, EventArgs e)
		{
			// get the sheet id
			int iId	= Convert.ToInt32( Session[SHEET_ID] );

			// if Id is zero, do nothing
			if (iId == 0)
				return;

			// reset the session variable 
			//Session[SHEET_ID] = 0;

			string strId = iId.ToString("0");

			// generate the bar code image
			System.Drawing.Image	objImage	=
				Code128Rendering.MakeBarcodeImage( strId, 10, true );

			// create filename to save the barcode image
			string strImgFile = string.Format("{0}barcodes\\{1}_{2}.png"
					, HttpContext.Current.Request.PhysicalApplicationPath
					, Page.User.Identity.Name.Replace( "\\", "" )
					, strId);

			// remove old barcode images
			string[] strFiles	= Directory.GetFiles(
							string.Format( "{0}barcodes\\"
								, HttpContext.Current.Request.PhysicalApplicationPath )
							, string.Format("{0}_*.png"
								, Page.User.Identity.Name.Replace( "\\", "" ) ) );
			foreach( string strFile in strFiles )
				File.Delete( strFile );

			// save the new barcode
			objImage.Save( strImgFile );

			// plug the new barcode URL
			imgBarCode.ImageUrl = string.Format("~\\barcodes\\{0}_{1}.png"
					, Page.User.Identity.Name.Replace("\\", "")
					, strId);

		}
	}
}
