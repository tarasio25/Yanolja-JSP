package basketPage;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

	public class LoginFilter implements Filter{

		@Override
		public void destroy() {
		}

		@Override
		public void doFilter(ServletRequest request, ServletResponse response,
				FilterChain chain) throws IOException, ServletException {
			boolean flag = false;
			
			if(request instanceof HttpServletRequest){
				
				HttpServletRequest req = (HttpServletRequest)request;
				
				//���� �޾ƿ�
				HttpSession session = req.getSession();
				
				if(session!=null){
					//CustomInfo info = (CustomInfo)session.getAttribute("customInfo");
					//���ǿ� ���� �����͸� ���� �� ������ ������ ���� ������ Ŭ������ ����� �ϳ��� ����.
					if(session.getAttribute("usernum")!=null){
						flag = true;
					}
				}
				
				if(flag){
					//�α����� ������� true
					chain.doFilter(request, response);
				}else{
					//�α��� ���� �ʾ����Ƿ� �α����������� ������
					RequestDispatcher rd = request.getRequestDispatcher("/loginPage/loginPage.jsp");
					rd.forward(request, response);
				}
			}
		}

		@Override
		public void init(FilterConfig config) throws ServletException {
		}

	}