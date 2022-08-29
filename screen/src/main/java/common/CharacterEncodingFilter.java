package common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.http.HttpFilter;

@WebFilter(
		urlPatterns = { "/*" }, 
		initParams = { 
				@WebInitParam(name = "encoding", value = "utf-8")
		})
public class CharacterEncodingFilter extends HttpFilter implements Filter {
	private static final long serialVersionUID = 1L;
	FilterConfig config;
	
    public CharacterEncodingFilter() {
        super();
    }

	@Override
	public void destroy() {
		System.out.println("인코딩 필터 종료: destoy() 호출");
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		/*System.out.println("doFilter() 호출");*/
		//요청필터기능
		long begin = System.currentTimeMillis();
		
		request.setCharacterEncoding(config.getInitParameter("encoding"));
		
		chain.doFilter(request, response);
		//응답필터기능
		/*System.out.println("응답필터 시작------");*/
		long end = System.currentTimeMillis();
		/*System.out.println("작업시간: " +(end-begin)+"ms");*/
	}

	@Override
	public void init(FilterConfig fConfig) throws ServletException {
		this.config=fConfig;
		System.out.println("인코딩 초기값 설정: init() 호출");
	}

}
