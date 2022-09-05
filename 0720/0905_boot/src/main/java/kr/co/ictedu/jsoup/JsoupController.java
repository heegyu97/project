package kr.co.ictedu.jsoup;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Connection;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping( value = "/jsoup" )
public class JsoupController {

	private final static Logger logger = LoggerFactory.getLogger(JsoupController.class);

	@RequestMapping( value = "/step3", method = RequestMethod.GET )
	public String step3( Model model ) throws IOException {

		String url = "http://www.joygm.com/news/articleList.html?sc_section_code=S1N3&view_type=sm";
		Connection con = Jsoup.connect(url);
		Document doc = con.get();
		Elements tileList = doc.select(".list-titles a");//.list-titles 안에 있는 a 태그를 의미함.

		List<JoyGMDTO> list = new ArrayList<JoyGMDTO>();
		for (Element title : tileList) {

			String contentsUrl = title.absUrl("href");
			Connection contentsConnection = Jsoup.connect(contentsUrl);
			Document contentsDocument = contentsConnection.get();
			Elements cnts = contentsDocument.select("#articleBody");

			JoyGMDTO dto = new JoyGMDTO();
			dto.setTitle( title.text() );
			dto.setLinkUrl( title.absUrl("href") );
			dto.setContents( cnts.html() );
			list.add(dto);

		}//for

		model.addAttribute("list", list);
		return "jsoup/step3";//jsp file name
	}//step3

	@RequestMapping( value = "/step2", method = RequestMethod.GET )
	public String step2() throws IOException {

		String url = "http://www.joygm.com/news/articleList.html?sc_section_code=S1N3&view_type=sm";
		Connection con = Jsoup.connect(url);

		Document doc = con.get();
		//System.out.println(doc);

		Elements titleList = doc.select(".list-titles");
		for (Element title : titleList) {
			System.out.println( title );
			//System.out.println( title.text() );
		}//for

		return "jsoup/step1";//jsp file name
	}//step2

	@RequestMapping( value = "/step1", method = RequestMethod.GET )
	public String step1() throws IOException {

		String url = "https://www.naver.com/";
		Connection con = Jsoup.connect(url);
		Document doc = con.get();

		System.out.println( doc );
		System.out.println( "==================" );
		//System.out.println( doc.select(".blind") );
		System.out.println( doc.title() );
		System.out.println( doc.select(".corp_area .blind") );
		System.out.println( doc.select(".corp_area .blind").text() );
		System.out.println( doc.select(".corp_area .blind").attr("class") );
		//System.out.println( doc.select(".corp_area .blind").html() );

		return "jsoup/step1";//jsp 파일 이름
	}//step1

}//class














