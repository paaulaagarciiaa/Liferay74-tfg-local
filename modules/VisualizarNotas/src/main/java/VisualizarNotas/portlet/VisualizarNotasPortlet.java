package VisualizarNotas.portlet;

import VisualizarNotas.constants.VisualizarNotasPortletKeys;
import VisualizarNotas.portlet.StudentData;

import com.liferay.portal.kernel.portlet.bridges.mvc.MVCPortlet;

import javax.portlet.Portlet;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.osgi.service.component.annotations.Component;

import java.io.IOException;
import java.util.List;

/**
 * @author pgarcrod
 */
@Component(
	immediate = true,
	property = {
		"com.liferay.portlet.display-category=category.sample",
		"com.liferay.portlet.header-portlet-css=/css/main.css",
		"com.liferay.portlet.instanceable=true",
		"javax.portlet.display-name=VisualizarNotas",
		"javax.portlet.init-param.template-path=/",
		"javax.portlet.init-param.view-template=/view.jsp",
		"javax.portlet.name=" + VisualizarNotasPortletKeys.VISUALIZARNOTAS,
		"javax.portlet.resource-bundle=content.Language",
		"javax.portlet.security-role-ref=power-user,user"
	},
	service = Portlet.class
)
public class VisualizarNotasPortlet extends MVCPortlet {

	@Override
	public void doView(RenderRequest renderRequest, RenderResponse renderResponse) throws IOException, PortletException {
		// Obtener el ID del usuario actual
		String userIdString = renderRequest.getRemoteUser();
		int userId = 0;
		if (userIdString != null) {
			userId = Integer.parseInt(userIdString);
		}

		// Obtener las notas del estudiante desde el repositorio en memoria
		List<StudentData> grades = GradesRepository.getGradesByStudentId(userId);

		// Pasar las notas al JSP
		renderRequest.setAttribute("grades", grades);

		super.doView(renderRequest, renderResponse);
	}
}