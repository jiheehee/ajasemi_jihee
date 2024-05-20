package com.aja.member.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 * Servlet implementation class KakaoTestServlet
 */
@WebServlet("/member/kakaopay.do")
public class KakaoPayServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
//    private static final String SECRET_KEY = "DEVBF2021C2D3DE4FF162C6913605225CFA6A541";

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {    	
    	
        resp.setContentType("application/json");
        resp.setCharacterEncoding("UTF-8");

        StringBuilder sb = new StringBuilder();
        try (BufferedReader reader = req.getReader()) {
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
        }

        JSONParser parser = new JSONParser();
        try {
            JSONObject requestJson = (JSONObject) parser.parse(sb.toString());
            //kakaopayapi url주소 설정후 header와 method 설정해주고 url주소로 이동하니다.
            URL url = new URL("https://open-api.kakaopay.com/online/v1/payment/ready");
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Authorization", "SECRET_KEY DEVBF2021C2D3DE4FF162C6913605225CFA6A541");
            connection.setRequestProperty("Content-Type", "application/json");
            connection.setDoOutput(true);
            
            //밑에코드들은 response객체를 가져오는 것 같습니다.
            //fetch후 response.json()후 response data를 가져오는 로직이고 error메세지가 있다면 error메세지도 가져옵니다.
            try (OutputStream os = connection.getOutputStream()) {
                byte[] input = requestJson.toString().getBytes("utf-8");
                os.write(input, 0, input.length);
            }

            int responseCode = connection.getResponseCode();
            BufferedReader br;
            if (200 <= responseCode && responseCode <= 299) {
                br = new BufferedReader(new InputStreamReader(connection.getInputStream(), "utf-8"));
            } else {
                br = new BufferedReader(new InputStreamReader(connection.getErrorStream(), "utf-8"));
            }

            StringBuilder response = new StringBuilder();
            String responseLine;
            while ((responseLine = br.readLine()) != null) {
                response.append(responseLine.trim());
            }

            resp.setStatus(responseCode);
            resp.getWriter().write(response.toString());
        } catch (ParseException e) {
            resp.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            JSONObject errorResponse = new JSONObject();
            errorResponse.put("error", "Invalid JSON format: " + e.getMessage());
            resp.getWriter().write(errorResponse.toString());
        } catch (Exception e) {
            resp.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            JSONObject errorResponse = new JSONObject();
            errorResponse.put("error", e.getMessage());
            resp.getWriter().write(errorResponse.toString());
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);
    }
}
